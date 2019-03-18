package com.xskq.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	/**
	 * 字符串转时间（通用）
	 * @param strDate 时间字符串
	 * @param fm 格式
	 * @return
	 */
	public static Date strToDateByFormate(String strDate,String fm) {
		SimpleDateFormat formatter = new SimpleDateFormat(fm);
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	/**
	 * 字符串转时间（yyyy-MM-dd）
	 * @param strDate
	 * @return
	 */
	public static Date strToDate(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	/**
	 * 字符串转时间（yyyy-MM-dd HH:mm）
	 * @param strDate
	 * @return
	 */
	public static Date strToDateHour(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	/**
	 * 字符串转时间（yyyy-MM-dd HH:mm:ss）
	 * @param strDate
	 * @return
	 */
	public static Date strToDateTime(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	/**
	 * 字符串转时间（yyyyMMdd）
	 * @param strDate
	 * @return
	 */
	public static Date strToDateNoCon(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	/**
	 * 字符串转时间（yyyyMMdd HHmm）
	 * @param strDate
	 * @return
	 */
	public static Date strToDateHourNoCon(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd HHmm");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	/**
	 * 字符串转时间（yyyyMMdd HHmmss）
	 * @param strDate
	 * @return
	 */
	public static Date strToDateTimeNoCon(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd HHmmss");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}

	/**
	 * 时间转字符串（通用）
	 * @param dateDate 时间
	 * @param fm 格式
	 * @return
	 */
	public static String dateToStrByFormate(Date dateDate,String fm) {
		SimpleDateFormat formatter = new SimpleDateFormat(fm);
		String dateString = formatter.format(dateDate);
		return dateString;
	}

	/**
	 * 时间转字符串（年月日）
	 * @param dateDate
	 * @return
	 */
	public static String dateToStr(Date dateDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(dateDate);
		return dateString;
	}

	/**
	 * 时间转字符串（年月日 时分）
	 * @param dateDate
	 * @return
	 */
	public static String dateToStrHour(Date dateDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateString = formatter.format(dateDate);
		return dateString;
	}

	/**
	 * 时间转字符串（年月日 时分秒）
	 * @param dateDate
	 * @return
	 */
	public static String dateToStrTime(Date dateDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(dateDate);
		return dateString;
	}
	
}
