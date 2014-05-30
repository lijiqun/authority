package com.sd.mapper;

import java.util.List;
import java.util.Map;

import com.sd.entity.Person;

public interface PersonMapper {
	public Person selectPersonById(int id);

	public List<Person> selectPersons();
	
	public int countPersons();
	
	public List<Person> selectPagePersons(Map<String,Integer> map);
	
	public int addPerson(Person person);
	
	public int updatePerson(Person person);
	
	public int deletePerson(int id);
	
	public List<String> findName(String name);
	
	public List<Map<String,Object>> findNameByKeyWord();
	
	
}
