package com.frank.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.frank.domain.Customer;
import com.frank.service.ICustomerService;
import com.frank.service.impl.CustomerServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Customer Action
 * @author k11237
 *
 */
public class CustomerAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private ICustomerService customerService = new CustomerServiceImpl();
	
	public String findAllCustomer() {
		List<Customer> customers = customerService.findAllCustomer();
		HttpServletRequest request = ServletActionContext.getRequest();
		
		request.setAttribute("customers", customers);
		return "findAllCustomer";
	}
}
