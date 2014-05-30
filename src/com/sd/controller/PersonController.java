package com.sd.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sd.entity.Person;
import com.sd.service.PersonService;
import com.sd.util.PinYinUtil;


@Controller
public class PersonController {
	@Autowired //自动类型装配
	private PersonService personService;
	
	/*
	 * value:指定访问的URL，相当于action
	 * params：指定参数，在value相同的情况，通过不同的参数判断访问哪个action，相当于type
	 * method：指定访问的方法，get、post等
	 */
	@SuppressWarnings("unchecked")
	//@RequestMapping(value="/findAll",params={"name=ljq"})
	@RequestMapping(value="/findAll")
	@ResponseBody
	public Object find(Model model,int page,int rows){//参数
		//Map<String,String> map = request.getParameterMap();
		//System.out.println(map.toString()+":::::");
		//Person p = this.personService.selectPersonById(28);
		//model.addAttribute("person", p);
		//System.out.println(p+"......>>>>>");
//		return "redirect:/index.jsp";
		//List<Person> pers = this.personService.selectPersons();
		//Map<String,Object> pers = this.personService.selectPers();
		System.out.println(page+":::"+rows);
		Map<String,Object> pers = this.personService.selectPagePers(page,rows);
		return pers;
	}
	
	@RequestMapping(value="/find")
	public String findAll(Model model){
		List<Person> ps = this.personService.selectPersons();
		model.addAttribute("person", ps);
		System.out.println(ps+"......>>>>>");
		return "/index.jsp";
	}
	
	
	@RequestMapping(value="/addPerson")
	@ResponseBody
	public Object insertPerson(Person person){
		System.out.println(person.toString());
		this.personService.addPerson(person);
		return "success";
	}
	
	@RequestMapping(value="/updatePerson")
	@ResponseBody
	public Object updatePerson(Person person){
		System.out.println(person.toString());
		this.personService.updatePerson(person);
		return "success";
	}
	@RequestMapping(value="/deletePerson")
	@ResponseBody
	public Object deletePerson(int id){
		this.personService.deletePerson(id);
		return "success";
	}
	
	
	@RequestMapping(value="/findName")
	@ResponseBody
	public Object findName(String name){
		System.out.println("keyWord......."+name);
		List<String> names = this.personService.findName(name);
		System.out.println(names);
		return names;
	}
	
	@RequestMapping(value="/findNameByKeyWord")
	@ResponseBody
	public Object findNameByKeyWord(String name) throws UnsupportedEncodingException{
		List<Map<String,Object>> names = this.personService.findNameByKeyWord();
		if(name != null){
			name = new String(name.getBytes("iso-8859-1"),"utf-8");
			System.out.println("keyWord>>>>>>>>>>"+name);
			names = PinYinUtil.changePinYin(names, name);
		}
		return names;
	}
	
}
