package com.frank.dao;

import java.util.List;

import com.frank.domain.Customer;

/**
 * Customer dao interface
 * @author k11237
 *
 */
public interface ICustomerDao {
	/**
	 * Find all customer
	 * @return
	 */
	List<Customer> findAllCustomer();
	
	/**
	 * Save Customer in Dao
	 * @param customer
	 */
	void saveCustomer(Customer customer);

	/**
	 * Delete Customer
	 * @param customer
	 */
	void deleteCustomer(Customer customer);

	/**
	 * Find Customer by Id
	 * @param custId
	 */
	Customer findCustomerById(long custId);
}
