package com.example.SportyShoesApp.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.SportyShoesApp.entity.Product;

public interface ProductRepository extends CrudRepository<Product, Integer> {
	
	Product findByName(String name);
	List<Product> findByCategory(String name); 
	Product findById(int id);
	List<Product> findAll();
}
