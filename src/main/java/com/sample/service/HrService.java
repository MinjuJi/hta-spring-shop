package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.mapper.DeptMapper;
import com.sample.vo.Company;
import com.sample.vo.Dept;
import com.sample.vo.Product;
import com.sample.web.form.DeptCreateForm;
import com.sample.web.form.ProductCreateForm;

@Service
public class HrService {

	@Autowired
	private DeptMapper deptMapper;
	
	public List<Dept> getDepts(){
		
		List<Dept> depts= deptMapper.getAllDept();
		
		return depts;
	}

	public void createDept(DeptCreateForm form) {
		Dept dept = Dept.builder()
						.name(form.getName())
						.tel(form.getTel())
						.fax(form.getFax())
						.build();
		
		deptMapper.insertDept(dept);
	}
}
