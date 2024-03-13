package com.codingdojo.bookClub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.bookClub.models.LoginUser;
import com.codingdojo.bookClub.models.User;
import com.codingdojo.bookClub.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
    public User register(User newUser, BindingResult result) {
    	//if  the email is already taken
    	if(userRepository.findByEmail(newUser.getEmail()).isPresent()) {
    		result.rejectValue("email", "istaken", "this email already exist !");
    	}
    	//Password Confirmation - matches password
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
        	result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        // Return null if result has errors
    if(result.hasErrors()) {
    	return null;
    }else {
    	// Hashing password and creating a user 
    	String hashedPW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashedPW);
    	return userRepository.save(newUser);
    	
    }
    }
    
    public User login(LoginUser newLoginObject, BindingResult result) {
    	 
   // Check whether the email provided is associated with a user in the database
        	Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());
        	// Reject if NOT present
        	if(!potentialUser.isPresent()) {
        		result.rejectValue("email", "istaken", "this email does not exist!");
        		return null;
        	}
   // user exists, check whether the password matches what's saved in the database 
        	User user = potentialUser.get();
        		 // Reject if BCrypt password match fails
            	if(!BCrypt.checkpw(newLoginObject.getPassword(),user.getPassword())) {
            	    result.rejectValue("password", "Matches", "Invalid Password!");
            	}
        	
      // Return null if result has errors
        	if(result.hasErrors()) {
        		return null;
        	}else {
        	
        		return user;
        	} 
    }
    public User findUser(Long id) {
    	Optional<User> user = userRepository.findById(id);
    	if(! user.isPresent()) {
    		return null;
    	}else {
    		return user.get();
    	}
    }
    public User updateUser(User user) {
		return userRepository.save(user);
	}
}


