package LinhWine.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Dao.NewsDao;
import LinhWine.Entity.CategoryNew;
import LinhWine.Entity.News;
@Service
public class NewServiceImpl implements INewService{
	
	@Autowired
	NewsDao newsDao;

	public List<News> getAllNews() {
		return newsDao.getAllNews();
	}

	public List<CategoryNew> getAllCategoryNews() {
		return newsDao.getAllCategoryNews();
	}

	public List<News> getNewByCategoryNew(long id) {
		return newsDao.getNewByCategoryNew(id);
	}

	public List<News> getNewById(long id) {
		return newsDao.getNewById(id);
	}

	public int addNew(News news) {
		return newsDao.addNew(news);
	}

	public int updateNew(News news, long id) {
		return newsDao.updateNew(news, id);
	}

	public int deleteNew(long id) {
		return newsDao.deleteNew(id);
	}

	

}
