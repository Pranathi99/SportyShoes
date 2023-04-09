package com.example.SportyShoesApp.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.SportyShoesApp.entity.User;

public interface UserRepository extends CrudRepository<User, Integer>{

	User findByUsername(String username);
	User findById(int id);
	List<User> findAll();
	
}
