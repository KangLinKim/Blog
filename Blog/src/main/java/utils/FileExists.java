package utils;

import java.io.File;

public class FileExists {
    public static String file_exists_check(String path) {
    	String path_jpg = path + ".jpg";
		File file_jpg = new File(path_jpg);
		
		String path_png = path + ".png";
		File file_png = new File(path_png);
		
		if (file_jpg.exists()) {
			return ".jpg";
		} else if (file_png.exists()) {
			return ".png";
		} else {
			return null;
		}
	}
}