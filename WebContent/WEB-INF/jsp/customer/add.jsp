<%@include file="/includes/header.jsp" %>
<%@include file="/includes/nav.jsp" %>

	<div id="content-wrapper">
      <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="index.html">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Customers</li>
        </ol>

        <!-- Page Content -->
        <h2>Add New Customer</h2>
        <hr>
        
        <!-- Add New Customer Form -->
		<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-user"></i>
            Add New Customer</div>
          <div class="card-body">
           	<form action="${pageContext.request.contextPath }/customer/addCustomer" method="post">
           		<div class="form-group">
           			<label for="customername">Name:</label>
           			<input type="text" class="form-control" id="customername" name="custName"/>
           		</div>
           		<div class="form-group">
           			<label for="custIndustry">Industry Category:</label>
           			<input type="text" class="form-control" id="custIndustry" name="custIndustry"/>
           		</div>
           		<div class="form-group">
           			<label for="custSource">Info Source:</label>
           			<select class="form-control" id="custSource" name="custSource">
           				<option value="22">Internet</option>
           				<option value="23">Customer Recommendation</option>
           			</select>
           		</div>
           		<div class="form-group">
           			<label for="custLevel">Level:</label>
           			<select class="form-control" id="custLevel" name="custLevel">
           				<option value="6">Regular</option>
           				<option value="7">VIP</option>
           			</select>
           		</div>
           		<div class="form-group">
           			<label for="custAddress">Address:</label>
           			<input type="text" id="custAddress" name="custAddress" class="form-control">
           		</div>
           		<div class="form-group">
           			<label for="custPhone">Phone:</label>
           			<input type="text" id="custPhone" name="custPhone" class="form-control">
           		</div>
           		<button type="submit" class="btn btn-primary">Add</button>
           	</form>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
      </div>
      <!-- /.container-fluid -->


<%@include file="/includes/footer.jsp" %>