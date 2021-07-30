package kr.ghtech.artfms.fnr;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.fnr.dto.FnrDTO;
import kr.ghtech.artfms.fnr.service.FnrService;

@Controller
@RequestMapping("/fnr/*")
public class FnrController {

	@Inject
	FnrService fnrService;
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.addObject("list",fnrService.fnrList());
		mav.setViewName("fnr/listview");
		return mav;
	}
	
	@RequestMapping("listfnr.do")
	public ModelAndView listfnr(ModelAndView mav) {
		mav.addObject("list",fnrService.fnrList());
		mav.setViewName("fnr/listfnr");
		return mav;
	}

	
	@RequestMapping("detail/{FNR_ID}")
	public ModelAndView detail(@PathVariable("FNR_ID") int FNR_ID, ModelAndView mav) {
		mav.addObject("list",fnrService.detailFnr(FNR_ID));
		mav.setViewName("fnr/detailfnr");
		return mav;
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute FnrDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int fnrupdate = fnrService.updateFnr(dto);
		if (fnrupdate > 0) {
			param.put("code", "10001");
		}
		else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}


}
