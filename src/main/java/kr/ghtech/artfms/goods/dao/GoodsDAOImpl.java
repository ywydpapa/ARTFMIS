package kr.ghtech.artfms.goods.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ghtech.artfms.goods.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<GoodsDTO> listGoods1() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listGoods1");
	}
	@Override
	public List<GoodsDTO> listGoods2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listGoods2");
	}
	@Override
	public List<GoodsDTO> listGoods3() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listGoods3");
	}

	@Override
	public GoodsDTO detailGoods(int GOODS_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goods.detailGoods", GOODS_ID);
	}

	@Override
	public int updateGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("goods.updateGoods", dto);
	}

	@Override
	public int deleteGoods(int GOODS_ID) {
		// TODO Auto-generated method stub
		return sqlSession.delete("goods.deleteGoods", GOODS_ID);
	}

	@Override
	public int insertGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goods.insertGoods", dto);
	}

	@Override
	public int insertRoom(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goods.insertRoom", dto);
	}

	@Override
	public List<GoodsDTO> listRoom(int FROOM_TYP) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listRoom",FROOM_TYP);
	}
	@Override
	public GoodsDTO detailRoom(int FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goods.detailRoom", FROOM_ID);
	}
	@Override
	public List<GoodsDTO> menu006() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.menu006");
	}
	@Override
	public List<GoodsDTO> menu008() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.menu008");
	}
	@Override
	public int updateRoom(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("goods.updateRoom", dto);
	}
	@Override
	public int insertAltar(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goods.insertAltar", dto);
	}
	@Override
	public int insertFtable(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goods.insertFtable", dto);
	}
	@Override
	public List<GoodsDTO> listAltar(int ALTAR_CAT) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listAltar", ALTAR_CAT);
	}
	@Override
	public List<GoodsDTO> listFtable(int FTABLE_CAT) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listFtable", FTABLE_CAT);
	}
	@Override
	public GoodsDTO detailAltar(int ALTAR_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goods.detailAltar", ALTAR_ID);
	}
	@Override
	public GoodsDTO detailFtable(int FTABLE_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goods.detailFtable", FTABLE_ID);
	}
	@Override
	public int updateAltar(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("goods.updateAltar", dto);
	}
	
	@Override
	public int updateFtable(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("goods.updateFtable", dto);
	}
	@Override
	public List<GoodsDTO> listGoods01(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listGoods01", CAT_02_ID);
	}
	@Override
	public List<GoodsDTO> listGoods4() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listGoods4");
	}
	@Override
	public List<GoodsDTO> listGoods02(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listGoods02", CAT_02_ID);
	}
	@Override
	public List<GoodsDTO> listGoods03(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listGoods03", CAT_02_ID);
	}
	@Override
	public List<GoodsDTO> listGoods04(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.listGoods04", CAT_02_ID);
	}
	@Override
	public List<GoodsDTO> dosdefaultlist2(int MESSR_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.dosdefaultlist2",MESSR_ORD_FROOM_ID);
	}
	@Override
	public List<GoodsDTO> dosdefaultlist3(int STORE_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.dosdefaultlist3",STORE_ORD_FROOM_ID);
	}
	@Override
	public int insertDos1(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goods.insertDos1", dto);
	}
	@Override
	public int insertDos2(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goods.insertDos2", dto);
	}
	@Override
	public int insertDos3(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("goods.insertDos3", dto);
	}
	@Override
	public int deleteDos1(String FNRS_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.delete("goods.deleteDos1" ,FNRS_ORD_FROOM_ID);
	}
	@Override
	public int deleteDos2(String MESSR_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.delete("goods.deleteDos2" ,MESSR_ORD_FROOM_ID);
	}
	@Override
	public int deleteDos3(String STORE_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.delete("goods.deleteDos3" ,STORE_ORD_FROOM_ID);
	}
	@Override
	public List<GoodsDTO> dosdefaultlist121() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.dosdefaultlist1-121");
	}
	@Override
	public List<GoodsDTO> dosdefaultlist122() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.dosdefaultlist1-122");
	}
	@Override
	public List<GoodsDTO> setlistRoom(int FROOM_TYP) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.setlistRoom", FROOM_TYP);
	}
	@Override
	public List<GoodsDTO> doslistRoom(int FROOM_TYP) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goods.doslistRoom",FROOM_TYP);
	}

}
