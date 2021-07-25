package kr.ghtech.artfms.setup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ghtech.artfms.setup.dao.SetupDAO;
import kr.ghtech.artfms.setup.dto.SetupDTO;

@Service
public class SetupServiceImpl implements SetupService {
	
	@Inject
	SetupDAO setupDao;

	@Override
	public List<SetupDTO> listSetup() {
		// TODO Auto-generated method stub
		return setupDao.listSetup();
	}

	@Override
	public SetupDTO detailSetup(int SETUP_ID) {
		// TODO Auto-generated method stub
		return setupDao.detailSetup(SETUP_ID);
	}

	@Override
	public int updateSetup(SetupDTO dto) {
		// TODO Auto-generated method stub
		return setupDao.updateSetup(dto);
	}

	@Override
	public int insertSetup(SetupDTO dto) {
		// TODO Auto-generated method stub
		return setupDao.insertSetup(dto);
	}

	@Override
	public int deleteSetup(SetupDTO dto) {
		// TODO Auto-generated method stub
		return setupDao.deleteSetup(dto);
	}

}