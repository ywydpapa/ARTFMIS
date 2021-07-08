package kr.ghtech.artfms.goods.service;

import java.util.List;

import kr.ghtech.artfms.goods.dto.GoodsDTO;

public interface GoodsService {

	List<GoodsDTO> listGoods01(int CAT_02_ID);	
	List<GoodsDTO> listGoods02(int CAT_02_ID);
	List<GoodsDTO> listGoods03(int CAT_02_ID);
	List<GoodsDTO> listGoods04(int CAT_02_ID);
	List<GoodsDTO> listGoods1();
	List<GoodsDTO> listGoods2();
	List<GoodsDTO> listGoods3();
	List<GoodsDTO> listGoods4();
	List<GoodsDTO> dosdefaultlist121();
	List<GoodsDTO> dosdefaultlist122();
	List<GoodsDTO> dosdefaultlist2(int MESSR_ORD_FROOM_ID);
	List<GoodsDTO> dosdefaultlist3(int STORE_ORD_FROOM_ID);
	List<GoodsDTO> menu006();
	List<GoodsDTO> menu008();
	List<GoodsDTO> listAltar(int ALTAR_CAT);
	List<GoodsDTO> listFtable(int FTABLE_CAT);
	GoodsDTO detailGoods(int GOODS_ID);
	int updateGoods(GoodsDTO dto);
	int updateRoom(GoodsDTO dto);
	int deleteGoods(int GOODS_ID);
	int insertGoods(GoodsDTO dto);
	int insertRoom(GoodsDTO dto);
	List<GoodsDTO> listRoom(int FROOM_TYP);
	List<GoodsDTO> setlistRoom(int FROOM_TYP);
	GoodsDTO detailRoom(int FROOM_ID);
	int insertAltar(GoodsDTO dto);
	int insertFtable(GoodsDTO dto);
	GoodsDTO detailAltar(int ALTAR_ID);
	GoodsDTO detailFtable(int FTABLE_ID);
	int updateAltar(GoodsDTO dto);
	int updateFtable(GoodsDTO dto);
	int insertDos1(GoodsDTO dto);
	int insertDos2(GoodsDTO dto);
	int insertDos3(GoodsDTO dto);
	int deleteDos1(String FNRS_ORD_FROOM_ID);
	int deleteDos2(String MESSR_ORD_FROOM_ID);
	int deleteDos3(String STORE_ORD_FROOM_ID);
}
