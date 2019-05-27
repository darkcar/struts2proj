package com.frank.web.struts;

import com.opensymphony.xwork2.ActionSupport;

public class HelloAction extends ActionSupport {
	public String sayHello() {
		System.out.println("HelloAction");
		return SUCCESS;
	}
}