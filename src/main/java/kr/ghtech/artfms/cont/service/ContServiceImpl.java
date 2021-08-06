package kr.ghtech.artfms.cont.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ghtech.artfms.cont.dao.ContDAO;
import kr.ghtech.artfms.cont.dto.ContDTO;

@Service
public class ContServiceImpl implements ContService {
	
	@Inject
	ContDAO contDao;

	@Override
	public List<ContDTO> listCont() {
		// TODO Auto-generated method stub
		return contDao.listCont();
	}

	@Override
	public ContDTO detailCont(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.detailCont(CONTRACT_ID);
	}

	@Override
	public int updateCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont(dto);
	}

	@Override
	public int deleteCont(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.deleteCont(CONTRACT_ID);
	}

	
	@Override
	public int insertCont(ContDTO dto) {
		// TODO Auto-generated method stub
		contDao.insertCont(dto);
		return dto.getCONTRACT_ID();
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
		return contDao.doscontlist2(CONT_FROOM_ID);
	}

	@Override
	public List<ContDTO> doscontlist3(int CONT_FROOM_ID) {
		// TODO Auto-generated method stub
		return contDao.doscontlist3(CONT_FROOM_ID);
	}

	@Override
	public List<ContDTO> doslistAltar() {
		// TODO Auto-generated method stub
		return contDao.doslistAltar();
	}

	@Override
	public List<ContDTO> doslistFgoodsM() {
		// TODO Auto-generated method stub
		return contDao.doslistFgoodsM();
	}

	@Override
	public List<ContDTO> doslistFgoodsT() {
		// TODO Auto-generated method stub
		return contDao.doslistFgoodsT();
	}

	@Override
	public List<ContDTO> doslistFroom() {
		// TODO Auto-generated method stub
		return contDao.doslistFroom();
	}

	@Override
	public List<ContDTO> doslistFroomemp() {
		// TODO Auto-generated method stub
		return contDao.doslistFroomemp();
	}
	
	@Override
	public List<ContDTO> doslistFtable() {
		// TODO Auto-generated method stub
		return contDao.doslistFtable();
	}

	@Override
	public List<ContDTO> doslistEtcroom() {
		// TODO Auto-generated method stub
		return contDao.doslistEtcroom();
	}

	@Override
	public int updateSrule(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateSrule(dto);
	}

	@Override
	public int insertSrule(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertSrule(dto);
	}

	@Override
	public List<ContDTO> doslistFgoodsMn(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return contDao.doslistFgoodsMn(CAT_02_ID);
	}

	@Override
	public List<ContDTO> doslistFgoodsTn(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return contDao.doslistFgoodsTn(CAT_02_ID);
	}

	@Override
	public int insertCont2(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont2(dto);
	}

	@Override
	public int insertCont3(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont3(dto);
	}

	@Override
	public int insertCont4(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont4(dto);
	}

	@Override
	public int insertCont5(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont5(dto);
	}

	@Override
	public int insertCont6(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont6(dto);
	}

	@Override
	public int insertCont7(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont7(dto);
	}

	@Override
	public int insertCont8(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont8(dto);
	}

	@Override
	public int insertCont9(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont9(dto);
	}

	@Override
	public int updateCont2(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont2(dto);
	}

	@Override
	public int updateCont3(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont3(dto);
	}

	@Override
	public int updateCont4(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont4(dto);
	}

	@Override
	public int updateCont5(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont5(dto);
	}

	@Override
	public int updateCont6(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont6(dto);
	}

	@Override
	public int updateCont7(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont7(dto);
	}

	@Override
	public int updateCont8(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont8(dto);
	}

	@Override
	public int updateCont9(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont9(dto);
	}

	@Override
	public int chkRoom(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.chkRoom(dto);
	}

	@Override
	public List<ContDTO> doscontlist2f(int CONT_FROOM_ID) {
		// TODO Auto-generated method stub
		return contDao.doscontlist2f(CONT_FROOM_ID);
	}

	@Override
	public List<ContDTO> doscontlist3f(int CONT_FROOM_ID) {
		// TODO Auto-generated method stub
		return contDao.doscontlist3f(CONT_FROOM_ID);
	}

	@Override
	public Integer contCheck(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.contCheck(dto);
	}

	@Override
	public int insertYujok(ContDTO dto) {
		// TODO Auto-generated method stub
		contDao.insertYujok(dto);
		return dto.getCONT_SANGJU_ID();
	}

	@Override
	public int updateYujok(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateYujok(dto);
	}

	@Override
	public List<ContDTO> reloadP2(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.reloadP2(CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP3(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.reloadP3(CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP4m(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.reloadP4m(CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP4t(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.reloadP4t(CONTRACT_ID);
	}
	
	@Override
	public List<ContDTO> reloadP5(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.reloadP5(CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP6(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.reloadP6(dto);
	}

	@Override
	public List<ContDTO> reloadP7(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.reloadP7(dto);
	}

	@Override
	public List<ContDTO> reloadP8(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.reloadP8(CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP9(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.reloadP9(CONTRACT_ID);
	}

	@Override
	public List<ContDTO> listYujok(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.listYujok(CONTRACT_ID);
	}

	@Override
	public List<ContDTO> listContcombo() {
		// TODO Auto-generated method stub
		return contDao.listContcombo();
	}

	@Override
	public List<ContDTO> doslistEtcroom2() {
		// TODO Auto-generated method stub
		return contDao.doslistEtcroom2();
	}

	@Override
	public List<ContDTO> returnP7(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.returnP7(dto);
	}

	@Override
	public List<ContDTO> settleP6(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.settleP6(dto);
	}

	@Override
	public List<ContDTO> settleP7(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.settleP7(dto);
	}

	@Override
	public List<ContDTO> settleP2(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.settleP2(dto);
	}

	@Override
	public List<ContDTO> settleP3(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.settleP3(dto);
	}

	@Override
	public List<ContDTO> settleP4(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.settleP4(dto);
	}

	@Override
	public List<ContDTO> settleP5(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.settleP5(dto);
	}

	@Override
	public List<ContDTO> settleP8(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.settleP8(dto);
	}

	@Override
	public int insertAddroom(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertAddroom(dto);
	}

	@Override
	public int deleteAddroom(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.deleteAddroom(dto);
	}

	@Override
	public List<ContDTO> listAddroom(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.listAddroom(CONTRACT_ID);
	}

	@Override
	public List<ContDTO> reloadP2froom(Integer CONTRACT_ID) {
		// TODO Auto-generated method stub
		return contDao.reloadP2froom(CONTRACT_ID);
	}


}
