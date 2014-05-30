package com.sd.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinYinUtil {
	private static HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
    private static String[] pinyin;       

    static{
    	format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);  
    }
	
    public static List<Map<String,Object>> changePinYin(List<Map<String,Object>> name,String keyWord) {
    	List<Map<String,Object>> checkName = new ArrayList<Map<String,Object>>();
    	for(Map<String,Object> str:name){
			String uname = (String) str.get("text");
			String pinyinIndex = getStringPinYinFirst(uname);
			String pinyin = getStringPinYin(uname);
			if(pinyinIndex.contains(keyWord)||pinyin.contains(keyWord)||uname.contains(keyWord)){
				checkName.add(str);
			}
		}
		return checkName;
	}
	
	 //转换单个字符 
    public static String getCharacterPinYin(char c) 
    { 
              try
              {
                       pinyin = PinyinHelper.toHanyuPinyinStringArray(c, format);
              }
              catch(BadHanyuPinyinOutputFormatCombination e)
              {
                       e.printStackTrace();
              }
               
              // 如果c不是汉字，toHanyuPinyinStringArray会返回null 
              if(pinyin == null) return null;                   

              // 只取一个发音，如果是多音字，仅取第一个发音 
              return pinyin[0];    
    }
    
    /**
     * 判断参数中有没
     * @param name
     * @return
     */
    public static boolean hasHanYu(String name){
    	boolean flag = false;
    	 String tempPinyin = null; 
    	for(int i = 0; i < name.length(); ++i) 
        { 
                 tempPinyin =getCharacterPinYin(name.charAt(i)); 
                 if(tempPinyin != null){
                	 flag = true;
                	 break;
                 }
        } 
    	return flag;
    }
    
	
	 //转换一个字符串 
    public static String getStringPinYin(String str) 
    { 
              StringBuilder sb = new StringBuilder(); 
              String tempPinyin = null; 
              for(int i = 0; i < str.length(); ++i) 
              { 
                       tempPinyin =getCharacterPinYin(str.charAt(i)); 
                       if(tempPinyin == null) 
                       { 
                                // 如果str.charAt(i)非汉字，则保持原样 
                                sb.append(str.charAt(i)); 
                       } 
                       else 
                       { 
                                sb.append(tempPinyin); 
                       } 
              } 
              return sb.toString(); 
    } 
    
    //转换一个字符串的第一个字符 
    public static String getStringPinYinFirst(String str) 
    { 
              StringBuilder sb = new StringBuilder(); 
              String tempPinyin = null; 
              for(int i = 0; i < str.length(); ++i) 
              { 
                       tempPinyin =getCharacterPinYin(str.charAt(i))!=null?getCharacterPinYin(str.charAt(i)).substring(0,1):getCharacterPinYin(str.charAt(i)); 
                       if(tempPinyin == null) 
                       { 
                                // 如果str.charAt(i)非汉字，则保持原样 
                                sb.append(str.charAt(i)); 
                       } 
                       else 
                       { 
                                sb.append(tempPinyin); 
                       } 
              } 
              return sb.toString(); 
    } 
    
    public static void main(String[] args) {
		System.out.println(getCharacterPinYin('李'));
		System.out.println(getStringPinYin("李集群"));
		System.out.println(getStringPinYinFirst("sr"));
		System.out.println(hasHanYu("lijiqun"));
	}
}