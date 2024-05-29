package LinhWine.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import LinhWine.Entity.CategoryNew;
import LinhWine.Entity.News;

@Service
public interface INewService {
	public List<News> getAllNews();
	public List<CategoryNew> getAllCategoryNews();
	public List<News> getNewByCategoryNew(long id);
	public List<News> getNewById(long id);
	public int addNew(News news);
	public int updateNew(News news, long id);
	public int deleteNew( long id) ;
}
