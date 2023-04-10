package com.example.SportyShoesApp.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.SportyShoesApp.entity.Orders;

public interface OrderRepository extends CrudRepository<Orders, Integer>{
	List<Orders> findAll();
}
