package com.codingdojo.bookClub.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.bookClub.models.Book;
import com.codingdojo.bookClub.models.User;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll();
	Optional<Book> findById(Long id);
	List<Book> findAllByUsers(User user);
	List<Book> findByUsersNotContains(User user);

}
