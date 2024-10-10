<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<h2>Edit Video</h2>
<form action="<c:url value='/admin/video/update'></c:url>" method="post"
	enctype="multipart/form-data">
	<input type="text" id="videoid" name="videoid" hidden="hidden" value="${video.videoId}"><br> 
	<label for="videotitle">Video Title:</label><br> <input type="text" id="videotitle" name="videotitle" value="${video.title}"><br> 
	<label for="videocount">Video Count:</label><br> 
	<input type="text" id="videocount" name="videocount" value="${video.views}"><br> <label for="category">Category:</label><br>
	<select id="category" name="categoryId">
		<c:forEach items="${categories}" var="category">
			<option value="${category.categoryId}"
				${category.categoryId == video.category.categoryId ? 'selected' : ''}>
				${category.categoryname}</option>
		</c:forEach>
	</select><br> 
	<label for="description">Description:</label><br>
	<textarea id="description" name="description" rows="4" cols="40">${video.description}</textarea><br> 
	<label for="images">Images:</label><br>
	<c:if test="${video.poster.substring(0 , 5)=='https'}">
		<c:url value="${video.poster}" var="imgUrl"></c:url>
	</c:if>
	<c:if test="${video.poster.substring(0 , 5)!='https'}">
		<c:url value="/image?fname=${video.poster}" var="imgUrl"></c:url>
	</c:if>
	<img id="imagess" height="150" width="200" src="${imgUrl}" alt="Current Image" /><br>
	<input type="file" onchange="chooseFile(this)" id="images" name="images"><br>

	<label for="status">Status:</label>
	<input type="radio" id="ston" name="status" value="1"${video.active == 1 ? 'checked' : ''}> <label for="ston">Hoạt động</label> 
	<input type="radio" id="stoff" name="status" value="0" ${video.active == 0 ? 'checked' : ''}> <label for="stoff">Khóa</label><br> 
	<input type="submit" value="Update">
</form>
<hr>