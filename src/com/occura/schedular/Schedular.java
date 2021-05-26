package com.occura.schedular;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.occura.bean.PatientBean;
import com.occura.bean.UserBean;
import com.occura.dao.AllListDao;

//@Configuration
//@EnableScheduling
public class Schedular {

	
	@Scheduled(fixedRate=5000)  // 5 sec
	public void testScedular() {
		try {
			System.out.println("Test Schedular.");
		}
		
		catch(Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		}
	}
	
// 1 2 3 4 5 6 Index
// - - - - - -
// * * * * * * command to be executed
// - - - - - -
// | | | | | |
// | | | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
// | | | | ------- Month (1 - 12)
// | | | --------- Day of month (1 - 31)
// | | ----------- Hour (0 - 23)
// | -------- Minute (0 - 59)
// ------------- Seconds (0 - 59)
	
	//schedular
	//eg:-@Scheduled(cron = "[Seconds] [Minutes] [Hours] [Day of month] [Month] [Day of week] [Year]")
	//STS_LEAVE eg:-@Scheduled(cron="0 0 1 * * ?")
	//@Scheduled(cron="10 0 0 * * ?")
//	@Scheduled(fixedRate=1000000000)
//	public void testNotification() {
//		
//		try {
//			
//			List<PatientBean> patient = AllListDao.getlistfromPatient();
//			if(patient != null && !patient.isEmpty())
//			{
//				// data pass
//			}
//		}
//		
//		catch(Exception ex) {
//			ex.printStackTrace();
//			System.out.println(ex.getMessage());
//		}
//	}

	
}
