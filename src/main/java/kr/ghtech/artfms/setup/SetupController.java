package kr.ghtech.artfms.setup;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("timelistview.do")
	public ModelAndView tlistview(ModelAndView mav) {
		mav.addObject("list",setupService.timelistSetup());
		mav.setViewName("setup/timelistview");
		return mav;
	}
	
	@RequestMapping("infolistview.do")
	public ModelAndView ilistview(ModelAndView mav) {
		mav.addObject("list",setupService.infolistSetup());
		mav.setViewName("setup/infolistview");
		return mav;
	}

	@RequestMapping("listsetup.do")
	public ModelAndView listsetup(ModelAndView mav) {
		mav.addObject("list",setupService.listSetup());
		mav.setViewName("setup/listsetup");
		return mav;
	}
	
	@RequestMapping("timelistsetup.do")
	public ModelAndView tlistsetup(ModelAndView mav) {
		mav.addObject("list",setupService.timelistSetup());
		mav.setViewName("setup/timelistsetup");
		return mav;
	}

	@RequestMapping("infolistsetup.do")
	public ModelAndView ilistsetup(ModelAndView mav) {
		mav.addObject("list",setupService.infolistSetup());
		mav.setViewName("setup/infolistsetup");
		return mav;
	}

	@RequestMapping("detailnew.do")
	public ModelAndView detailnew(ModelAndView mav) {
		mav.setViewName("setup/detailsetup");
		return mav;
	}
	
	@RequestMapping("timedetailnew.do")
	public ModelAndView tdetailnew(ModelAndView mav) {
		mav.setViewName("setup/timedetailsetup");
		return mav;
	}
	
	@RequestMapping("infodetailnew.do")
	public ModelAndView idetailnew(ModelAndView mav) {
		mav.setViewName("setup/infodetailsetup");
		return mav;
	}

	
	@RequestMapping("detail/{SETUP_ID}")
	public ModelAndView detailSetup(@PathVariable("SETUP_ID") int SETUP_ID, ModelAndView mav) {
		mav.addObject("list",setupService.detailSetup(SETUP_ID));
		mav.setViewName("setup/detailsetup");
		return mav;
	}
	
	@RequestMapping("timedetail/{SETUP_ID}")
	public ModelAndView tdetailSetup(@PathVariable("SETUP_ID") int SETUP_ID, ModelAndView mav) {
		mav.addObject("list",setupService.detailSetup(SETUP_ID));
		mav.setViewName("setup/timedetailsetup");
		return mav;
	}

	@RequestMapping("infodetail/{SETUP_ID}")
	public ModelAndView idetailSetup(@PathVariable("SETUP_ID") int SETUP_ID, ModelAndView mav) {
		mav.addObject("list",setupService.detailSetup(SETUP_ID));
		mav.setViewName("setup/infodetailsetup");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="listfrsetl/{SETL_FROOM_ID}", method = RequestMethod.POST)
	public List<SetupDTO> frsetllist(@PathVariable("SETL_FROOM_ID") int SETL_FROOM_ID){
		List<SetupDTO> result = setupService.listFroomSetl(SETL_FROOM_ID);
		return result;
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
	
	@RequestMapping("insfroomsetl.do")
	public ResponseEntity<?> insfrstl(@ModelAttribute SetupDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int setupinsert = setupService.insFroomSetl(dto);
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
	
	@RequestMapping("updfroomsetl.do")
	public ResponseEntity<?> updfrsetl(@ModelAttribute SetupDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int setupupdate = setupService.updFroomSetl(dto);
		if (setupupdate > 0) {
			param.put("code", "10001");
		}
		else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updatedefault.do")
	public ResponseEntity<?> updatedef(@ModelAttribute SetupDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int setupupdate = setupService.updateDefault(dto);
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
