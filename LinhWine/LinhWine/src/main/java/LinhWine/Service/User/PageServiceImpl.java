package LinhWine.Service.User;

import org.springframework.stereotype.Service;

import LinhWine.Dto.PageDto;

@Service
public class PageServiceImpl implements IPageService {

	public PageDto getInfoPage(int totalData, int limit, int currentPage) {
		PageDto pageDto = new PageDto();
		
		pageDto.setLimit(limit);
		
		pageDto.setTotalPage(setInfoTotalPage(totalData, limit));
		pageDto.setCurrentPage(checkCurrentPage(currentPage,pageDto.getTotalPage()));
		
		int start = findStart(pageDto.getCurrentPage(), limit);
		pageDto.setStart(start);
		
		int end = findEnd(pageDto.getStart(), limit, totalData);
		pageDto.setEnd(end);
		
		return pageDto;
	}

	private static int findEnd(int start, int limit, int totalData) {
		
		return start + limit > totalData ? totalData : (start + limit) - 1;
	}

	private static int findStart(int currentPage, int limit) {
		
		return ((currentPage - 1) * limit) ;
	}

	private static int checkCurrentPage(int currentPage, int totalPage) {
		if(currentPage < 1) {
			return 1;
		}
		if(currentPage > totalPage) {
			return totalPage;
		}
		return currentPage;
	}

	private static int setInfoTotalPage(int totalData, int limit) {
		int totalPage = 0;
		totalPage = totalData/limit;
		totalPage = totalPage * limit < totalData ? totalPage + 1 : totalPage;
		return totalPage;
		
	}

}
