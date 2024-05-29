package LinhWine.Service.User;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import LinhWine.Dao.ChartDao;
import LinhWine.Entity.Bills;
import LinhWine.Entity.Chart;

@Service
public class ChartServiceImpl implements IChartService {

	@Autowired
	ChartDao chartDao;
	


	public List<Bills> getSumTotal() {
		return chartDao.getSumTotal();
	}




	

}
