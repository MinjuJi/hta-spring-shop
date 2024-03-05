package com.sample.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.service.HrService;
import com.sample.vo.Dept;
import com.sample.vo.Emp;
import com.sample.web.dto.Criteria;
import com.sample.web.dto.ListDto;
import com.sample.web.form.EmpCreateForm;
import com.sample.web.form.EmpModifyForm;

@Controller
@RequestMapping("/emp")
public class EmpController {

	@Autowired
	private HrService hrService;
	
	@GetMapping(path = "/list")
	public String list(@RequestParam(name="page", required=false, defaultValue="1") int page, 
					   @RequestParam(name="rows", required=false, defaultValue="10") int rows,
					   @RequestParam(name="sort", required=false, defaultValue="date") String sort,
					   @RequestParam(name="opt", required=false) String opt,
					   @RequestParam(name="keyword", required =false) String keyword,
					   Model model) {
		
		Criteria criteria = new Criteria();
		criteria.setPage(page);
		criteria.setRows(rows);
		criteria.setSort(sort);
		
		if(StringUtils.hasText(opt) && StringUtils.hasText(keyword)) {
			criteria.setOpt(opt);
			criteria.setKeyword(keyword);
		}
		
		ListDto<Emp> dto = hrService.getEmps(criteria);
		model.addAttribute("emps", dto.getItems());
		model.addAttribute("paging", dto.getPaging());
		model.addAttribute("criteria", criteria);
		
		return "emp/list";
	}
	
	@GetMapping(path = "/create")
	public String form(Model model) {
		List<Dept> depts = hrService.getAllDepts();
		model.addAttribute("depts", depts);
		
		return "emp/form";
	}
	
	@PostMapping(path = "/create")
	public String create(EmpCreateForm empCreateForm) {
		hrService.createEmp(empCreateForm);
		
		return "redirect:list";
	}
	
	@GetMapping("/detail")
	public String detail(int empNo, Model model) {
		Emp emp = hrService.getEmpByNo(empNo);
		
		model.addAttribute("emp", emp);
		
		return "emp/detail"; 
	}
	
	@GetMapping("/modify")
	public String form(int empNo, Model model) {
		Emp emp = hrService.getEmpByNo(empNo);
		List<Dept> depts = hrService.getAllDepts();
		
		model.addAttribute("emp", emp);
		model.addAttribute("depts", depts);
		
		return "emp/modifyForm"; 
	}
	
	@PostMapping("/modify")
	public String modify(EmpModifyForm empModifyForm) {
		hrService.modifyEmp(empModifyForm);
		
		return "redirect:list"; 
	}
}
