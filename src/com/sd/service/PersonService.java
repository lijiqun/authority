package com.sd.service;

import java.util.List;
import java.util.Map;

import com.sd.entity.Person;

public interface PersonService {
	public Person selectPersonById(int id);
	
	public List<Person> selectPersons();
	
	public Map<String,Object> selectPers();
	
	public Map<String,Object> selectPagePers(int curPage,int pageSize);
	
	public int addPerson(Person person);
	
	public int updatePerson(Person person);
	
	public int deletePerson(int id);
	
	public List<String> findName(String name);
	
	public List<Map<String,Object>> findNameByKeyWord();
	
}
