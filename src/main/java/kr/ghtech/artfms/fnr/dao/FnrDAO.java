package kr.ghtech.artfms.fnr.dao;

import java.util.List;

import kr.ghtech.artfms.fnr.dto.FnrDTO;

public interface FnrDAO {
	
	List<FnrDTO> fnrList();
	public FnrDTO detailFnr(int FNR_ID);
	public int updateFnr(FnrDTO dto);
	
}
