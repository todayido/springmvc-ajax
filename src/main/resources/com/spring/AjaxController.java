package com.spring;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class AjaxController {

	private static int a = 0; 
	@RequestMapping("ajax")
	public void ajax(String name, HttpServletResponse response) throws IOException{
		
		System.out.println(a++);
		
		if("hmm".equals(name)){
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}
	
	@RequestMapping("json")
	@ResponseBody
	public List<User> json(){
		List list = new ArrayList();
		list.add(new User(1, "zhangsan", "男"));
		list.add(new User(2, "lisi", "女"));
		list.add(new User(3, "wangwu", "男"));
		return list;
	}
	
}
