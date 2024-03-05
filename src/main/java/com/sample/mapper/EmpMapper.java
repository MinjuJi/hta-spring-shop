package com.sample.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.Emp;
import com.sample.web.dto.Criteria;
import com.sample.web.form.EmpModifyForm;

@Mapper
public interface EmpMapper {

	int getTotalRows(Criteria criteria);

	List<Emp> getEmps(Criteria criteria);

	void insertEmp(Emp emp);

	Emp getEmpByNo(int empNo);

	void modifyEmp(Emp emp);

}
