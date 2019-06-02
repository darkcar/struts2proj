package com.frank.dao.impl;

import java.util.List;

import com.frank.dao.ICustomerDao;
import com.frank.domain.Customer;
import com.frank.utils.HibernateUtil;

/**
 * Customer Dao Impl
 * @author k11237
 *
 */
public class CustomerDaoImpl implements ICustomerDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> findAllCustomer() {
		return HibernateUtil.getSessionFactory().openSession().createQuery("from Customer").list() ;
	}

	@Override
	public void saveCustomer(Customer customer) {
		HibernateUtil.getSessionFactory().openSession().saveOrUpdate(customer);
	}

	@Override
	public void deleteCustomer(Customer customer) {
		HibernateUtil.getSessionFactory().openSession().remove(findCustomerById(customer.getCustId()));
	}

	@Override
	public Customer findCustomerById(long custId) {
		return HibernateUtil.getSessionFactory().openSession().get(Customer.class, custId);
	}
}
