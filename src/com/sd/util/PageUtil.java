package com.sd.util;

import java.util.HashMap;
import java.util.Map;

public class PageUtil {
	
	public static Map<String,Integer> getPageInfo(Map<String,String> params){
		Map<String,Integer> pageInfo = new HashMap<String,Integer>();
		int curPage = Integer.parseInt(params.get("page"));
		int pageSize = Integer.parseInt(params.get("rows"));
		System.out.println(curPage+":::"+pageSize);
		return pageInfo;
	}
	
	public static Map<String,Integer> getPageInfo(int curPage, int pageSize){
		Map<String,Integer> map = new HashMap<String,Integer>();
		int curRecord = (curPage-1)*pageSize;
		map.put("curRecord", curRecord);
		map.put("pageSize", pageSize);
		return map;
	}
}
