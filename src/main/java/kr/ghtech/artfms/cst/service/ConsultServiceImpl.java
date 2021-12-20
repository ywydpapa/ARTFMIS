package kr.ghtech.artfms.cst.service;

import kr.ghtech.artfms.cst.dao.ConsultDAO;
import kr.ghtech.artfms.cst.dto.ConsultDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ConsultServiceImpl implements ConsultService {

	@Inject
	ConsultDAO consultDao;
	
	@Override
	public List<ConsultDTO> listconsut() {
		// TODO Auto-generated method stub
		return consultDao.listconsut();
	}

	@Override
	public ConsultDTO detailConsult(int CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.detailConsult(CONSULT_ID);
	}

	@Override
	public int updateConsult(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.updateConsult(dto);
	}

	@Override
	public int updateConsult2(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.updateConsult2(dto);
	}
	@Override
	public int updateConsult3(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.updateConsult3(dto);
	}

	@Override
	public int updateConsult4(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.updateConsult4(dto);
	}

	@Override
	public int updateConsult5(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.updateConsult5(dto);
	}

	@Override
	public int insertConsult(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.insertConsult(dto);
	}

	@Override
	public int insertConsult2(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.insertConsult2(dto);
	}

	@Override
	public int insertConsult3(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.insertConsult3(dto);
	}

	@Override
	public int insertConsult4(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.insertConsult4(dto);
	}

	@Override
	public int insertConsult5(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.insertConsult5(dto);
	}

	@Override
	public int deleteConsult(int CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.deleteConsult(CONSULT_ID);
	}

	@Override
	public int insertCstFtable(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.insertCstFtable(dto);
	}

	@Override
	public int deleteCstFtable(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.deleteCstFtable(dto);
	}

	@Override
	public ConsultDTO detailCstRentfee(Integer CONSULT_ID) {
		return consultDao.detailCstRentfee(CONSULT_ID);
	}

	@Override
	public int insertCSTRentfee(ConsultDTO dto) {
		return consultDao.insertCSTRentfee(dto);
	}

	@Override
	public int updateCSTRentfee(ConsultDTO dto) {
		return consultDao.updateCSTRentfee(dto);
	}

	@Override
	public int deleteCSTRentfee(ConsultDTO dto) {
		return consultDao.deleteCSTRentfee(dto);
	}

	@Override
	public List<ConsultDTO> reloadP3(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.reloadP3(CONSULT_ID);
	}
	
	@Override
	public List<ConsultDTO> reloadP4m(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.reloadP4m(CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> reloadP5(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.reloadP5(CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> doslistFroom() {
		// TODO Auto-generated method stub
		return consultDao.doslistFroom();
	}

	@Override
	public List<ConsultDTO> doslistEtcroom() {
		// TODO Auto-generated method stub
		return consultDao.doslistEtcroom();
	}

	@Override
	public List<ConsultDTO> ConsultGet(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.ConsultGet(CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> reloadP2froom2(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.reloadP2froom2(CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> consultSeleteGet(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.consultSeleteGet(CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> consultModalList() {
		// TODO Auto-generated method stub
		return consultDao.consultModalList();
	}
	
	@Override
	public List<ConsultDTO> consultModalSearch(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.consultModalSearch(dto);
	}
	

	@Override
	public List<ConsultDTO> writeConsultSelect(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return consultDao.writeConsultSelect(CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> getConsultId() {
		// TODO Auto-generated method stub
		return consultDao.getConsultId();
	}
}
