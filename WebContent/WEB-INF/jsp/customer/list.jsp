<%@include file="/includes/header.jsp" %>
<script>
	function delOne(custId) {
		var sure = window.confirm("Are you sure to delete?");
		if(sure) {
			window.location.href="${pageContext.request.contextPath}/customer/deleteCustomer?custId="+custId;
		}
	}
</script>
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
        <h2>All Customers</h2>
        <hr>
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Industry</th>
                    <th>Level</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Source</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
	                <tr>
	                    <th>Name</th>
	                    <th>Industry</th>
	                    <th>Level</th>
	                    <th>Address</th>
	                    <th>Phone</th>
	                    <th>Source</th>
	                    <th>Action</th>
                  </tr>
                </tfoot>
                <tbody>
                  <%-- <c:forEach items="${customers }" var="customer">
	                  <tr>
	                    <td>${customer.custName }</td>
	                    <td>${customer.custIndustry }</td>
	                    <td>${customer.custLevel }</td>
	                    <td>${customer.custAddress }</td>
	                    <td>${customer.custPhone }</td>
	                    <td>${customer.custSource }</td>
	                    <td><a href="#" class="btn btn-link btn-sm">Edit</a> 
	                    	<a href="javascript:delOne(${customer.custId})" class="btn btn-danger btn-sm">Delete</a>
	                    </td>
	                  </tr>
                  	</c:forEach> --%>
                  	<s:iterator value="customers">
                  	<tr>
	                    <td>${custName }</td>
	                    <td>${custIndustry }</td>
	                    <td>${custLevel }</td>
	                    <td>${custAddress }</td>
	                    <td>${custPhone }</td>
	                    <td>${custSource }</td>
	                    <td><a href="#" class="btn btn-link btn-sm">Edit</a> 
	                    	<a href="javascript:delOne(${custId})" class="btn btn-danger btn-sm">Delete</a>
	                    </td>
	                  </tr>
	                  </s:iterator>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

<%@include file="/includes/footer.jsp" %>