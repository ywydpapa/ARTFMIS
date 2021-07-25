package kr.ghtech.artfms.cst.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ghtech.artfms.cst.dao.ConsultDAO;
import kr.ghtech.artfms.cst.dto.ConsultDTO;

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

}
