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
        url: "http://localhost:8080/library_service-0.0.1-SNAPSHOT/rs/library/getlastmember",
        data: "{}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
        	$("#last").text(data.memberID);
        },
        error: function (xhr,textStatus,thrownError) {
        	alert("Error!!!");
        }
    });
	
	$( "#save" ).click(function() {

		var memberData={
                "regNo": $("#reg").val(),
                "firstName": $("#fname").val(),
                "lastName": $("#lname").val(),
                "nic":$("#nic").val()
            };
        
		$.ajax({
            type: "POST",
            url: "http://localhost:8080/library_service-0.0.1-SNAPSHOT/rs/library/createmember",
            data: JSON.stringify(memberData),
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                $("#msg").text(data.msg);
            },
            error: function (xhr,textStatus,thrownError) {
            	$("#msg").text("An Error Occured!");
            }
        });
	  

	});


});
</script>

</head>
<body>

<table>
<tr><td>Registration Number</td><td><input type="text" id="reg">Last Registration Number:<label id="last"></label></td></tr>
<tr><td>First Name</td><td><input type="text" id="fname"></td></tr>
<tr><td>Last Name</td><td><input type="text" id="lname"></td></tr>
<tr><td>NIC</td><td><input type="text" id="nic" maxlength="10"></td></tr>
<tr><td colspan="2"><input type="button" id="save" value="Save"></td></tr>
</table>
<div id="msg"></div><br><br>

<a href="http://localhost:8080/library_client-0.0.1-SNAPSHOT/index.jsp">Back</a>
</body>

</html>