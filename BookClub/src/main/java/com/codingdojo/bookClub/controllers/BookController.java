package com.codingdojo.bookClub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.bookClub.models.Book;
import com.codingdojo.bookClub.models.User;
import com.codingdojo.bookClub.services.BookService;
import com.codingdojo.bookClub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BookController {
	@Autowired 
	private BookService bookservice;
	@Autowired 
	private UserService userservice;
	@GetMapping("/books")
    public String index(@ModelAttribute("book") Book book,Model model,HttpSession s) {
		
		   	//Route guard
   
    	   Long userId = (Long)s.getAttribute("user_id");
    	 
    	    if(userId == null) {
    	    	return "redirect:/";
    	    }else {
    	    User loggedUser = userservice.findUser(userId);
    	    // the list of unfavorites books
    	   List<Book> unfavoritesBooks = bookservice.getUnfavoritiesBooks(loggedUser);
    	   // the list of favorites books
    	   List<Book> favoritesBooks = bookservice.getFavoritiesBooks(loggedUser);  	
    			model.addAttribute("loggedUser",loggedUser);
    			model.addAttribute("favoritesBooks",favoritesBooks);
    			model.addAttribute("unfavoritesBooks",unfavoritesBooks);
    			return "/Books/books.jsp";}
    
    }
	// create a book 
	 @PostMapping("/createbook")
	    public String create(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession s) {
		   	//Route guard
		   
  	   Long userId = (Long)s.getAttribute("user_id");
  	 
  	    if(userId == null) {
  	    	return "redirect:/";
  	    }else {
  	       User loggedUser = userservice.findUser(userId);
	    	if (result.hasErrors()) {
	            return "/Books/books.jsp";
	        } else {
	        	book.setAuthor(loggedUser);
	        	//book.setUsers(null)
	            loggedUser.getBooks().add(book);	
	            bookservice.addBook(book);
	      
	  
	    	return "redirect:/books";
	        }
	    }}
	
	 
	// edit
	    @GetMapping("/books/{id}")
	    public String editforCreator(@PathVariable("id") Long id, Model model,HttpSession s) {
	       	//Route guard
	    	   
	    	   Long userId = (Long)s.getAttribute("user_id");
	    	 
	    	    if(userId == null) {
	    	    	return "redirect:/";
	    	    }else {
	    	    User loggedUser = userservice.findUser(userId);
	            Book book = bookservice.findById(id);
	            model.addAttribute("loggedUser", loggedUser);
	            model.addAttribute("id", id);
	            model.addAttribute("book", book);
	            if(book.getAuthor().getId().equals(userId)) {
	            	 return "/Books/editforcreator.jsp";
	            }
	            else {
	            	 return "/Books/editforviewer.jsp";
	            }
	            
	       
	    }
	    	    }
	    @PutMapping(value="/book/{id}")
	    public String update(@Valid @ModelAttribute("book") Book book, BindingResult result,@PathVariable("id") Long id,HttpSession s, Model model) {
	        if (result.hasErrors()) {
	   
	            return "/books/editforcreator.jsp";
	        } else {
	        	Long userId = (Long)s.getAttribute("user_id");
	        	User loggedUser = userservice.findUser(userId);
	        	Book oldbook = bookservice.findById(id);
	        	book.setAuthor(loggedUser);
	        	book.setUsers(oldbook.getUsers());
	        	 bookservice.updateBook(book);
	            return "redirect:/books";
	        }
	    }
	    // add to favorite
		 @RequestMapping("/books/favorites/{id}")
		 public String addFavorite(@PathVariable("id") Long id, Model model,HttpSession s) {
			//Route guard
			   
		  	   Long userId = (Long)s.getAttribute("user_id");
		  	 
		  	    if(userId == null) {
		  	    	return "redirect:/";
		  	    }else {
		  	       User loggedUser = userservice.findUser(userId);
		  	       Book favbook = bookservice.findById(id);
		  	       favbook.getUsers().add(loggedUser);
		  	       bookservice.updateBook(favbook);
		  	    
		  	     return "redirect:/books";
		  	       }
		 }
		 
		 
	    // remove book from favorite list 
	    @GetMapping("/books/unfavorite/{id}")
	    public String unfavoriteBook(@PathVariable("id") Long id, Model model,HttpSession s) {
			//Route guard
			   
		  	   Long userId = (Long)s.getAttribute("user_id");
		  	 
		  	    if(userId == null) {
		  	    	return "redirect:/";
		  	    }else {
		  	       User loggedUser = userservice.findUser(userId);
		  	       Book book = bookservice.findById(id);
		  	       book.getUsers().remove(loggedUser);
		  	       bookservice.updateBook(book);
		  	     return "redirect:/books";
		  	       }
	    }
	    
	    // delete a book 
	    @DeleteMapping(value="/books/{id}/delete")
	    public String destroy(@PathVariable("id") Long id) {
	        bookservice.deleteBook(id);
	        return "redirect:/books";
	    }
}
