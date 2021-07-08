package kr.ghtech.artfms.cst;

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
import kr.ghtech.artfms.cst.dto.ConsultDTO;
import kr.ghtech.artfms.cst.service.ConsultService;
import kr.ghtech.artfms.goods.service.GoodsService;

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
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.addObject("listconsult", consultService.listconsut());
		mav.setViewName("consult/consultListview");
		return mav;
	}
	
	@RequestMapping("/detailConsult/{CONSULT_ID}")
	public ModelAndView detail(@PathVariable("CONSULT_ID") int CONSULT_ID, ModelAndView mav) {
		mav.addObject("cst", consultService.detailConsult(CONSULT_ID));
		mav.addObject("listroom", goodsService.listRoom(1));
		mav.addObject("listAltar", contService.doslistAltar());
		mav.addObject("listFroom", contService.doslistFroom());
		mav.addObject("listFtable", contService.doslistFtable());
		mav.addObject("listEtcroom", contService.doslistEtcroom());
		mav.addObject("listFgoodsM", contService.doslistFgoodsM());
		mav.addObject("listFgoodsM13", contService.doslistFgoodsMn(13));
		mav.addObject("listFgoodsM14", contService.doslistFgoodsMn(14));
		mav.addObject("listFgoodsM15", contService.doslistFgoodsMn(14));
		mav.addObject("listFgoodsM16", contService.doslistFgoodsMn(15));
		mav.addObject("listFgoodsM17", contService.doslistFgoodsMn(16));
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
		mav.addObject("frelation", codeService.listconBcode("5"));
		mav.setViewName("consult/detail");
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


}
