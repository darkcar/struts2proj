package junit.test;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.frank.domain.Customer;
import com.frank.service.ICustomerService;
import com.frank.service.impl.CustomerServiceImpl;

/**
 * Test Customer Service and Persistence Layer
 * @author k11237
 *
 */
class CustomerDaoTest {

	@Test
	void testFindAllCustomer() {
		ICustomerService customerService = new CustomerServiceImpl();
		List<Customer> customers = customerService.findAllCustomer();
		for(Customer customer : customers) {
			System.out.println(customer);
		}
	}

}
