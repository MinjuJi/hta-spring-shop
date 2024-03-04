package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.mapper.DeptMapper;
import com.sample.mapper.EmpMapper;
import com.sample.vo.Dept;
import com.sample.vo.Emp;
import com.sample.web.dto.Criteria;
import com.sample.web.dto.ListDto;
import com.sample.web.dto.Pagination;
import com.sample.web.form.DeptCreateForm;
import com.sample.web.form.EmpCreateForm;

@Service
public class HrService {

	@Autowired
	private DeptMapper deptMapper;
	
	@Autowired
	private EmpMapper empMapper;
	
	public List<Dept> getDepts(){
		
		List<Dept> depts= deptMapper.getAllDepts();
		
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
	
	public ListDto<Emp> getEmps(Criteria criteria){
		int totalRows = empMapper.getTotalRows(criteria);
		
		Pagination pagination = new Pagination(criteria.getPage(), totalRows, criteria.getRows());
		
		criteria.setBegin(pagination.getBegin());
		criteria.setEnd(pagination.getEnd());
		
		List<Emp> emps = empMapper.getEmps(criteria);
		
		ListDto<Emp> dto = new ListDto<Emp>(emps, pagination);
		
		return dto;
	}

	public List<Dept> getAllDepts() {
		return deptMapper.getAllDepts();
	}

	public void createEmp(EmpCreateForm empCreateForm) {
		
		Dept dept = Dept.builder()
						.no(empCreateForm.getDeptNo())
						.build();
		
		Emp emp = Emp.builder()
				     .name(empCreateForm.getName())
				     .tel(empCreateForm.getTel())
				     .email(empCreateForm.getEmail())
				     .salary(empCreateForm.getSalary())
				     .hiredDate(empCreateForm.getHiredDate())
				     .dept(dept)
				     .build();
		
		empMapper.insertEmp(emp);
	}

	public Emp getEmpDetail(int no) {
		return empMapper.getEmpByNo(no);
	}

	public Dept getDeptByNo(int deptNo) {
		
		return deptMapper.getDeptByNo(deptNo);
	}
	
}
