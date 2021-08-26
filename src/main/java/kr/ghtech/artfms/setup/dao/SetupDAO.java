package kr.ghtech.artfms.setup.dao;

import java.util.List;

import kr.ghtech.artfms.setup.dto.SetupDTO;

public interface SetupDAO {
	
	List<SetupDTO> listSetup();
	List<SetupDTO> timelistSetup();
	List<SetupDTO> timelist();
	List<SetupDTO> infolistSetup();
	List<SetupDTO> infolist();
	List<SetupDTO> listFroomSetl(int SETL_FROOM_ID);
	SetupDTO detailSetup(int SETUP_ID);
	SetupDTO infoCont();
	int updateSetup(SetupDTO dto);
	int updateDefault(SetupDTO dto);
	int insertSetup(SetupDTO dto);
	int deleteSetup(SetupDTO dto);
	int insFroomSetl(SetupDTO dto);
	int updFroomSetl(SetupDTO dto);
}
