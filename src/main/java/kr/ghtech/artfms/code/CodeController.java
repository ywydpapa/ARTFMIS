package kr.ghtech.artfms.code;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ghtech.artfms.code.dto.CodeDTO;
import kr.ghtech.artfms.code.service.CodeService;
import kr.ghtech.artfms.goods.service.GoodsService;

@Controller

@RequestMapping("/code/*")
public class CodeController {

	@Inject
	CodeService codeService;
	GoodsService goodsService;
	
	@RequestMapping("listCode01.do")
	public ModelAndView list01(ModelAndView mav) {
		mav.setViewName("code/listCode01");
		mav.addObject("list01", codeService.listCode01());
		return mav;
	}
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.setViewName("code/listview");
		mav.addObject("list01", codeService.listCode01());
		mav.addObject("list02", codeService.listCode020n(1));
		return mav;
	}
	
	@RequestMapping("bcodelistview.do")
	public ModelAndView mlistview(ModelAndView mav) {
		mav.setViewName("code/bcodelistview");
		mav.addObject("list01", codeService.listconBcode("1"));
		return mav;
	}

	
	@RequestMapping("listCode02.do")
	public ModelAndView list02(ModelAndView mav) {
		mav.setViewName("code/listCode02");
		mav.addObject("list02", codeService.listCode02());
		return mav;
	}

	@RequestMapping("listcon02/{CAT01}")
	public ModelAndView list020n(@PathVariable("CAT01") int CAT01, ModelAndView mav) {
		mav.addObject("list020n", codeService.listCode020n(CAT01));
		mav.setViewName("code/list020n");
		return mav;
	}
	
	@RequestMapping("selectcon02/{CAT01}")
	public ModelAndView select020n(@PathVariable("CAT01") int CAT01, ModelAndView mav) {
		mav.addObject("select020n", codeService.listCode020n(CAT01));
		mav.setViewName("code/select020n2");
		return mav;
	}
	
	@RequestMapping("listconBcode/{BCD_CAT_TYPE}")
	public ModelAndView listconbcode(@PathVariable("BCD_CAT_TYPE") String BCD_CAT_TYPE, ModelAndView mav) {
		mav.addObject("listbcode", codeService.listconBcode(BCD_CAT_TYPE));
		mav.setViewName("code/listbcodecon");
		return mav;
	}
	
	@RequestMapping("listconBcodedos1")
	public ModelAndView listconbcodedos1(ModelAndView mav) {
		mav.addObject("listbcode", codeService.listconBcodedos1());
		mav.setViewName("code/listbcodedos");
		return mav;
	}
	
	@RequestMapping("listconBcodedos2")
	public ModelAndView listconbcodedos2(ModelAndView mav) {
		mav.addObject("listbcode", codeService.listconBcodedos2());
		mav.setViewName("code/listbcodedos2");
		return mav;
	}
	
	@RequestMapping("listconBcodedos3")
	public ModelAndView listconbcodedos3(ModelAndView mav) {
		mav.addObject("listbcode", codeService.listconBcodedos2());
		mav.setViewName("code/listbcodedos3");
		return mav;
	}

	
	@RequestMapping("listconBcodesrule")
	public ModelAndView listconbcodesrule(ModelAndView mav) {
		mav.addObject("listbcode", goodsService.listRoom(1));
		mav.setViewName("code/listbcodesrule");
		return mav;
	}

	@RequestMapping("listCode0201.do")
	public ModelAndView list0201(ModelAndView mav) {
		mav.setViewName("code/list");
		mav.addObject("list02", codeService.listCode0201());
		return mav;
	}
	
	@RequestMapping("listCode0202.do")
	public ModelAndView list0202(ModelAndView mav) {
		mav.setViewName("code/list");
		mav.addObject("list02", codeService.listCode0202());
		return mav;
	}

	@RequestMapping("listCode0203.do")
	public ModelAndView list0203(ModelAndView mav) {
		mav.setViewName("code/list");
		mav.addObject("list02", codeService.listCode0203());
		return mav;
	}


	@RequestMapping("listCode03.do")
	public ModelAndView list03(ModelAndView mav) {
		mav.setViewName("code/listCode03");
		mav.addObject("list03", codeService.listCode03());
		return mav;
	}

	@RequestMapping("/detail/{CAT_ID}")
	public ModelAndView detail(@PathVariable("CAT_ID") int CAT_ID, ModelAndView mav) {
		mav.setViewName("code/detail");
		mav.addObject("dto", codeService.detailCode(CAT_ID));
		return mav;
	}
	
	@RequestMapping("/detail01/{CAT_ID}")
	public ModelAndView detail01(@PathVariable("CAT_ID") int CAT_ID, ModelAndView mav) {
		mav.setViewName("code/detail01");
		mav.addObject("dto", codeService.detailCode01(CAT_ID));
		return mav;
	}
	
	@RequestMapping("/detail02/{CAT_ID}")
	public ModelAndView detail02(@PathVariable("CAT_ID") int CAT_ID, ModelAndView mav) {
		mav.setViewName("code/detail02");
		mav.addObject("dto", codeService.detailCode02(CAT_ID));
		return mav;
	}

	
	@RequestMapping("write.do")
	public ModelAndView write(ModelAndView mav) {
		mav.addObject("list01", codeService.listCode01());
		mav.addObject("list02", codeService.listCode02());
		mav.setViewName("code/write");
		return mav;
}

	@RequestMapping("write2.do")
	public ModelAndView write2(ModelAndView mav) {
		mav.addObject("list01", codeService.listCode01());
		mav.addObject("list02", codeService.listCode02());
		mav.setViewName("code/write2");
		return mav;
}
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = codeService.insertCode(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertBcode.do")
	public ResponseEntity<?> insertBcode(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = codeService.insertbCode(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("insert01.do")
	public ResponseEntity<?> insert01(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int code01Insert = codeService.insertCode01(dto);
		if (code01Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insert02.do")
	public ResponseEntity<?> insert02(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int code02Insert = codeService.insertCode02(dto);
		if (code02Insert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = codeService.updateCode(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("updatebCode.do")
	public ResponseEntity<?> updatebCode(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = codeService.updatebCode(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("update01.do")
	public ResponseEntity<?> update01(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = codeService.updateCode01(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update02.do")
	public ResponseEntity<?> update02(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = codeService.updateCode02(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute CodeDTO dto) {
			Map<String, Object> param = new HashMap<String, Object>();
			int codeUpdate = codeService.deleteCode(dto.getCAT_ID());
			if (codeUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
			

	
}
