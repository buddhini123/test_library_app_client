<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>

$(document).ready(function() {
	
    $.ajax({
    	type: "GET",
        url: "http://localhost:8080/library_service-0.0.1-SNAPSHOT/rs/library/getmembers",
        data: "{}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            $.each(data, function (i, obj) {
                
				$("#member_list").append($('<BR>' + obj.firstName + ' ' + obj.lastName + '<BR>'));     });
        },
        error: function (xhr,textStatus,thrownError) {
        	alert("Error!!!");
        }
    });
});
</script>

</head>
<body>
<div id="member_list">
</div><br>
<a href="http://localhost:8080/library_client-0.0.1-SNAPSHOT/index.jsp">Back</a>
</body>
</html>