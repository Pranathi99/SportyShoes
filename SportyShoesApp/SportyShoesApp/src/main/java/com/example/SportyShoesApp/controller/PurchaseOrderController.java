package com.example.SportyShoesApp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		Map<String,List<Orders>>orders=new HashMap<String,List<Orders>>();
		for(Orders order:order_list)
		{
			if(orders.get(order.getDate_time())==null)
			{
				List<Orders>list=new ArrayList<Orders>();
				list.add(order);
				orders.put(order.getDate_time(),list);
			}
			else
			{
				List<Orders>list=orders.get(order.getDate_time());
				list.add(order);
				orders.put(order.getDate_time(),list);
			}
		}
		model.addAttribute("order_list", orders);
		return  "viewPurchaseOrder";
	}
	
}
