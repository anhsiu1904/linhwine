package LinhWine.Service.User;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import LinhWine.Entity.Bills;
import LinhWine.Entity.Chart;

@Service
public interface IChartService {
	
	public List<Bills> getSumTotal();
	
}
