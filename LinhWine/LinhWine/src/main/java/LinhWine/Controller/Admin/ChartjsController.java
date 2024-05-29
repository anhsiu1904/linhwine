package LinhWine.Controller.Admin;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import LinhWine.Controller.User.BaseController;
import LinhWine.Entity.Bills;
import LinhWine.Entity.Chart;
import LinhWine.Service.User.ChartServiceImpl;

@Controller
public class ChartjsController extends BaseController {

	@Autowired
	ChartServiceImpl chartService;
	
	@RequestMapping("/quan-tri/thong-ke")
	public ModelAndView index() {
		List<Bills> bills = chartService.getSumTotal();
		List<Chart> charts = new ArrayList<Chart>();
		
		
		for (Bills bill : bills) {
			Chart chart = new Chart();
			chart.setDate(bill.getNgay_cap_nhat());
			chart.setTotal(bill.getTotal());
			charts.add(chart);
		}
		List<Integer> myValues = new ArrayList<Integer>();
		for(int i=0; i<charts.size()-1;i++) {
			
			for(int j=i+1; j<charts.size();j++) {
				if(charts.get(i).getDate().equals(charts.get(j).getDate())) {
					charts.get(i).setTotal(charts.get(i).getTotal() + charts.get(j).getTotal());
					
					charts.remove(j);
					j = i;
				}
				
			}
			
		}
		Collections.sort(charts, new Comparator<Chart>() {
            public int compare(Chart o1, Chart o2) {
                return o1.getDate().getDay() - o2.getDate().getDay();
            }
        });
		
		
		_mvShare.addObject("chart", charts);
		_mvShare.setViewName("admin/chart/chart");
		return _mvShare;
	}

}
