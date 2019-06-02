package com.frank.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.frank.dao.ICustomerDao;
import com.frank.dao.impl.CustomerDaoImpl;
import com.frank.domain.Customer;
import com.frank.service.ICustomerService;
import com.frank.utils.HibernateUtil;

/**
 * Implment Customer Service
 * @author k11237
 *
 */
public class CustomerServiceImpl implements ICustomerService{
	
	private ICustomerDao customerDao = new CustomerDaoImpl();
	
	@Override
	public List<Customer> findAllCustomer() {
		Session session = null;
		Transaction transaction = null;
		try {
			// Get Session
			session = HibernateUtil.getSessionFactory().openSession();
			// Open Transaction 
			transaction = session.beginTransaction();
			// Execute Operation
			List<Customer> customers = customerDao.findAllCustomer();
			// Commit Transaction
			transaction.commit();
			// Return Result
			return customers;
		} catch (Exception e) {
			// Roll back 
			transaction.rollback();
			throw new RuntimeException(e);
		} finally {
			session.close();
		}
	}

	@Override
	public void saveCustomer(Customer customer) {
		Session session = null;
		Transaction transaction = null;
		try {
			// Get Session
			session = HibernateUtil.getSessionFactory().openSession();
			// Open Transaction 
			transaction = session.beginTransaction();
			// Execute Operation
			customerDao.saveCustomer(customer);
			// Commit Transaction
			transaction.commit();
		} catch (Exception e) {
			// Roll back 
			transaction.rollback();
			throw new RuntimeException(e);
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteCustomer(Customer customer) {
		Session session = null;
		Transaction transaction = null;
		try {
			// Get Session
			session = HibernateUtil.getSessionFactory().openSession();
			// Open Transaction 
			transaction = session.beginTransaction();
			// Execute Operation
			customerDao.deleteCustomer(customer);
			// Commit Transaction
			transaction.commit();
		} catch (Exception e) {
			// Roll back 
			transaction.rollback();
			throw new RuntimeException(e);
		} finally {
			session.close();
		}
	}

	
}
