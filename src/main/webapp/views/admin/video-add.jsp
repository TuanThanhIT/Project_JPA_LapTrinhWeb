<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<form action="<c:url value='/admin/video/insert'></c:url>" method="post" enctype="multipart/form-data">
	<img height="150" width="200" src="" id="imagess" /><br> 
	<label for="fname">Upload:</label><br> <input type="file"
		onchange="chooseFile(this)" id="images" name="images"><br>
	<label for="fname">Video ID:</label><br>
	 <input type="text" id="videoid" name="videoid"><br> 
	 <label for="fname">Video Title:</label><br> 
	 <input type="text" id="videotitle" name="videotitle"><br>
	<label for="fname">Video Count:</label><br>
	<input type="text" id="videocount" name="videocount" value = "0"><br> 
	<label for="fname">Category:</label>
	<br> <select id="category" name="categoryId">
		<c:forEach items="${categories}" var="category">
			<option value="${category.categoryId}">${category.categoryname}</option>
		</c:forEach>
	</select><br> 
	<label for="fname">Description:</label><br>
	<textarea id="description" name="description" rows="4" cols="40"></textarea><br>
	<label for="fname">Status:</label>
	<input type="radio" id="ston" name="status" value="1" checked>
	<label for="html">Đang hoạt động</label>
	 <input type="radio" id="stoff" name="status" value="0"> 
	 <label for="css">Khóa</label><br>
	<input type="submit" value="Create">
</form>