package kr.ghtech.artfms.cont.dao;

import java.util.List;

import kr.ghtech.artfms.cont.dto.ContDTO;

public interface ContDAO {

	List<ContDTO> listCont();
	ContDTO detailCont(Integer CONTRACT_ID);
	int updateCont(ContDTO dto);
	int updateCont2(ContDTO dto);
	int updateCont3(ContDTO dto);
	int updateCont4(ContDTO dto);
	int updateCont5(ContDTO dto);
	int updateCont6(ContDTO dto);
	int updateCont7(ContDTO dto);
	int updateCont8(ContDTO dto);
	int updateCont9(ContDTO dto);
	int deleteCont(Integer CONTRACT_ID);
	int insertCont(ContDTO dto);
	int insertCont2(ContDTO dto);
	int insertCont3(ContDTO dto);
	int insertCont4(ContDTO dto);
	int insertCont5(ContDTO dto);
	int insertCont6(ContDTO dto);
	int insertCont7(ContDTO dto);
	int insertCont8(ContDTO dto);
	int insertCont9(ContDTO dto);
	int insertYujok(ContDTO dto);
	int updateYujok(ContDTO dto);
	int insertAddroom(ContDTO dto);
	int deleteAddroom(ContDTO dto);
	int chkRoom(ContDTO dto);
	
	Integer contCheck(ContDTO dto);
	List<ContDTO> doscontlist121();
	List<ContDTO> doscontlist122();
	List<ContDTO> doscontlist2(int CONT_FROOM_ID);
	List<ContDTO> doscontlist2f(int CONT_FROOM_ID);
	List<ContDTO> doscontlist3(int CONT_FROOM_ID);
	List<ContDTO> doscontlist3f(int CONT_FROOM_ID);
	List<ContDTO> doslistAltar();
	List<ContDTO> doslistFgoodsM();
	List<ContDTO> doslistFgoodsT();
	List<ContDTO> doslistFgoodsMn(int CAT_02_ID);
	List<ContDTO> doslistFgoodsTn(int CAT_02_ID);
	List<ContDTO> doslistFroom();
	List<ContDTO> listAddroom(int CONTRACT_ID);
	List<ContDTO> doslistFroomemp();
	List<ContDTO> listContcombo();
	List<ContDTO> doslistFtable();
	List<ContDTO> doslistEtcroom();
	List<ContDTO> doslistEtcroom2();
	int updateSrule(ContDTO dto);
	int insertSrule(ContDTO dto);
	List<ContDTO> reloadP2(Integer CONTRACT_ID);
	List<ContDTO> reloadP3(Integer CONTRACT_ID);
	List<ContDTO> reloadP4m(Integer CONTRACT_ID);
	List<ContDTO> reloadP4t(Integer CONTRACT_ID);
	List<ContDTO> reloadP5(Integer CONTRACT_ID);
	List<ContDTO> reloadP6(ContDTO dto);
	List<ContDTO> reloadP7(ContDTO dto);
	List<ContDTO> returnP7(ContDTO dto);
	List<ContDTO> settleP6(ContDTO dto);
	List<ContDTO> settleP7(ContDTO dto);
	List<ContDTO> settleP2(ContDTO dto);
	List<ContDTO> settleP3(ContDTO dto);
	List<ContDTO> settleP4(ContDTO dto);
	List<ContDTO> settleP5(ContDTO dto);
	List<ContDTO> settleP8(ContDTO dto);
	List<ContDTO> reloadP8(Integer CONTRACT_ID);
	List<ContDTO> reloadP9(Integer CONTRACT_ID);
	List<ContDTO> listYujok(Integer CONTRACT_ID);
	}
