package com.frank.web.user;

import com.opensymphony.xwork2.ActionSupport;

public class UserManagementAction extends ActionSupport{
	
	public String addUser() {
		System.out.println("Add User");
		return SUCCESS;
	}
	
	public String updateUser() {
		System.out.println("Update User");
		return SUCCESS;
	}
}
