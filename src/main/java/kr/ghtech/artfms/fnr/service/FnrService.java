package kr.ghtech.artfms.fnr.service;

import java.util.List;

import kr.ghtech.artfms.fnr.dto.FnrDTO;

public interface FnrService {

	List<FnrDTO> fnrList();
	public FnrDTO detailFnr(int FNR_ID);
	public int updateFnr(FnrDTO dto);
	
}
