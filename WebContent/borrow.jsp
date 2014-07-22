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
                
            	$("#members").append('<option id="' + obj.memberID + '">' + obj.memberID + '</option>');

			});
        },
        error: function (xhr,textStatus,thrownError) {
        	alert("Error!!!");
        }
    });

    $.ajax({
    	type: "GET",
        url: "http://localhost:8080/library_service-0.0.1-SNAPSHOT/rs/library/getbooks",
        data: "{}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            $.each(data, function (i, obj) {
                
            	$("#books").append('<option id="' + obj.bookId + '">' + obj.bookId + '</option>');

			});
        },
        error: function (xhr,textStatus,thrownError) {
        	alert("Error!!!");
        }
    });

	$( "#save" ).click(function() {

		var lendData={
                "memberId": $("#members").val(),
                "bookId": $("#books").val(),
                "dueReturnDate": $("#duedate").val(),
                "comments":$("#comments").val()
            };
        
		$.ajax({
            type: "POST",
            url: "http://localhost:8080/library_service-0.0.1-SNAPSHOT/rs/library/lendBook",
            data: JSON.stringify(lendData),
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
<tr><td>Member ID</td><td><select id="members"></select></td></tr>
<tr><td>Book ID</td><td><select id="books"></select></td></tr>
<tr><td>Due Return Date</td><td><input type="text" id="duedate">date format(dd-MM-yyyy)</td></tr>
<tr><td>Comments</td><td><textarea id="comments"></textarea></td></tr>
<tr><td colspan="2"><input type="button" id="save" value="Save"></td></tr>
</table><br>
<div id="msg"></div>
<br>
<a href="http://localhost:8080/library_client-0.0.1-SNAPSHOT/index.jsp">Back</a>
</body>

</html>