package kr.ghtech.artfms.cont;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.code.service.CodeService;
import kr.ghtech.artfms.cont.dto.ContDTO;
import kr.ghtech.artfms.cont.service.ContService;
import kr.ghtech.artfms.cst.service.ConsultService;
import kr.ghtech.artfms.goods.service.GoodsService;
import kr.ghtech.artfms.setup.service.SetupService;

@Controller
@RequestMapping("/cont/*")
public class ContController {
	
	@Inject
	ContService contService;
	
	@Inject
	GoodsService goodsService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	ConsultService consultService;
	
	@Inject
	SetupService setupService;
	
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("cont/list");
		return mav;
	}
	
	@RequestMapping("settleRule.do")
	public ModelAndView srule(ModelAndView mav) {
		mav.setViewName("cont/sRulelistview");
		return mav;
	}
	
	
	@RequestMapping("contdetail/{CONT_FROOM_ID}")
	public ModelAndView write(@PathVariable("CONT_FROOM_ID") int CONT_FROOM_ID, ModelAndView mav) {
		mav.addObject("listroom", goodsService.listRoom(1));
		mav.addObject("code0201", codeService.listCode0201());
		mav.addObject("doslist2", contService.doscontlist2(CONT_FROOM_ID));
		mav.addObject("doslist3", codeService.listCode0203());
		mav.setViewName("cont/write");
		return mav;
	}

	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.addObject("list", contService.listCont());
		mav.addObject("listFroom", contService.doslistFroom());
		mav.setViewName("cont/contListview");
		return mav;
	}
	
	@RequestMapping("contlist.do")
	public ModelAndView contlist(ModelAndView mav) {
		mav.addObject("listcont", contService.listCont());
		mav.setViewName("cont/contlist");
		return mav;
	}
	
	@RequestMapping("conttrlist.do")
	public ModelAndView conttrlist(ModelAndView mav) {
		mav.addObject("listcont", contService.listCont());
		mav.addObject("listroomemp", contService.doslistFroomemp());
		mav.setViewName("cont/conttrlist");
		return mav;
	}
	
	@RequestMapping("settlistview.do")
	public ModelAndView settlist(ModelAndView mav) {
		mav.addObject("listcont", contService.listCont());
		mav.setViewName("cont/settlistview");
		return mav;
	}

	@RequestMapping("reload3page.do")
	public ModelAndView reload3p(ModelAndView mav) {
		mav.addObject("listFtable", contService.doslistFtable());
		mav.setViewName("cont/page3");
		return mav;
	}
	
	@RequestMapping("reload4page.do")
	public ModelAndView reload4p(ModelAndView mav) {
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
		mav.setViewName("cont/page4");
		return mav;
	}
	
	
	@RequestMapping("reload5page.do")
	public ModelAndView reload5p(ModelAndView mav) {
		mav.addObject("listAltar", contService.doslistAltar());
		mav.setViewName("cont/page5");
		return mav;
	}
	
		@RequestMapping("reload6page.do")
	public ModelAndView reload6p(@RequestParam("CONT_FROOM_ID") Integer CONT_FROOM_ID,ModelAndView mav) {
		mav.addObject("doslist2", contService.doscontlist2(CONT_FROOM_ID));
		mav.setViewName("cont/callRestlist");
		return mav;
	}
	
	@RequestMapping("reload7page.do")
	public ModelAndView reload7p(@RequestParam("CONT_FROOM_ID") Integer CONT_FROOM_ID,ModelAndView mav) {
		mav.addObject("doslist3", contService.doscontlist3(CONT_FROOM_ID));
		mav.setViewName("cont/callStorelist");
		return mav;
	}
	

	@RequestMapping("write/{CONT_FROOM_ID}")
	public ModelAndView write2(@PathVariable("CONT_FROOM_ID") Integer CONT_FROOM_ID, @RequestParam("FROOM_TITLE") String FROOM_TITLE,ModelAndView mav) {
		mav.addObject("listroom", goodsService.listRoom(1));
		mav.addObject("listAltar", contService.doslistAltar());
		mav.addObject("listFroom", contService.doslistFroom2());
		mav.addObject("listFtable", contService.doslistFtable());
		mav.addObject("listEtcroom", contService.doslistEtcroom());
		mav.addObject("listEtcroom2", contService.doslistEtcroom2());
		mav.addObject("listFgoodsM", contService.doslistFgoodsM());
		mav.addObject("listFgoodsM13", contService.doslistFgoodsMn(1));
		mav.addObject("listFgoodsM14", contService.doslistFgoodsMn(2));
		mav.addObject("listFgoodsM15", contService.doslistFgoodsMn(4));
		mav.addObject("listFgoodsM16", contService.doslistFgoodsMn(19));
		mav.addObject("listFgoodsM17", contService.doslistFgoodsMn(20));
		mav.addObject("listFgoodsM18", contService.doslistFgoodsMn(21));
		mav.addObject("listFgoodsT", contService.doslistFgoodsT());
		mav.addObject("listFgoodsT13", contService.doslistFgoodsTn(1));
		mav.addObject("listFgoodsT14", contService.doslistFgoodsTn(2));
		mav.addObject("listFgoodsT15", contService.doslistFgoodsTn(4));
		mav.addObject("listFgoodsT16", contService.doslistFgoodsTn(19));
		mav.addObject("listFgoodsT17", contService.doslistFgoodsTn(20));
		mav.addObject("listFgoodsT18", contService.doslistFgoodsTn(21));
		mav.addObject("code0201", codeService.listCode0201());
		mav.addObject("contCombo", contService.listContcombo());
		mav.addObject("regioncode", codeService.listconBcode("3"));
		mav.addObject("frelation", codeService.listconBcode("5"));
		mav.addObject("doslist2", contService.doscontlist2(CONT_FROOM_ID));
		mav.addObject("doslist3", contService.doscontlist3(CONT_FROOM_ID));
		mav.addObject("infocont", setupService.infoCont());
		mav.addObject("pagetitle", FROOM_TITLE);
		mav.addObject("frid", CONT_FROOM_ID);
		mav.addObject("listconsult", consultService.listconsut());
		mav.setViewName("cont/write");
		return mav;
	}

	@RequestMapping("detail/{CONTRACT_ID}")
	public ModelAndView detail2(@PathVariable("CONTRACT_ID") Integer CONTRACT_ID, @ModelAttribute ContDTO dto, ModelAndView mav) {
		Integer CONT_FROOM_ID = Integer.valueOf(dto.getCONT_FROOM_ID());
		String TEMP_ROOM = String.valueOf(dto.getTEMP_ROOM());
		mav.addObject("frid", CONT_FROOM_ID);
		mav.addObject("CONTid", CONTRACT_ID);
		mav.addObject("tmprYn",TEMP_ROOM);
		mav.addObject("listroom", goodsService.listRoom(1));
		mav.addObject("contCombo", contService.listContcombo());
		mav.addObject("listFroom", contService.doslistFroom());
		mav.addObject("listEtcroom", contService.doslistEtcroom());
		mav.addObject("listEtcroom2", contService.doslistEtcroom2());
		mav.addObject("listFgoodsM", contService.doslistFgoodsM());
		mav.addObject("listFgoodsM13", contService.doslistFgoodsMn(1));
		mav.addObject("listFgoodsM14", contService.doslistFgoodsMn(2));
		mav.addObject("listFgoodsM15", contService.doslistFgoodsMn(4));
		mav.addObject("listFgoodsM16", contService.doslistFgoodsMn(19));
		mav.addObject("listFgoodsM17", contService.doslistFgoodsMn(20));
		mav.addObject("listFgoodsM18", contService.doslistFgoodsMn(21));
		mav.addObject("listFgoodsT", contService.doslistFgoodsT());
		mav.addObject("listFgoodsT13", contService.doslistFgoodsTn(1));
		mav.addObject("listFgoodsT14", contService.doslistFgoodsTn(2));
		mav.addObject("listFgoodsT15", contService.doslistFgoodsTn(4));
		mav.addObject("listFgoodsT16", contService.doslistFgoodsTn(19));
		mav.addObject("listFgoodsT17", contService.doslistFgoodsTn(20));
		mav.addObject("listFgoodsT18", contService.doslistFgoodsTn(21));
		mav.addObject("code0201", codeService.listCode0201());
		mav.addObject("regioncode", codeService.listconBcode("3"));
		mav.addObject("frelation", codeService.listconBcode("5"));
		mav.addObject("detailCont", contService.detailCont(CONTRACT_ID));
		mav.addObject("contpage2fr", contService.reloadP2froom(CONTRACT_ID));
		mav.addObject("contpage2fr2", contService.reloadP2froom2(CONTRACT_ID));
		mav.addObject("contpage3", contService.reloadP3(CONTRACT_ID));
		mav.addObject("contpage4m", contService.reloadP4m(CONTRACT_ID));
		mav.addObject("contpage4t", contService.reloadP4t(CONTRACT_ID));
		mav.addObject("contpage5", contService.reloadP5(CONTRACT_ID));
		mav.addObject("contpage6", contService.reloadP6(dto));
		mav.addObject("contpage7", contService.reloadP7(dto));
		mav.addObject("contpage8", contService.reloadP8(CONTRACT_ID));
		mav.addObject("contpage9", contService.reloadP9(CONTRACT_ID));
		mav.addObject("listYujok", contService.listYujok(CONTRACT_ID));
		mav.addObject("infocont", setupService.infoCont());
		mav.setViewName("cont/detail");
		return mav;
	}

	@RequestMapping("detailcont/{CONTRACT_ID}")
	public ModelAndView detailcont2(@PathVariable("CONTRACT_ID") Integer CONTRACT_ID, @ModelAttribute ContDTO dto, ModelAndView mav) {
		Integer CONT_FROOM_ID = Integer.valueOf(dto.getCONT_FROOM_ID());
		mav.addObject("frid", CONT_FROOM_ID);
		mav.addObject("CONTid", CONTRACT_ID);
		mav.addObject("listroom", goodsService.listRoom(1));
		mav.addObject("listEtcroom", contService.doslistEtcroom());
		mav.addObject("code0201", codeService.listCode0201());
		mav.addObject("regioncode", codeService.listconBcode("3"));
		mav.addObject("frelation", codeService.listconBcode("5"));
		mav.addObject("detailCont", contService.detailCont(CONTRACT_ID));
		mav.addObject("contpage2", contService.reloadP2(CONTRACT_ID));
		mav.addObject("contpage3", contService.reloadP3(CONTRACT_ID));
		mav.addObject("listYujok", contService.listYujok(CONTRACT_ID));
		mav.addObject("listroomemp", contService.doslistFroomemp());
		mav.addObject("addlist",contService.listAddroom(CONTRACT_ID));
		mav.setViewName("cont/detailcont");
		return mav;
	}
	
	@RequestMapping("detailconttr/{CONTRACT_ID}")
	public ModelAndView detailconttr(@PathVariable("CONTRACT_ID") Integer CONTRACT_ID, @ModelAttribute ContDTO dto, ModelAndView mav) {
		Integer CONT_FROOM_ID = Integer.valueOf(dto.getCONT_FROOM_ID());
		mav.addObject("frid", CONT_FROOM_ID);
		mav.addObject("CONTid", CONTRACT_ID);
		mav.addObject("listroom", goodsService.listRoom(1));
		mav.addObject("detailCont", contService.detailCont(CONTRACT_ID));
		mav.addObject("contpage2", contService.reloadP2(CONTRACT_ID));
		mav.addObject("listroomemp", contService.doslistFroomemp());
		mav.setViewName("cont/detailconttr");
		return mav;
	}


	
	
	@RequestMapping("settdetail/{CONTRACT_ID}")
	public ModelAndView settdetail2(@PathVariable("CONTRACT_ID") Integer CONTRACT_ID, @ModelAttribute ContDTO dto, ModelAndView mav) {
		Integer CONT_FROOM_ID = Integer.valueOf(dto.getCONT_FROOM_ID());
		mav.addObject("frid", CONT_FROOM_ID);
		mav.addObject("CONTid", CONTRACT_ID);
		mav.addObject("detailCont", contService.detailCont(CONTRACT_ID));
		mav.addObject("rtnpage7", contService.returnP7(dto));
		mav.addObject("spage2", contService.settleP2(dto));
		mav.addObject("spage3", contService.settleP3(dto));
		mav.addObject("spage4", contService.settleP4(dto));
		mav.addObject("spage5", contService.settleP5(dto));
		mav.addObject("spage6", contService.settleP6(dto));
		mav.addObject("spage7", contService.settleP7(dto));
		mav.addObject("spage8", contService.settleP8(dto));
		mav.addObject("settdisc", contService.listSettDisc(CONTRACT_ID));
		mav.setViewName("cont/settdetail");
		return mav;
	}

	
	
	@RequestMapping("insertP1.do")
	public ResponseEntity<?> insertP1(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP1Insert = contService.insertCont(dto);
		if (ContP1Insert >0) {
			param.put("code","10001");
			param.put("contid", ContP1Insert);
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertP2.do")
	public ResponseEntity<?> insertP2(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP2Insert = contService.insertCont2(dto);
		if (ContP2Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP3.do")
	public ResponseEntity<?> insertP3(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP3Insert = contService.insertCont3(dto);
		if (ContP3Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP4.do")
	public ResponseEntity<?> insertP4(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP4Insert = contService.insertCont4(dto);
		if (ContP4Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP5.do")
	public ResponseEntity<?> insertP5(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP5Insert = contService.insertCont5(dto);
		if (ContP5Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP6.do")
	public ResponseEntity<?> insertP6(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP6Insert = contService.insertCont6(dto);
		if (ContP6Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP7.do")
	public ResponseEntity<?> insertP7(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP7Insert = contService.insertCont7(dto);
		if (ContP7Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP8.do")
	public ResponseEntity<?> insertP8(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP8Insert = contService.insertCont8(dto);
		if (ContP8Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertP9.do")
	public ResponseEntity<?> insertP9(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP9Insert = contService.insertCont9(dto);
		if (ContP9Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("insertSrule.do")
	public ResponseEntity<?> insertSrule(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContSruleInsert = contService.insertSrule(dto);
		if (ContSruleInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertSett.do")
	public ResponseEntity<?> insertSett(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContSdisc= contService.insertSett(dto);
		if (ContSdisc >0) {
			param.put("code","10001");
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertSDisc.do")
	public ResponseEntity<?> insertSDisc(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContSdisc= contService.insertSettDisc(dto);
		if (ContSdisc >0) {
			param.put("code","10001");
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updateSettDisc.do")
	public ResponseEntity<?> updateSDisc(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContSdisc= contService.updateSettDisc(dto);
		if (ContSdisc >0) {
			param.put("code","10001");
		}
		else {param.put("code","10001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertRtnStore.do")
	public ResponseEntity<?> insertRtnStore(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContRtn = contService.insertRtnStore(dto);
		if (ContRtn >0) {
			param.put("code","10001");
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updateRtnStore.do")
	public ResponseEntity<?> updateRtnStore(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContRtn = contService.updateRtnStore(dto);
		if (ContRtn >0) {
			param.put("code","10001");
		}
		else {param.put("code","10001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertRtnRest.do")
	public ResponseEntity<?> insertRtnRest(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContRtn = contService.insertRtnRest(dto);
		if (ContRtn >0) {
			param.put("code","10001");
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateSrule.do")
	public ResponseEntity<?> updateSrule(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContSruleUpdate = contService.updateSrule(dto);
		if (ContSruleUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("checkFroom.do")
	public ResponseEntity<?> chkFroom(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int chkRoom = contService.chkRoom(dto);
		if (chkRoom >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("contCheck.do")
	public ResponseEntity<?> contChk(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		Integer chkcont = contService.contCheck(dto);
		if (chkcont != null) {
			param.put("code","10001");
			param.put("contid", chkcont);
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updateP2.do")
	public ResponseEntity<?> updateP2(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP2UPD = contService.updateCont2(dto);
		if (ContP2UPD >= 0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP2tr.do")
	public ResponseEntity<?> updateP2tr(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP2UPD = contService.updateCont2tr(dto);
		if (ContP2UPD >= 0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP3.do")
	public ResponseEntity<?> updateP3(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP3UPD = contService.updateCont3(dto);
		if (ContP3UPD >= 0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP4.do")
	public ResponseEntity<?> updateP4(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP4UPD = contService.updateCont4(dto);
		if (ContP4UPD >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP5.do")
	public ResponseEntity<?> updateP5(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP5UPD = contService.updateCont5(dto);
		if (ContP5UPD >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP6.do")
	public ResponseEntity<?> updateP6(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP6UPD = contService.updateCont6(dto);
		if (ContP6UPD >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP7.do")
	public ResponseEntity<?> updateP7(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP7UPD = contService.updateCont7(dto);
		if (ContP7UPD >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updateP8.do")
	public ResponseEntity<?> updateP8(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP8UPD = contService.updateCont8(dto);
		if (ContP8UPD >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updateP1.do")
	public ResponseEntity<?> updateP1(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ContP1UPD = contService.updateCont(dto);
		if (ContP1UPD >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("insertYujok.do")
	public ResponseEntity<?> insYJ(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int insYJ = contService.insertYujok(dto);
		if (insYJ >0) {
			param.put("code","10001"); 
			param.put("yjid", insYJ);
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("addRoom.do")
	public ResponseEntity<?> addRoom(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int insRM = contService.insertAddroom(dto);
		if (insRM >0) {
			param.put("code","10001"); 
			param.put("froomid", dto.getCONT_FROOM_ID());
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("delRoom.do")
	public ResponseEntity<?> delroom(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int updYJ = contService.deleteAddroom(dto);
		if (updYJ >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("updateYujok.do")
	public ResponseEntity<?> updYJ(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int updYJ = contService.updateYujok(dto);
		if (updYJ >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("tropt01.do")
	public ResponseEntity<?> tropt01(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int updOPT01 = contService.tropt01(dto);
		if (updOPT01 >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("tropt02.do")
	public ResponseEntity<?> tropt02(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int updOPT02 = contService.tropt02(dto);
		if (updOPT02 >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("tropt03.do")
	public ResponseEntity<?> tropt03(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int updOPT03 = contService.tropt03(dto);
		if (updOPT03 >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("tropt03-1.do")
	public ResponseEntity<?> tropt0301(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int updOPT031 = contService.tropt0301(dto);
		if (updOPT031 >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
}
