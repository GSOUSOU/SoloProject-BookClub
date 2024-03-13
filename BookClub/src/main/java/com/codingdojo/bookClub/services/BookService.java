package com.codingdojo.bookClub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.bookClub.models.Book;
import com.codingdojo.bookClub.models.User;
import com.codingdojo.bookClub.repositories.BookRepository;


@Service
public class BookService {
	@Autowired
	private BookRepository bookrepo;
	
	
	public List<Book> allBooks(){
		return bookrepo.findAll();
	}
	
	public Book updateBook(Book book) {
		return bookrepo.save(book);
	}
	
	public List<Book> getFavoritiesBooks(User user){
		return bookrepo.findAllByUsers(user);
	}
	
	public List<Book> getUnfavoritiesBooks(User user){
		return bookrepo.findByUsersNotContains(user);
	}
	
	public Book addBook(Book book) {
		return bookrepo.save(book);
	}
	
	public void deleteBook(Long id) {
    	bookrepo.deleteById(id);
    }
	
	public Book findById(Long id) {
		Optional<Book> optionalBook = bookrepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}else {
			return null;
		}
	}
	
}
