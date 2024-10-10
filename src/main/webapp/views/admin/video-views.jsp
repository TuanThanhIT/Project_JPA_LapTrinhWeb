<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<a href="<c:url value='/admin/video/add'></c:url>">Add Video</a>
<hr>
<table border="1" width = "100%">
	<tr>
		<th>STT</th>
		<th>Video ID</th>
		<th>Images</th>
		<th>Description</th>
		<th>Views</th>
		<th>Category</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
		<c:forEach items="${listvideo}" var="video" varStatus="STT">
			<tr>
				<td>${STT.index + 1}</td>
				<td>${video.videoId}</td>
				<c:if test="${video.poster.substring(0 , 5)=='https'}">
					<c:url value="${video.poster}" var="imgUrl"></c:url>
				</c:if>
				<c:if test="${video.poster.substring(0 , 5)!='https'}">
					<c:url value="/image?fname=${video.poster}" var="imgUrl"></c:url>
				</c:if>
				<td><img height="150" width="200" src="${imgUrl}"
					alt="${imgUrl}" /></td>
				<td>${video.description}</td>
				<td>${video.views}</td>
				<td>${video.category.categoryname}</td>
				<td><c:choose>
						<c:when test="${video.active == 1}">
                            Hoạt động
                        </c:when>
						<c:when test="${video.active == 0}">
                            Khóa
                        </c:when>
						<c:otherwise>
                            Không xác định
                        </c:otherwise>
					</c:choose></td>
				<td><a
					href="<c:url value='/admin/video/edit?id=${video.videoId }'/>">Sửa</a>
					| <a
					href="<c:url value='/admin/video/delete?id=${video.videoId }'/>">Xóa</a>
				</td>
			</tr>
		</c:forEach>
</table>