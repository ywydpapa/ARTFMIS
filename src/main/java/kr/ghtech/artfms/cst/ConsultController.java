package kr.ghtech.artfms.cst;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.code.service.CodeService;
import kr.ghtech.artfms.cont.service.ContService;
import kr.ghtech.artfms.cst.dto.ConsultDTO;
import kr.ghtech.artfms.cst.service.ConsultService;
import kr.ghtech.artfms.goods.service.GoodsService;
import kr.ghtech.artfms.setup.service.SetupService;

@Controller

@RequestMapping("/consult/*")
public class ConsultController {
	
	@Inject
	GoodsService goodsService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	ContService contService;
	
	@Inject
	ConsultService consultService;
	
	@Inject
	SetupService setupService;
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.addObject("listconsult", consultService.listconsut());
		mav.setViewName("consult/consultListview");
		return mav;
	}
	
	@RequestMapping("/detailConsultNew.do")
	public ModelAndView detailNew(ModelAndView mav) {
		mav.addObject("listroom", goodsService.listRoom(1));
		mav.addObject("listAltar", contService.doslistAltar());
		mav.addObject("listEtcroom", consultService.doslistEtcroom());
		mav.addObject("listFroom", consultService.doslistFroom());
		mav.addObject("listFtable", contService.doslistFtable());
		mav.addObject("listEtcroom", contService.doslistEtcroom());
		mav.addObject("listFgoodsM", contService.doslistFgoodsM());
		mav.addObject("listFgoodsM13", contService.doslistFgoodsMn(13));
		mav.addObject("listFgoodsM14", contService.doslistFgoodsMn(14));
		mav.addObject("listFgoodsM15", contService.doslistFgoodsMn(15));
		mav.addObject("listFgoodsM16", contService.doslistFgoodsMn(16));
		mav.addObject("listFgoodsM17", contService.doslistFgoodsMn(17));
		mav.addObject("listFgoodsM18", contService.doslistFgoodsMn(18));
		mav.addObject("listFgoodsT", contService.doslistFgoodsT());
		mav.addObject("listFgoodsT13", contService.doslistFgoodsTn(13));
		mav.addObject("listFgoodsT14", contService.doslistFgoodsTn(14));
		mav.addObject("listFgoodsT15", contService.doslistFgoodsTn(15));
		mav.addObject("listFgoodsT16", contService.doslistFgoodsTn(16));
		mav.addObject("listFgoodsT17", contService.doslistFgoodsTn(17));
		mav.addObject("listFgoodsT18", contService.doslistFgoodsTn(18));
		mav.addObject("code0201", codeService.listCode0201());
		mav.addObject("regioncode", codeService.listconBcode("3"));
		mav.setViewName("consult/detail");
		return mav;
	}
	
	@RequestMapping("/detailConsult/{CONSULT_ID}")
	public ModelAndView detail(@PathVariable("CONSULT_ID") int CONSULT_ID, ModelAndView mav) {
		mav.addObject("cst", consultService.detailConsult(CONSULT_ID));
		mav.addObject("listroom", goodsService.listRoom(1));
		mav.addObject("listAltar", contService.doslistAltar());
		mav.addObject("listEtcroom", consultService.doslistEtcroom());
		mav.addObject("listFroom", consultService.doslistFroom());
		mav.addObject("listFtable", contService.doslistFtable());
		mav.addObject("consultpage3", consultService.reloadP3(CONSULT_ID));
		mav.addObject("consultpage4m", consultService.reloadP4m(CONSULT_ID));
		mav.addObject("consultpage5", consultService.reloadP5(CONSULT_ID));
		mav.addObject("listEtcroom", contService.doslistEtcroom());
		mav.addObject("listFgoodsM", contService.doslistFgoodsM());
		mav.addObject("listFgoodsM13", contService.doslistFgoodsMn(13));
		mav.addObject("listFgoodsM14", contService.doslistFgoodsMn(14));
		mav.addObject("listFgoodsM15", contService.doslistFgoodsMn(15));
		mav.addObject("listFgoodsM16", contService.doslistFgoodsMn(16));
		mav.addObject("listFgoodsM17", contService.doslistFgoodsMn(17));
		mav.addObject("listFgoodsM18", contService.doslistFgoodsMn(18));
		mav.addObject("listFgoodsT", contService.doslistFgoodsT());
		mav.addObject("listFgoodsT13", contService.doslistFgoodsTn(13));
		mav.addObject("listFgoodsT14", contService.doslistFgoodsTn(14));
		mav.addObject("listFgoodsT15", contService.doslistFgoodsTn(15));
		mav.addObject("listFgoodsT16", contService.doslistFgoodsTn(16));
		mav.addObject("listFgoodsT17", contService.doslistFgoodsTn(17));
		mav.addObject("listFgoodsT18", contService.doslistFgoodsTn(18));
		mav.addObject("consultGet", consultService.ConsultGet(CONSULT_ID));
		mav.addObject("code0201", codeService.listCode0201());
		mav.addObject("regioncode", codeService.listconBcode("3"));
//		mav.addObject("selectoneFroom", consultService.detailCstRentfee(CONSULT_ID));
		mav.addObject("CONSULT_ID",CONSULT_ID);
		mav.setViewName("consult/detail");
		return mav;
	}

	@RequestMapping("/defaultConsult/{CONSULT_ID}")
	public ModelAndView defaultcon(@PathVariable("CONSULT_ID") int CONSULT_ID, ModelAndView mav) {
		mav.addObject("cst", consultService.detailConsult(CONSULT_ID));
		mav.addObject("listEtcroom", consultService.doslistEtcroom());
		mav.addObject("listFroom", consultService.doslistFroom());
		mav.addObject("consultpage3", consultService.reloadP3(CONSULT_ID));
		mav.addObject("consultpage4m", consultService.reloadP4m(CONSULT_ID));
		mav.addObject("consultpage5", consultService.reloadP5(CONSULT_ID));
		mav.addObject("regioncode", codeService.listconBcode("3"));
		mav.addObject("consultGet", consultService.ConsultGet(CONSULT_ID));
		mav.addObject("setu", setupService.listSetup());
//		mav.addObject("selectoneFroom", consultService.detailCstRentfee(CONSULT_ID));
		mav.setViewName("consult/default");
		mav.addObject("contpage2fr2", consultService.reloadP2froom2(CONSULT_ID));
		return mav;
	}
	
	@RequestMapping("/defaultConsultNew.do")
	public ModelAndView defaultconNew(ModelAndView mav) {
		mav.addObject("listEtcroom", consultService.doslistEtcroom());
		mav.addObject("listFroom", consultService.doslistFroom());
		mav.addObject("regioncode", codeService.listconBcode("3"));
		mav.addObject("setu", setupService.listSetup());
		mav.setViewName("consult/default");
		return mav;
	}
	
	@RequestMapping("insertConsult.do")
	public ResponseEntity<?> insertconsult(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int consultInsert = consultService.insertConsult(dto);
		if (consultInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertCstFtable.do")
	public ResponseEntity<?> insertcstFtable(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int consultInsert = consultService.insertCstFtable(dto);
		if (consultInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("deleteCstFtable.do")
	public ResponseEntity<?> deletecstFtable(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int consultInsert = consultService.deleteCstFtable(dto);
		if (consultInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("updateConsult.do")
	public ResponseEntity<?> updateconsult(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int consultUpdate = consultService.updateConsult(dto);
		if (consultUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertCSTRentfee.do")
	public ResponseEntity<?> insertCSTRentfee(HttpSession session, @ModelAttribute ConsultDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int consultInsert = consultService.insertCSTRentfee(dto);
		if (consultInsert > 0) {
			param.put("code","10001");
		} else {
			param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP2.do")
	public ResponseEntity<?> insertP2(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP2Insert = consultService.insertConsult2(dto);
		if (ContP2Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertP3.do")
	public ResponseEntity<?> insertP3(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP3Insert = consultService.insertConsult3(dto);
		if (ContP3Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP4.do")
	public ResponseEntity<?> insertP4(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP4Insert = consultService.insertConsult4(dto);
		if (ContP4Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP5.do")
	public ResponseEntity<?> insertP5(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP5Insert = consultService.insertConsult5(dto);
		if (ContP5Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updateCSTRentfee.do")
	public ResponseEntity<?> updateCSTRentfee(HttpSession session, @ModelAttribute ConsultDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int consultUpdate = consultService.updateCSTRentfee(dto);
		if (consultUpdate > 0) {
			param.put("code","10001");
		} else {
			param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP2.do")
	public ResponseEntity<?> updateP2(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP2UPD = consultService.updateConsult2(dto);
		if (ContP2UPD >= 0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP3.do")
	public ResponseEntity<?> updateP3(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP3UPD = consultService.updateConsult3(dto);
		if (ContP3UPD >= 0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP4.do")
	public ResponseEntity<?> updateP4(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP4UPD = consultService.updateConsult4(dto);
		if (ContP4UPD >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP5.do")
	public ResponseEntity<?> updateP5(@ModelAttribute ConsultDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP5UPD = consultService.updateConsult5(dto);
		if (ContP5UPD >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("deleteCSTRentfee.do")
	public ResponseEntity<?> deleteCSTRentfee(HttpSession session, @ModelAttribute ConsultDTO dto){
		Map<String, Object> param = new HashMap<String, Object>();
		int consultDelete = consultService.deleteCSTRentfee(dto);
		if (consultDelete > 0) {
			param.put("code","10001");
		} else {
			param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@ResponseBody
	@RequestMapping("/consultSeleteGet/{CONSULT_ID}")
	public List<ConsultDTO> consultSeleteGet(@PathVariable("CONSULT_ID") int CONSULT_ID) {
		List<ConsultDTO> consultSelete = consultService.consultSeleteGet(CONSULT_ID);
		return consultSelete;
	}
	
	@ResponseBody
	@RequestMapping("consultModalList.do")
	public List<ConsultDTO> consultModalList(){
		List<ConsultDTO> consultList = consultService.consultModalList();
		return consultList;
	}
	
	@ResponseBody
	@RequestMapping("consultModalSearch.do")
	public List<ConsultDTO> consultModalSearch(@ModelAttribute ConsultDTO dto){
		List<ConsultDTO> consultList = consultService.consultModalSearch(dto);
		return consultList;
	}
	
	@ResponseBody
	@RequestMapping("writeConsultSelect/{CONSULT_ID}")
	public List<ConsultDTO> writeConsultSelect(@PathVariable("CONSULT_ID") int CONSULT_ID){
		List<ConsultDTO> consultList = consultService.writeConsultSelect(CONSULT_ID);
		return consultList;
	}
	
	@ResponseBody
	@RequestMapping("writeConsultFtable/{CONSULT_ID}")
	public List<ConsultDTO> writeConsultFtable(@PathVariable("CONSULT_ID") int CONSULT_ID){
		List<ConsultDTO> consultList = consultService.reloadP3(CONSULT_ID);
		
		return consultList;
	}
	
	@ResponseBody
	@RequestMapping("writeConsultGoods/{CONSULT_ID}")
	public List<ConsultDTO> writeConsultGoods(@PathVariable("CONSULT_ID") int CONSULT_ID){
		List<ConsultDTO> consultList = consultService.reloadP4m(CONSULT_ID);
		
		return consultList;
	}
	
	@ResponseBody
	@RequestMapping("writeConsultAltar/{CONSULT_ID}")
	public List<ConsultDTO> writeConsultAltar(@PathVariable("CONSULT_ID") int CONSULT_ID){
		List<ConsultDTO> consultList = consultService.reloadP5(CONSULT_ID);
		
		return consultList;
	}
	
}
