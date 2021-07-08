package kr.ghtech.artfms;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.code.dto.CodeDTO;
import kr.ghtech.artfms.code.service.CodeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	CodeService codeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		
		String USER_RANK = (String)session.getAttribute("USER_RANK");
		
		String rtn = "user/login";
		
		if (USER_RANK == null)
		{
			rtn = "user/login";
		}
		else if (USER_RANK.equalsIgnoreCase("ROOM"))
		{
			rtn = "index";
		}
		else if (USER_RANK.equalsIgnoreCase("STORE"))
		{
			rtn = "officeindex";
		}
		else if (USER_RANK.equalsIgnoreCase("REST"))
		{
			rtn = "officeindex";
		}
		else if (USER_RANK.equalsIgnoreCase("SUPP"))
		{
			rtn = "officeindex";
		}
		else 
		{
			rtn = "main";
		}
		return rtn;
	}
		

	@RequestMapping("/modal/popup.do")
	public ModelAndView modal(@RequestParam Map<String, Object> params, Model model, ModelAndView mav) {
		String rtn = "";
		String popId = (String)params.get("popId");
		String CATID = (String)params.get("CAT_ID");
		int catid=Integer.parseInt(CATID);
		logger.info(" logger : " + CATID);
		if("code01".equals(popId)) {
			CodeDTO list = codeService.detailCode01(catid);
			model.addAttribute("list",list);
			rtn = "modal/detailcode01";
		}
		else if("code".equals(popId)) {
			List<CodeDTO> list=codeService.listCode0201();
			model.addAttribute("list",list);
			rtn = "modal/detailcode02";
		}
		logger.debug(rtn);
		mav.setViewName(rtn);
		return mav;
	}
	
	@RequestMapping("upload.do")
	public ModelAndView list01(ModelAndView mav) {
		mav.setViewName("upload");
		return mav;
	}

}
