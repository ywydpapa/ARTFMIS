package kr.ghtech.artfms.room;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.code.service.CodeService;
import kr.ghtech.artfms.cont.service.ContService;
import kr.ghtech.artfms.goods.service.GoodsService;
import kr.ghtech.artfms.room.dto.RoomDTO;
import kr.ghtech.artfms.room.service.RoomService;
import kr.ghtech.artfms.setup.service.SetupService;

@Controller
@RequestMapping("/room/*")
public class RoomController {
	
	@Inject
	RoomService roomService;
	
	@Inject
	ContService contService;
	
	@Inject
	GoodsService goodsService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	SetupService setupService;
	
	@RequestMapping("orderlist/{CONTRACT_ID}")
	public ModelAndView write2(@PathVariable("CONTRACT_ID") int CONTRACT_ID,ModelAndView mav) {
		mav.addObject("restord", roomService.listRESTOrder(CONTRACT_ID));
		mav.addObject("storeord", roomService.listSTOREOrder(CONTRACT_ID));
		mav.setViewName("room/orderlist");
		return mav;
	}
	
	@RequestMapping("ordlist/{CONTRACT_ID}")
	public ModelAndView ordlist(@PathVariable("CONTRACT_ID") int CONTRACT_ID,ModelAndView mav) {
		mav.addObject("ord", roomService.listOrder(CONTRACT_ID));
		mav.setViewName("room/ordlist");
		return mav;
	}
	
	@RequestMapping("orddetail/{ORD_DATE}")
	public ModelAndView orddetail(@PathVariable("ORD_DATE") String ORD_DATE,RoomDTO dto,ModelAndView mav) {
		mav.addObject("orddtl", roomService.ordDetail(dto));
		mav.setViewName("room/cfnorderlist");
		return mav;
	}
	
	@RequestMapping("addorderlist/{CONTRACT_ID}")
	public ModelAndView addwrite2(@PathVariable("CONTRACT_ID") int CONTRACT_ID,ModelAndView mav) {
		mav.addObject("restord", roomService.listaddRESTOrder(CONTRACT_ID));
		mav.addObject("storeord", roomService.listaddSTOREOrder(CONTRACT_ID));
		mav.setViewName("room/addorderlist");
		return mav;
	}

	@RequestMapping("addorderlistall.do")
	public ModelAndView listall(ModelAndView mav) {
		mav.addObject("restordall", roomService.listRESTOrderall());
		mav.addObject("storeordall", roomService.listSTOREOrderall());
		mav.setViewName("cont/addorderlistall");
		return mav;
	}
	
	
	@RequestMapping("confirmord/{CONTRACT_ID}")
	public ModelAndView cfnwrite2(@PathVariable("CONTRACT_ID") int CONTRACT_ID,ModelAndView mav) {
		mav.addObject("cont",contService.detailCont(CONTRACT_ID));
		mav.addObject("ord", roomService.listOrder(CONTRACT_ID));
		mav.addObject("time",setupService.timelistSetup());
		mav.setViewName("room/ordlistview");
		return mav;
	}
	
	@RequestMapping("confirminiord/{CONTRACT_ID}")
	public ModelAndView cfniniwrite2(@PathVariable("CONTRACT_ID") int CONTRACT_ID,ModelAndView mav) {
		mav.addObject("iniftord", roomService.listiniFtableOrder(CONTRACT_ID));
		mav.addObject("inialtord", roomService.listiniAltarOrder(CONTRACT_ID));
		mav.addObject("inifgord", roomService.listiniFgoodsOrder(CONTRACT_ID));
		mav.setViewName("room/cfniniorderlist");
		return mav;
	}
	
	@RequestMapping("restord/{FROOM_ID}")
	public ModelAndView restordlist(@PathVariable("FROOM_ID") int FROOM_ID, ModelAndView mav) {
		mav.addObject("list2n", codeService.listCode020n(2));
		mav.addObject("doslist2", contService.doscontlist2f(FROOM_ID));
		mav.setViewName("room/restOrdlist");
		return mav;
	}

	@RequestMapping("storeord/{FROOM_ID}")
	public ModelAndView storeordlist(@PathVariable("FROOM_ID") int FROOM_ID,ModelAndView mav) {
		mav.addObject("list2n", codeService.listCode020n(3));
		mav.addObject("doslist3", contService.doscontlist3f(FROOM_ID));
		mav.setViewName("room/storeOrdlist");
		return mav;
	}
	
	@RequestMapping("updRord.do")
	public ResponseEntity<?> updateRord(@ModelAttribute RoomDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int RordUpdate = roomService.updateRorder(dto);
		if (RordUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updSord.do")
	public ResponseEntity<?> updateSord(@ModelAttribute RoomDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int SordUpdate = roomService.updateSorder(dto);
		if (SordUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updFtord.do")
	public ResponseEntity<?> updateFtord(@ModelAttribute RoomDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int FordUpdate = roomService.updateForder(dto);
		if (FordUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updAltord.do")
	public ResponseEntity<?> updateAltord(@ModelAttribute RoomDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int AordUpdate = roomService.updateAorder(dto);
		if (AordUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updFgord.do")
	public ResponseEntity<?> updateFgord(@ModelAttribute RoomDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int GordUpdate = roomService.updateGorder(dto);
		if (GordUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


}
