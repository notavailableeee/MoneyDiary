package codingTest;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class week_2016 {

	public static void main(String[] args) {
		
		try {
			String answer = solution(5, 26);
			System.out.println(answer);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static String solution(int a, int b) throws ParseException {
		
		String[] week = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"};
		
		String inputDate = "2016";
		
		if(a<10) {
			
			inputDate += "0" + a;
		}else {
			
			inputDate += a;
		}
		if(b<10) {
			
			inputDate += "0" + b;
		}else {
			
			inputDate += b;
		}
		
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		Date date = df.parse(inputDate);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int i = calendar.get(Calendar.DAY_OF_WEEK);
		
		return week[i-1];
		
	}

}
