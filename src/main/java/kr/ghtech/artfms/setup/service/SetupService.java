package kr.ghtech.artfms.setup.service;

import java.util.List;

import kr.ghtech.artfms.setup.dto.SetupDTO;

public interface SetupService {
	
	List<SetupDTO> listSetup();
	List<SetupDTO> timelistSetup();
	List<SetupDTO> infolistSetup();
	SetupDTO detailSetup(int SETUP_ID);
	SetupDTO infoCont();
	int updateSetup(SetupDTO dto);
	int updateDefault(SetupDTO dto);
	int insertSetup(SetupDTO dto);
	int deleteSetup(SetupDTO dto);

}
