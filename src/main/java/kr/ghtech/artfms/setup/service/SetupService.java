package kr.ghtech.artfms.setup.service;

import java.util.List;

import kr.ghtech.artfms.setup.dto.SetupDTO;

public interface SetupService {
	
	List<SetupDTO> listSetup();
	SetupDTO detailSetup(int SETUP_ID);
	int updateSetup(SetupDTO dto);
	int insertSetup(SetupDTO dto);
	int deleteSetup(SetupDTO dto);

}
