
package kr.ghtech.artfms.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.code.service.CodeService;
import kr.ghtech.artfms.goods.service.GoodsService;
import kr.ghtech.artfms.user.dto.UserDTO;
import kr.ghtech.artfms.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Inject
	UserService userService;
	
	@Inject
	CodeService codeService;
	
	@Inject 
	GoodsService goodsService;
	
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
	
	@RequestMapping("detailnew.do")
	public ModelAndView detailnew(ModelAndView mav) {
		mav.setViewName("user/detailuser");
		return mav;
	}
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.addObject("list",userService.userList());
		mav.setViewName("user/listview");
		return mav;
	}
	
	@RequestMapping("listuser.do")
	public ModelAndView listuser(ModelAndView mav) {
		mav.addObject("list",userService.userList());
		mav.setViewName("user/listuser");
		return mav;
	}
	
	@RequestMapping("listrole.do")
	public ModelAndView listrole(ModelAndView mav) {
		mav.addObject("list",userService.userList());
		mav.setViewName("user/listrole");
		return mav;
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
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> userInsert(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int userInsert =userService.insertUser(dto);
		if(userInsert > 0) {
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
			UserDTO userInfo = userService.detailUser(dto);
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
			session.setAttribute("USER_ROLE1", userInfo.getUSER_ROLE1());
			session.setAttribute("ORDPASSWD", userInfo.getORD_PASSWD());
		}else{
			mav.addObject("msg", "Fail");
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
	
	@RequestMapping("updRole.do")
	public ResponseEntity<?> userRoleUpdate(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int userUpdate =userService.updRole(dto);
		if(userUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	}

	@RequestMapping("detail/{USER_ID}")
	public ModelAndView detail(@PathVariable("USER_ID") int USER_ID, ModelAndView mav) {
		mav.addObject("list",userService.detail(USER_ID));
		mav.addObject("dept",codeService.listconBcode("8"));
		mav.addObject("froom",goodsService.listRoom(1));
		mav.setViewName("user/detailuser");
		return mav;
	}

	@RequestMapping("detailRole/{USER_ID}")
	public ModelAndView detailRole(@PathVariable("USER_ID") int USER_ID, ModelAndView mav) {
		mav.addObject("list",userService.detail(USER_ID));
		mav.addObject("dept",codeService.listconBcode("8"));
		mav.setViewName("user/detailRole");
		return mav;
	}
}
