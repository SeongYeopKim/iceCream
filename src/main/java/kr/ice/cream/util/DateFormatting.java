/*
* 작성일 : 2015. 7. 11.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateFormatting {

	public String setSort(int userSrl){
		SimpleDateFormat format = new SimpleDateFormat("ssSSS", Locale.KOREA);
		Date date = new Date();
		String dateToString = format.format(date);
		return userSrl+"."+dateToString;
	}

	public String today(){
		SimpleDateFormat format = new SimpleDateFormat("MM/dd", Locale.KOREA);
		Date date = new Date();
		String dateToString = format.format(date);
		return dateToString;
	}
}
