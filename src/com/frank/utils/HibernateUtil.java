package com.frank.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate Utils Class
 * @author k11237
 *
 */
public class HibernateUtil {
	private static final Configuration cfg;
	private static final SessionFactory sessionFactory;
	static {
		cfg = new Configuration();
		cfg.configure();
		sessionFactory = cfg.buildSessionFactory();
	}
	
	/**
	 * Get Session Factory
	 * @return sessionFactory
	 */
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}
