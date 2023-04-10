package com.example.SportyShoesApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.SportyShoesApp.entity.Orders;
import com.example.SportyShoesApp.repository.OrderRepository;
import com.example.SportyShoesApp.repository.ProductRepository;
import com.example.SportyShoesApp.repository.UserRepository;

@Controller
public class PurchaseOrderController {

	@Autowired
	OrderRepository orderRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	ProductRepository prodRepo;
	
	@RequestMapping("/viewPurchase")
	public String getAllOrders(ModelMap model)
	{
		List<Orders>order_list=orderRepo.findAll();
		model.addAttribute("order_list", order_list);
		return  "viewPurchaseOrder";
	}
	
}
