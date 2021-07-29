package kr.ghtech.artfms.setup.dao;

import java.util.List;

import kr.ghtech.artfms.setup.dto.SetupDTO;

public interface SetupDAO {
	
	List<SetupDTO> listSetup();
	List<SetupDTO> timelistSetup();
	List<SetupDTO> infolistSetup();
	SetupDTO detailSetup(int SETUP_ID);
	int updateSetup(SetupDTO dto);
	int updateDefault(SetupDTO dto);
	int insertSetup(SetupDTO dto);
	int deleteSetup(SetupDTO dto);
	
}
