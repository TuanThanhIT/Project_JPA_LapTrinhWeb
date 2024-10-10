package vn.iotstar.services;

import java.util.List;

import vn.iotstar.entity.Video;

public interface IVideoService {
	int count();

	List<Video> findAll(int page, int pagesize);

	List<Video> findByCategoryname(String catname);

	List<Video> findAll();

	Video findById(String cateid);

	void delete(String cateid) throws Exception;

	void update(Video video);

	void insert(Video video);
}
