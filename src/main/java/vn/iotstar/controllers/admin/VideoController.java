package vn.iotstar.controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Video;
import vn.iotstar.services.IVideoService;
import vn.iotstar.services.impl.VideoService;
import vn.iotstar.utils.Constant;
import vn.iotstar.services.ICategoryService;
import vn.iotstar.services.impl.CategoryService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/admin/videos", "/admin/video/edit", "/admin/video/update", "/admin/video/insert",
		"/admin/video/add", "/admin/video/delete" })
public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IVideoService videoService = new VideoService();
	ICategoryService categoryService = new CategoryService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String url = request.getRequestURI();
		if (url.contains("videos")) {
			List<Video> list = videoService.findAll();
			request.setAttribute("listvideo", list);

			List<Category> categories = categoryService.findAll();
			request.setAttribute("categories", categories);
			request.getRequestDispatcher("/views/admin/video-views.jsp").forward(request, response);
		} else if(url.contains("/admin/video/add")){
			List<Category> categories = categoryService.findAll();
			request.setAttribute("categories", categories);
			request.getRequestDispatcher("/views/admin/video-add.jsp").forward(request, response);
			
		}
		else if (url.contains("/admin/video/edit")) {
			String id = request.getParameter("id");
			Video video = videoService.findById(id);
			request.setAttribute("video", video);
			request.getRequestDispatcher("/views/admin/video-edit.jsp").forward(request, response);
		}else if (url.contains("/admin/video/delete")) {
			String id = request.getParameter("id");
			try {
				videoService.delete(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/admin/videos");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String url = request.getRequestURI();

		if (url.contains("/admin/video/insert")) {
			Video video = new Video();

			String videoid = request.getParameter("videoid");
			String videotitle = request.getParameter("videotitle");
			String description = request.getParameter("description");
			String categoryId = request.getParameter("categoryId");
			String active = request.getParameter("status");
			String views = request.getParameter("videocount");

			// Gán giá trị cho đối tượng video
			video.setVideoId(videoid);
			video.setTitle(videotitle);
			video.setViews(0); // Chuyển đổi kiểu nếu cần
			video.setDescription(description);
			video.setActive(Integer.parseInt(active));
			video.setViews(Integer.parseInt(views));
			Category category = categoryService.findById(Integer.parseInt(categoryId));
			video.setCategory(category);
			String fname = "";
			String uploadPath = Constant.DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = request.getPart("images");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					// đổi tên file
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					// up load file
					part.write(uploadPath + "/" + fname);
					// ghi tên file vào data
					video.setPoster(fname);
				} else {
					video.setPoster("avata.png");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			// Gọi phương thức insert
			videoService.insert(video);

			response.sendRedirect(request.getContextPath() + "/admin/videos");
		} else if (url.contains("/admin/video/update")) {
			String videoid = request.getParameter("videoid");
			int status = Integer.parseInt(request.getParameter("status"));
			Video video = new Video();
			video.setVideoId(videoid);
			String videotitle = request.getParameter("videotitle");
			video.setTitle(videotitle);
			String videocount = request.getParameter("videocount");
			video.setViews(Integer.parseInt(videocount));
			String description = request.getParameter("description");
			video.setDescription(description);
			
			String categoryId = request.getParameter("categoryId");
			Category category = categoryService.findById(Integer.parseInt(categoryId));
			video.setCategory(category);
			
			video.setActive(status);
			// lưu hình cũ
			Video cateold = videoService.findById(videoid);
			String fileold = cateold.getPoster();
			// xử lý image
			String fname = "";
			String uploadPath = Constant.DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {

				Part part = request.getPart("images");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					// đổi tên file
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					// up load file
					part.write(uploadPath + "/" + fname);
					// ghi tên file vào data
					video.setPoster(fname);
				} else {
					video.setPoster(fileold);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			videoService.update(video);
			response.sendRedirect(request.getContextPath() + "/admin/videos");
		}
	}
}
