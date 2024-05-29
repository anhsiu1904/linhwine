package LinhWine.Service.User;

import org.springframework.stereotype.Service;

import LinhWine.Dto.PageDto;

@Service
public interface IPageService {
	public PageDto getInfoPage(int totalPage, int limit, int currentPage);
}
