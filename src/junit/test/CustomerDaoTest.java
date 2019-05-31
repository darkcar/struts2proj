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
	
	@Test
	void testSaveCustomer() {
		Customer customer = new Customer();
		customer.setCustName("Frank Wang");
		customer.setCustIndustry("Government");
		customer.setCustLevel("7");
		customer.setCustPhone("1-306-2920123");
		customer.setCustSource("3");
		customer.setCustAddress("110 Regina, SK");
		ICustomerService customerService = new CustomerServiceImpl();
		customerService.saveCustomer(customer);
	}

}
