package codingTest;

import java.util.Calendar;

public class pracCalendar {

	public static void main(String[] args) {
		
		Calendar now = Calendar.getInstance();
		
		int month = now.get(Calendar.MONTH) + 1;
		System.out.println(month);
		
		int day = now.get(Calendar.DAY_OF_MONTH);
		System.out.println(day);
		
		int week = now.get(Calendar.DAY_OF_WEEK);
		String strWeek = "";
		switch(week) {
		
			case Calendar.MONDAY:
				strWeek = "월";
				break;
			case Calendar.TUESDAY:
				strWeek = "화";
				break;
			case Calendar.WEDNESDAY:
				strWeek = "수";
				break;
			case Calendar.THURSDAY:
				strWeek = "목";
				break;
			case Calendar.FRIDAY:
				strWeek = "금";
				break;
			case Calendar.SATURDAY:
				strWeek = "토";
				break;
			case Calendar.SUNDAY:
				strWeek = "일";
				break;
		}
		System.out.println(strWeek + "요일");
		
		int amPm = now.get(Calendar.AM_PM);
		String strAmPm = "";
		if(amPm == Calendar.AM) {
			
			strAmPm = "오전";
			
		}else {
			
			strAmPm = "오후";
			
		}
		System.out.println(strAmPm);
		
		int hour = now.get(Calendar.HOUR);
		System.out.println(hour);
		
		int minute = now.get(Calendar.MINUTE);
		System.out.println(minute);
		
		int second = now.get(Calendar.SECOND);
		System.out.println(second);
		
	}

}
