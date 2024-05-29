<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
		
	<div class="main-panel">

	 
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between flex-wrap">
                <div class="d-flex align-items-end flex-wrap">
                  <div class="mr-md-3 mr-xl-5">
                    <h2>Xin chào, Admin</h2>
                   
                    <div class="d-flex">
                      <i class="mdi mdi-home text-muted hover-cursor"></i>
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Bảng điều khiển&nbsp;&nbsp;</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <canvas id="bar-chart" width="100px" height="50px"></canvas>
             
	<script type="text/javascript">
	// Bar chart
	new Chart(document.getElementById("bar-chart"), {
	    type: 'bar',
	    data: {
	      labels: [<c:forEach var="item" items="${chart}">'${item.date}',</c:forEach>],
	      datasets: [
	        {
	          label: "Population (millions)",
	          backgroundColor: [],
	          data: [<c:forEach var="item" items="${chart}">${item.total},</c:forEach>]
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: 'Thống kê'
	      }
	    }
	});
	</script>
            </div>
          </div>

        </div>	



	
</body>
