package com.ubayKyu.accountingSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserProfileController {
	@GetMapping("/UserProfile")
	public String UserProfile() {
		return "UserProfile";
	}
}
