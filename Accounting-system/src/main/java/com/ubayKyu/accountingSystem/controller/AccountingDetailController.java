package com.ubayKyu.accountingSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountingDetailController {
	@GetMapping("/AccountingDetail")
	public String AccountingDetail() {
		return "AccountingDetail";
	}
}