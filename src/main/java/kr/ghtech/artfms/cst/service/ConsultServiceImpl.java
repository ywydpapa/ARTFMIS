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
	public int insertConsult(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return consultDao.insertConsult(dto);
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

}
