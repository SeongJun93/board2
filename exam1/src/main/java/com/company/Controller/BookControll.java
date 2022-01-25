package com.company.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookControll {
	@RequestMapping(value="/book",method=RequestMethod.POST)
	public String BookPage() {
		return "book/book";
	}
}
