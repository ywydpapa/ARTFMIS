package kr.ghtech.artfms.goods;

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
import kr.ghtech.artfms.goods.dto.GoodsDTO;
import kr.ghtech.artfms.goods.service.GoodsService;
import kr.ghtech.artfms.setup.service.SetupService;

@Controller

@RequestMapping("/goods/*")
public class GoodsController {
	
	@Inject
	GoodsService goodsService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	SetupService setupService;
	
	@RequestMapping("listgoods.do")
	public ModelAndView listgoods(ModelAndView mav) {
		mav.addObject("listsel01", codeService.listCode01());
		mav.addObject("listsel02", codeService.listCode020n(1));
		/* mav.addObject("listgoods01", goodsService.listGoods01(13)); */
		mav.setViewName("goods/listgoods");
		return mav;
	}
	
	@RequestMapping("/listGoods01/{CAT_02_ID}")
	public ModelAndView listGoods01(@PathVariable("CAT_02_ID") int CAT_02_ID, ModelAndView mav) {
		mav.addObject("listgoods01", goodsService.listGoods01(CAT_02_ID));
		mav.setViewName("goods/listGoods01");
		return mav;
	}
	
	@RequestMapping("/listGoods02/{CAT_02_ID}")
	public ModelAndView listGoods02(@PathVariable("CAT_02_ID") int CAT_02_ID, ModelAndView mav) {
		mav.addObject("listgoods02", goodsService.listGoods02(CAT_02_ID));
		mav.setViewName("goods/listGoods02");
		return mav;
	}

	@RequestMapping("/listGoods03/{CAT_02_ID}")
	public ModelAndView listGoods03(@PathVariable("CAT_02_ID") int CAT_02_ID, ModelAndView mav) {
		mav.addObject("listgoods03", goodsService.listGoods03(CAT_02_ID));
		mav.setViewName("goods/listGoods03");
		return mav;
	}

	@RequestMapping("/listGoods04/{CAT_02_ID}")
	public ModelAndView listGoods04(@PathVariable("CAT_02_ID") int CAT_02_ID, ModelAndView mav) {
		mav.addObject("listgoods04", goodsService.listGoods04(CAT_02_ID));
		mav.setViewName("goods/listGoods04");
		return mav;
	}

	@RequestMapping("doslist121.do")
	public ModelAndView doslist121(@RequestParam("BCD_TITLE") String BCD_TITLE, ModelAndView mav) {
		mav.addObject("frid", 121);
		mav.addObject("pagetitle", BCD_TITLE);
		mav.addObject("list", goodsService.dosdefaultlist121());
		mav.setViewName("goods/dosDetail");
		return mav;
	}
	
	@RequestMapping("doslist122.do")
	public ModelAndView doslist122(@RequestParam("BCD_TITLE") String BCD_TITLE, ModelAndView mav) {
		mav.addObject("frid", 122);
		mav.addObject("pagetitle", BCD_TITLE);
		mav.addObject("list", goodsService.dosdefaultlist122());
		mav.setViewName("goods/dosDetail");
		return mav;
	}

	
	@RequestMapping("doslist2/{MESSR_ORD_FROOM_ID}")
	public ModelAndView doslist2(@PathVariable("MESSR_ORD_FROOM_ID") int MESSR_ORD_FROOM_ID, @RequestParam("BCD_TITLE") String BCD_TITLE,ModelAndView mav) {
		mav.addObject("frid", MESSR_ORD_FROOM_ID);
		mav.addObject("pagetitle", BCD_TITLE);
		mav.addObject("list", goodsService.dosdefaultlist2(MESSR_ORD_FROOM_ID));
		mav.setViewName("goods/dosDetailmessr");
		return mav;
	}

	@RequestMapping("doslist3/{STORE_ORD_FROOM_ID}")
	public ModelAndView doslist3(@PathVariable("STORE_ORD_FROOM_ID") int STORE_ORD_FROOM_ID, @RequestParam("BCD_TITLE") String BCD_TITLE,ModelAndView mav) {
		mav.addObject("frid", STORE_ORD_FROOM_ID);
		mav.addObject("pagetitle", BCD_TITLE);
		mav.addObject("list", goodsService.dosdefaultlist3(STORE_ORD_FROOM_ID));
		mav.setViewName("goods/dosDetailstore");
		return mav;
	}

	
	@RequestMapping("goods1list.do")
	public ModelAndView goods1list(ModelAndView mav) {
		mav.addObject("list", goodsService.listGoods1());
		mav.setViewName("goods/goods1List");
		return mav;
	}
	
	@RequestMapping("goods2list.do")
	public ModelAndView goods2list(ModelAndView mav) {
		mav.addObject("list", goodsService.listGoods2());
		mav.setViewName("goods/goods2List");
		return mav;
	}

	
	@RequestMapping("goods3list.do")
	public ModelAndView goods3list(ModelAndView mav) {
		mav.addObject("list", goodsService.listGoods3());
		mav.setViewName("goods/goods3List");
		return mav;
	}

	
	@RequestMapping("listroomview.do")
	public ModelAndView roomlistview(ModelAndView mav) {
		mav.addObject("list", goodsService.listRoom(1));
		mav.addObject("listroom", codeService.listconBcode("2"));
		mav.setViewName("goods/roomListview");
		return mav;
	}

	@RequestMapping("listroom/{FROOM_TYP}")
	public ModelAndView roomlist(@PathVariable("FROOM_TYP") int FROOM_TYP,ModelAndView mav) {
		mav.addObject("list", goodsService.listRoom(FROOM_TYP));
		mav.addObject("listroom", codeService.listconBcode("2"));
		mav.setViewName("goods/roomList");
		return mav;
	}
	
	@RequestMapping("setlistRule/{FROOM_TYP}")
	public ModelAndView setroomlist(@PathVariable("FROOM_TYP") int FROOM_TYP,ModelAndView mav) {
		int typ = FROOM_TYP;
		if (typ == 1) {
			mav.setViewName("cont/settleRuleroom");	
		}
		if (typ == 2) {
			mav.setViewName("cont/settleRuleext");	
		}
		if (typ == 3) {
			mav.setViewName("cont/settleRulehelp");	
		}
		if (typ == 4) {
			mav.setViewName("cont/settleRulepark");	
		}
		if (typ == 5) {
			mav.setViewName("cont/settleRuleetc");	
		}
		return mav;
	}
	
	@RequestMapping("listfroom/{FROOM_TYP}")
	public ModelAndView froomlist(@PathVariable("FROOM_TYP") int FROOM_TYP,ModelAndView mav) {
		mav.addObject("list", goodsService.doslistRoom(FROOM_TYP));
		mav.setViewName("goods/froomList");
		return mav;
	}
	
	@RequestMapping("listfroom3/{FROOM_TYP}")
	public ModelAndView froomlist3(@PathVariable("FROOM_TYP") int FROOM_TYP,ModelAndView mav) {
		mav.addObject("list", goodsService.doslistRoom(FROOM_TYP));
		mav.setViewName("goods/froomList3");
		return mav;
	}

	
	@RequestMapping("listAltar/{ALTAR_CAT}")
	public ModelAndView listaltar(@PathVariable("ALTAR_CAT") int ALTAR_CAT,ModelAndView mav) {
		mav.addObject("clist", codeService.listconBcode("16"));
		mav.addObject("list", goodsService.listAltar(ALTAR_CAT));
		mav.setViewName("goods/altarList");
		return mav;
	}

	@RequestMapping("altarListview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.addObject("clist", codeService.listconBcode("16"));
		mav.addObject("list", goodsService.listAltar(102));
		mav.setViewName("goods/altarListview");
		return mav;
	}

	
	@RequestMapping("ftableListview.do")
	public ModelAndView listftableview(ModelAndView mav) {
		mav.addObject("listftab", codeService.listconBcode("1"));
		mav.addObject("list", goodsService.listFtable(24));
		mav.setViewName("goods/ftableListview");
		return mav;
	}

	@RequestMapping("ftablelist/{FTABLE_CAT}")
	public ModelAndView listftable(@PathVariable("FTABLE_CAT") int FTABLE_CAT,ModelAndView mav) {
		mav.addObject("listftab", codeService.listconBcode("1"));
		mav.addObject("list", goodsService.listFtable(FTABLE_CAT));
		mav.setViewName("goods/ftableList");
		return mav;
	}
	
	@RequestMapping("/detail01/{GOODS_ID}")
	public ModelAndView detail01(@PathVariable("GOODS_ID") int GOODS_ID, ModelAndView mav) {
		mav.addObject("listData0201", codeService.listCode0201());
		mav.addObject("dto", goodsService.detailGoods(GOODS_ID));
		mav.addObject("listdept", codeService.listconBcode("8"));
		mav.setViewName("goods/goods01Detail");
		return mav;
	}

	@RequestMapping("/detail02/{GOODS_ID}")
	public ModelAndView detail02(@PathVariable("GOODS_ID") int GOODS_ID, ModelAndView mav) {
		mav.addObject("listData0202", codeService.listCode0202());
		mav.addObject("dto", goodsService.detailGoods(GOODS_ID));
		mav.addObject("listdept", codeService.listconBcode("8"));
		mav.setViewName("goods/goods02Detail");
		return mav;
	}

	@RequestMapping("/detail03/{GOODS_ID}")
	public ModelAndView detail03(@PathVariable("GOODS_ID") int GOODS_ID, ModelAndView mav) {
		mav.addObject("listData0203", codeService.listCode0203());
		mav.addObject("dto", goodsService.detailGoods(GOODS_ID));
		mav.addObject("listdept", codeService.listconBcode("8"));
		mav.setViewName("goods/goods03Detail");
		return mav;
	}

	@RequestMapping("/detail04/{GOODS_ID}")
	public ModelAndView detail04(@PathVariable("GOODS_ID") int GOODS_ID, ModelAndView mav) {
		mav.addObject("listData0204", codeService.listCode0204());
		mav.addObject("dto", goodsService.detailGoods(GOODS_ID));
		mav.addObject("listdept", codeService.listconBcode("8"));
		mav.setViewName("goods/goods04Detail");
		return mav;
	}

	
	@RequestMapping("/detailRoom/{FROOM_ID}")
	public ModelAndView detailroom(@PathVariable("FROOM_ID") int FROOM_ID, ModelAndView mav) {
		mav.addObject("listroom", codeService.listconBcode("2"));
		mav.addObject("etcsetl", setupService.listFroomSetl(FROOM_ID));
		mav.addObject("menu006",goodsService.menu006());
		mav.addObject("dtoRoom", goodsService.detailRoom(FROOM_ID));
		mav.setViewName("goods/roomDetail");
		return mav;
	}

	
	@RequestMapping("write.do")
		public ModelAndView write(ModelAndView mav) {
			mav.addObject("listData0201", codeService.listCode0201());
			mav.addObject("listData0202", codeService.listCode0202());
			mav.addObject("listData0203", codeService.listCode0203());
			mav.setViewName("goods/write");
			return mav;

	}
	
	@RequestMapping("goods1write.do")
	public ModelAndView goodswrite(ModelAndView mav) {
		mav.addObject("listData0201", codeService.listCode0201());
		mav.setViewName("goods/goods1Write");
		return mav;
	}

	@RequestMapping("goods2write.do")
	public ModelAndView goods2write(ModelAndView mav) {
		mav.addObject("listData0202", codeService.listCode0202());
		mav.setViewName("goods/goods2Write");
		return mav;
	}

	@RequestMapping("goods3write.do")
	public ModelAndView goods3write(ModelAndView mav) {
		mav.addObject("listData0203", codeService.listCode0203());
		mav.setViewName("goods/goods3Write");
		return mav;
	}
	
	@RequestMapping("altarwrite.do")
	public ModelAndView altarwrite(ModelAndView mav) {
		mav.addObject("listCodealtar", codeService.listCodealtar());
		mav.addObject("listCodeftable", codeService.listCodeftable());
		mav.setViewName("goods/altarWrite");
		return mav;
	}
	
	@RequestMapping("/detailAltar/{ALTAR_ID}")
	public ModelAndView detailaltar(@PathVariable("ALTAR_ID") int ALTAR_ID, ModelAndView mav) {
		mav.addObject("dto", goodsService.detailAltar(ALTAR_ID));
		mav.addObject("listCodealtar", codeService.listCodealtar());
		mav.addObject("listCodeftable", codeService.listCodeftable());
		mav.setViewName("goods/altarDetail");
		return mav;
	}
	
	@RequestMapping("/detailDosstore/{STORE_ORD_ID}")
	public ModelAndView detaildosstore(@PathVariable("STORE_ORD_ID") int STORE_ORD_ID, ModelAndView mav){
		
		mav.setViewName("goods/dosDetailstore");
		return mav;
	}
	
	@RequestMapping("/detailDosmessr/{MESSR_ORD_ID}")
	public ModelAndView detaildosmessr(@PathVariable("MESSR_ORD_ID") int MESSR_ORD_ID, ModelAndView mav){
		
		mav.setViewName("goods/dosDetailmessr");
		return mav;
	}

	@RequestMapping("/detailFtable/{FTABLE_ID}")
	public ModelAndView detailftable(@PathVariable("FTABLE_ID") int FTABLE_ID, ModelAndView mav) {
		mav.addObject("dto", goodsService.detailFtable(FTABLE_ID));
		mav.addObject("listCodealtar", codeService.listCodealtar());
		mav.addObject("listCodeftable", codeService.listCodeftable());
		mav.setViewName("goods/ftableDetail");
		return mav;
	}


	@RequestMapping("dosListview.do")
	public ModelAndView ordersheetwrite(ModelAndView mav){
		mav.setViewName("goods/dosListview");
		return mav;
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int goodsInsert = goodsService.insertGoods(dto);
		if (goodsInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertAltar.do")
	public ResponseEntity<?> insertaltar(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int altarInsert = goodsService.insertAltar(dto);
		if (altarInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertFtable.do")
	public ResponseEntity<?> insertftable(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ftableInsert = goodsService.insertFtable(dto);
		if (ftableInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("roominsert.do")
	public ResponseEntity<?> roominsert(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int roomInsert = goodsService.insertRoom(dto);
		if (roomInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertDos1.do")
	public ResponseEntity<?> insertdos1(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int dosInsert = goodsService.insertDos1(dto);
		if (dosInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertDos2.do")
	public ResponseEntity<?> insertdos2(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int dosInsert = goodsService.insertDos2(dto);
		if (dosInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insertDos3.do")
	public ResponseEntity<?> insertdos3(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int dosInsert = goodsService.insertDos3(dto);
		if (dosInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("deleteDos1.do")
	public ResponseEntity<?> deletedos1(@ModelAttribute GoodsDTO dto) {
	Map<String, Object> param = new HashMap<String, Object>();
	int goodsUpdate = goodsService.deleteDos1(dto.getFNRS_ORD_FROOM_ID());
	if (goodsUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}

	@RequestMapping("deleteDos2.do")
	public ResponseEntity<?> deletedos2(@ModelAttribute GoodsDTO dto) {
	Map<String, Object> param = new HashMap<String, Object>();
	int goodsUpdate = goodsService.deleteDos2(dto.getMESSR_ORD_FROOM_ID());
	if (goodsUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}

	@RequestMapping("deleteDos3.do")
	public ResponseEntity<?> deletedos3(@ModelAttribute GoodsDTO dto) {
	Map<String, Object> param = new HashMap<String, Object>();
	int goodsUpdate = goodsService.deleteDos3(dto.getSTORE_ORD_FROOM_ID());
	if (goodsUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}


	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int goodsUpdate = goodsService.updateGoods(dto);
		if (goodsUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updateRoom.do")
	public ResponseEntity<?> updateRoom(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int roomUpdate = goodsService.updateRoom(dto);
		if (roomUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute GoodsDTO dto) {
			Map<String, Object> param = new HashMap<String, Object>();
			int goodsUpdate = goodsService.deleteGoods(dto.getGOODS_ID());
			if (goodsUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}


	@RequestMapping("updateAltar.do")
	public ResponseEntity<?> updatealtar(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int altarUpdate = goodsService.updateAltar(dto);
		if (altarUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updateFtable.do")
	public ResponseEntity<?> updateftable(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int ftableUpdate = goodsService.updateFtable(dto);
		if (ftableUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
}
