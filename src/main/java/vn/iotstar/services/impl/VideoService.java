package vn.iotstar.services.impl;

import java.util.List;

import vn.iotstar.dao.IVideoDao;
import vn.iotstar.dao.impl.VideoDao;
import vn.iotstar.entity.Video;
import vn.iotstar.services.IVideoService;

public class VideoService implements IVideoService {
	IVideoDao cateDao = new VideoDao();
	@Override
	public int count() {
		return cateDao.count();
	}

	@Override
	public List<Video> findAll(int page, int pagesize) {
		return cateDao.findAll(page, pagesize);
	}

	@Override
	public List<Video> findByCategoryname(String catname) {
		return cateDao.findByCategoryname(catname);
	}

	@Override
	public List<Video> findAll() {
		return cateDao.findAll();
	}

	@Override
	public Video findById(String cateid) {
		return cateDao.findById(cateid);
	}

	@Override
	public void delete(String cateid) throws Exception {
		cateDao.delete(cateid);
	}

	@Override
	public void update(Video video) {
		cateDao.update(video);
	}

	@Override
	public void insert(Video video) {
		cateDao.insert(video);
	}

}
