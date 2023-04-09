package com.example.SportyShoesApp.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.SportyShoesApp.entity.Orders;

public interface OrderRepository extends CrudRepository<Orders, Integer>{
	//Orders findByName(String name);
}
