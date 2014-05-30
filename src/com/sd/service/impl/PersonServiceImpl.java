package com.sd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sd.entity.Person;
import com.sd.mapper.PersonMapper;
import com.sd.service.PersonService;
import com.sd.util.PageUtil;

@Service
@Transactional
public class PersonServiceImpl implements PersonService {
	
	@Resource
	private PersonMapper personMapper;
	
	@Override
	public Person selectPersonById(int id) {
		
		return this.personMapper.selectPersonById(id);
	}

	@Override
	public List<Person> selectPersons() {
		
		return this.personMapper.selectPersons();
	}

	@Override
	public Map<String, Object> selectPers() {
		Map<String,Object> persons = new HashMap<String,Object>();
		persons.put("total", this.personMapper.countPersons());
		persons.put("rows", this.personMapper.selectPersons());
		return persons;
	}

	@Override
	public Map<String, Object> selectPagePers(int curPage, int pageSize) {
		Map<String,Object> persons = new HashMap<String,Object>();
		Map<String,Integer> pageMap = PageUtil.getPageInfo(curPage, pageSize);
		persons.put("total", this.personMapper.countPersons());
		persons.put("rows", this.personMapper.selectPagePersons(pageMap));
		return persons;
	}

	@Override
	public int addPerson(Person person) {
		int flag = this.personMapper.addPerson(person);
		System.out.println("::::"+person.toString()+flag);
		return flag;
	}

	@Override
	public int updatePerson(Person person) {
		int flag = this.personMapper.updatePerson(person);
		System.out.println("::::"+person.toString()+flag);
		return flag;
	}

	@Override
	public int deletePerson(int id) {
		int flag = this.personMapper.deletePerson(id);
		return flag;
	}

	@Override
	public List<String> findName(String name) {
		// TODO Auto-generated method stub
		return this.personMapper.findName(name);
	}

	@Override
	public List<Map<String,Object>> findNameByKeyWord() {
		// TODO Auto-generated method stub
		return this.personMapper.findNameByKeyWord();
	}

	

}
