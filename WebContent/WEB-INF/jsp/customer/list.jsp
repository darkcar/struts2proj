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
        <h1>All Customers</h1>
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
                  </tr>
                </tfoot>
                <tbody>
                  <c:forEach items="${customers }" var="customer">
	                  <tr>
	                    <td>${customer.custName }</td>
	                    <td>${customer.custIndustry }</td>
	                    <td>${customer.custLevel }</td>
	                    <td>${customer.custAddress }</td>
	                    <td>${customer.custPhone }</td>
	                    <td>${customer.custSource }</td>
	                  </tr>
                  	</c:forEach>
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