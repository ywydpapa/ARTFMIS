package kr.ghtech.artfms.setup;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.setup.dto.SetupDTO;
import kr.ghtech.artfms.setup.service.SetupService;

@Controller
@RequestMapping("/setup/*")
public class SetupController {
	
	@Inject
	SetupService setupService;
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.addObject("list",setupService.listSetup());
		mav.setViewName("setup/listview");
		return mav;
	}

	@RequestMapping("listsetup.do")
	public ModelAndView listsetup(ModelAndView mav) {
		mav.addObject("list",setupService.listSetup());
		mav.setViewName("setup/listsetup");
		return mav;
	}
	
	@RequestMapping("detailnew.do")
	public ModelAndView detailnew(ModelAndView mav) {
		mav.setViewName("setup/detailsetup");
		return mav;
	}
	
	@RequestMapping("detail/{SETUP_ID}")
	public ModelAndView detailSetup(@PathVariable("SETUP_ID") int SETUP_ID, ModelAndView mav) {
		mav.addObject("list",setupService.detailSetup(SETUP_ID));
		mav.setViewName("setup/detailsetup");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute SetupDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int setupinsert = setupService.insertSetup(dto);
		if (setupinsert > 0) {
			param.put("code", "10001");
		}
		else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute SetupDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int setupupdate = setupService.updateSetup(dto);
		if (setupupdate > 0) {
			param.put("code", "10001");
		}
		else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("delete.do")
	public ResponseEntity<?> delete(@ModelAttribute SetupDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int setupdelete = setupService.deleteSetup(dto);
		if (setupdelete > 0) {
			param.put("code", "10001");
		}
		else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}

}
