
package kr.ghtech.artfms.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.user.dto.UserDTO;
import kr.ghtech.artfms.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Inject
	UserService userService;
	
	@RequestMapping("login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "user/write";
	}

	@RequestMapping("changepasswd.do")
	public String chgpass() {
		return "user/passwdChg";
	}
	
	@RequestMapping("view.do")
	public ModelAndView userView(@ModelAttribute UserDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		
		UserDTO userInfo = userService.viewUser(dto);
		
		mav.addObject("userInfo", userInfo);
		mav.setViewName("user/view");
		
		return mav;
	}
	
	@RequestMapping("list.do")
	public String userList(Model model) {
		List<UserDTO> list=userService.userList();
		model.addAttribute("list",list);
		return "user/list";
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> userUpdate(@ModelAttribute UserDTO dto) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		int userUpdate =userService.updateUser(dto);
		
		if(userUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	} 
	
	@RequestMapping(value="/login_check.do")
	public ModelAndView loginCheck(@ModelAttribute UserDTO dto, HttpSession session) {
		boolean result = userService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) {
			UserDTO userInfo = userService.viewUser(dto);
			String typ = userInfo.getUSER_RANK();
			if(typ == null)
			{
			mav.setViewName("user/login");
			}
			else if (typ.equalsIgnoreCase("ROOM"))
			{
			mav.setViewName("index");	
			}
			else if (typ.equalsIgnoreCase("STORE"))
			{
			mav.setViewName("officeindex");	
			}
			else if (typ.equalsIgnoreCase("REST"))
			{
			mav.setViewName("officeindex");	
			}
			else if (typ.equalsIgnoreCase("SUPP"))
			{
			mav.setViewName("officeindex");	
			}
			else
			{
			mav.setViewName("main");
			}
			mav.addObject("msg", "Success");
			mav.addObject("USER_NAMK", userInfo.getUSER_NAMK());
			mav.addObject("USER_FROOM_ID", userInfo.getFROOM_ID());
			session.setAttribute("USER_RANK", userInfo.getUSER_RANK());
			session.setAttribute("USER_LOGINID", userInfo.getUSER_LOGINID());
			session.setAttribute("USER_NAMK", userInfo.getUSER_NAMK());
			session.setAttribute("USER_FROOM_ID", userInfo.getFROOM_ID());
		}else{
			mav.setViewName("user/login");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}

	@RequestMapping("updPasswd.do")
	public ResponseEntity<?> userpasswdUpdate(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int userUpdate =userService.updPasswd(dto);
		if(userUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	}


}
