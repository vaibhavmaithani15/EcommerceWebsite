package com.helper;

public class Helper {
	public static String getWords(String desc) {
		String[] strs=desc.split(" ");
		if(strs.length>6) {
			String res="";
			for(int i=0;i<10;i++) {
				res=res+strs[i]+"  ";
			}
			return (res+"...");
		}else {
			return (desc+"...");
		}
		
		
	}
	public static String getWords24(String title) {
		String[] strs=title.split(" ");
		if(strs.length>24) {
			String res="";
			for(int i=0;i<24;i++) {
				res=res+strs[i]+"  ";
			}
			return (res+"...");
		}else {
			return (title+"...");
		}
		
		
	}

}
