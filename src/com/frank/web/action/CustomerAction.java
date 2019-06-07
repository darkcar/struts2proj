package com.frank.web.action;

import java.util.ArrayList;
import java.util.List;


import com.frank.domain.Customer;
import com.frank.service.ICustomerService;
import com.frank.service.impl.CustomerServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Customer Action
 * @author k11237
 *
 */
public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{
	
	private static final long serialVersionUID = 1L;
	private ICustomerService customerService = new CustomerServiceImpl();
	
	// Implement ModelDrive
	private Customer customer = new Customer();
	
	// --- Add customers to value stack 
	private List<Customer> customers = new ArrayList<Customer>();
	
	@Override
	public Customer getModel() {
		return customer;
	}
	// Must have getCustomer
	public Customer getCustomer() {
		return customer;
	}
	
	
	public String addUICustomer() {
		return "addUICustomer";
	}
	
	public String findAllCustomer() {
//		List<Customer> customers = customerService.findAllCustomer();
//		HttpServletRequest request = ServletActionContext.getRequest();
//		
//		request.setAttribute("customers", customers);
		customers = customerService.findAllCustomer();
		
		return "findAllCustomer";
	}
	
	/**
	 * Add Customer
	 * @return
	 */
	public String addCustomer() {
		customerService.saveCustomer(customer);
		return "addCustomer";
	}
	
	/**
	 * Delete Customer
	 * @return
	 */
	public String deleteCustomer() {
		customerService.deleteCustomer(customer);
		return "deleteCustomer";
	}
	
	// ------ Getters and Setter
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	
}





