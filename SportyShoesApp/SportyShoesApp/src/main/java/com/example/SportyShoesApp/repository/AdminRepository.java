package com.example.SportyShoesApp.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.SportyShoesApp.entity.Admin;

public interface AdminRepository extends CrudRepository<Admin, Integer> {

	Admin findByUsername(String string);

}
