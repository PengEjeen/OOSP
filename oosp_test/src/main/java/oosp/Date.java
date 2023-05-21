package oosp;

public class Date {
	static java.util.Calendar now = java.util.Calendar.getInstance();  
	
	public static int getYear() {
		int year = now.get(java.util.Calendar.YEAR);
		
		return year;
	}
	public static int getMonth() {
		int month = now.get(java.util.Calendar.MONTH) + 1;
		
		return month;
	}
	public static int getDay() {
		int day = now.get(java.util.Calendar.DATE);
		return day;
	}
}
