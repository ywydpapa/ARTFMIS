package kr.ghtech.artfms.cont.dao;

import kr.ghtech.artfms.cont.dto.ContDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class ContDAOImpl implements ContDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ContDTO> listCont() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listCont");
	}

	@Override
	public ContDTO detailCont(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cont.detailCont", CONTRACT_ID);
	}

	@Override
	public int updateCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updateCont",dto);
	}

	
	@Override
	public int deleteCont(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cont.deleteCont",CONTRACT_ID);
	}

	@Override
	public int insertCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.insertCont", dto);
	}

	@Override
	public List<ContDTO> doscontlist121() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContDTO> doscontlist122() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContDTO> doscontlist2(int CONT_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.doslist2Cont", CONT_FROOM_ID);
	}

	@Override
	public List<ContDTO> doscontlist3(int CONT_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.doslist3Cont", CONT_FROOM_ID);
	}

	@Override
	public List<ContDTO> doslistAltar() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listAltar");
	}

	@Override
	public List<ContDTO> doslistFgoodsM() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFgoodsM");
	}

	@Override
	public List<ContDTO> doslistFgoodsT() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFgoodsT");
	}

	@Override
	public List<ContDTO> doslistFroom() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFroom");
	}
	
	@Override
	public List<ContDTO> doslistFroomemp() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFroomemp");
	}

	@Override
	public List<ContDTO> doslistFtable() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFtable");
	}

	@Override
	public List<ContDTO> doslistEtcroom() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listEtcroom");
	}

	@Override
	public int updateSrule(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.sruleuppd",dto);
	}

	@Override
	public int insertSrule(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.sruleins", dto);
	}

	@Override
	public List<ContDTO> doslistFgoodsMn(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFgoodsMn", CAT_02_ID);
	}

	@Override
	public List<ContDTO> doslistFgoodsTn(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFgoodsTn", CAT_02_ID);
	}

	@Override
	public int insertCont2(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.contp2", dto);
	}

	@Override
	public int insertCont3(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.contp3", dto);
	}

	@Override
	public int insertCont4(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.contp4", dto);
	}

	@Override
	public int insertCont5(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.contp5", dto);
	}

	@Override
	public int insertCont6(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.contp6", dto);
	}

	@Override
	public int insertCont7(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.contp7", dto);
	}

	@Override
	public int insertCont8(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.contp8", dto);
	}

	@Override
	public int insertCont9(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.contp9", dto);
	}

	@Override
	public int updateCont2(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp2",dto);
	}
	
	@Override
	public int updateCont2tr(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp2tr",dto);
	}


	@Override
	public int updateCont3(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp3",dto);
	}

	@Override
	public int updateCont4(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp4",dto);
	}

	@Override
	public int updateCont5(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp5",dto);
	}

	@Override
	public int updateCont6(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp6",dto);
	}

	@Override
	public int updateCont7(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp7",dto);
	}

	@Override
	public int updateCont8(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp8",dto);
	}

	@Override
	public int updateCont9(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updcontp9",dto);
	}

	@Override
	public int chkRoom(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cont.checkFroom", dto);
	}

	@Override
	public List<ContDTO> doscontlist2f(int CONT_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.doslist2ContFroom", CONT_FROOM_ID);
	}

	@Override
	public List<ContDTO> doscontlist3f(int CONT_FROOM_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.doslist3ContFroom", CONT_FROOM_ID);
	}

	@Override
	public Integer contCheck(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cont.contCheck", dto);
	}

	@Override
	public int insertYujok(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.insertYujok", dto);
	}

	@Override
	public int updateYujok(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.updateYujok", dto);
	}

	@Override
	public List<ContDTO> reloadP2(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp2", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP3(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp3", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP4m(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp4m", CONTRACT_ID);
	}
	
	@Override
	public List<ContDTO> reloadP4t(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp4t", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP5(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp5", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP6(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp6", dto);
	}

	@Override
	public List<ContDTO> reloadP7(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp7", dto);
	}

		@Override
	public List<ContDTO> reloadP8(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp8", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP9(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp9", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> listYujok(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listYujok", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> listContcombo() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listContcombo");
	}

	@Override
	public List<ContDTO> doslistEtcroom2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listEtcroom2");
	}

	@Override
	public List<ContDTO> returnP7(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.setrtnContp7", dto);
	}

	@Override
	public List<ContDTO> settleP6(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.settleContp6", dto);
	}

	@Override
	public List<ContDTO> settleP7(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.settleContp7", dto);
	}

	@Override
	public List<ContDTO> settleP2(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.settleContp2", dto);
	}

	@Override
	public List<ContDTO> settleP3(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.settleContp3", dto);
	}

	@Override
	public List<ContDTO> settleP4(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.settleContp4", dto);
	}

	@Override
	public List<ContDTO> settleP5(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.settleContp5", dto);
	}

	@Override
	public List<ContDTO> settleP8(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.settleContp8", dto);
	}

	@Override
	public int insertAddroom(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cont.addRoom", dto);
	}

	@Override
	public int deleteAddroom(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.delRoom", dto);
	}

	@Override
	public List<ContDTO> listAddroom(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listaddRoom", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP2froom(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp2froom", CONTRACT_ID);
	}

	@Override
	public List<ContDTO> listSrule(String SETL_TITLE) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listSrule", SETL_TITLE);
	}

	@Override
	public List<ContDTO> reloadP2froom2(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.reloadContp2froom2", CONTRACT_ID);
	}

	@Override
	public int tropt01(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.troption01", dto);
	}

	@Override
	public int tropt02(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.troption02", dto);
	}

	@Override
	public int tropt03(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.troption03", dto);
	}

	@Override
	public int tropt0301(ContDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("cont.troption03-1", dto);
	}

	@Override
	public List<ContDTO> doslistFroom2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cont.listFroom2");
	}

	
}
