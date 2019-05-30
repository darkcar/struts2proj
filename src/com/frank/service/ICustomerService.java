package com.frank.service;

import java.util.List;

import com.frank.domain.Customer;

/**
 * Customer Interface 
 * @author k11237
 *
 */
public interface ICustomerService {

	/**
	 * Find all customers
	 * @return
	 */
	List<Customer> findAllCustomer();
}
