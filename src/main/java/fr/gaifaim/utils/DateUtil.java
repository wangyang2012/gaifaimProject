package fr.gaifaim.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DateUtil {
	public static String formateDateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return sdf.format(date);
	}
}
