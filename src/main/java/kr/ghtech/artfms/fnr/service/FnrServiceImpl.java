package kr.ghtech.artfms.fnr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ghtech.artfms.fnr.dao.FnrDAO;
import kr.ghtech.artfms.fnr.dto.FnrDTO;

@Service
public class FnrServiceImpl implements FnrService {

	@Inject
	FnrDAO fnrDao;
	
	@Override
	public List<FnrDTO> fnrList() {
		// TODO Auto-generated method stub
		return fnrDao.fnrList();
	}

	@Override
	public FnrDTO detailFnr(int FNR_ID) {
		// TODO Auto-generated method stub
		return fnrDao.detailFnr(FNR_ID);
	}

	@Override
	public int updateFnr(FnrDTO dto) {
		// TODO Auto-generated method stub
		return fnrDao.updateFnr(dto);
	}

}
