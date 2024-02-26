package com.sample.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@GetMapping(path = "/list")
	public String list() {
		return "product/list"; // "/WEB-INF/views/product/list.jsp"로 내부이동
	}
	
	@GetMapping(path = "/create")
	public String form() {
		return "product/form"; // "/WEB-INF/views/product/form.jsp"로 내부이동
	}
	
}
