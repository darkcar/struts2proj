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
}
