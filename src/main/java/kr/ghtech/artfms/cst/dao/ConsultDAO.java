package kr.ghtech.artfms.cst.dao;

import java.util.List;

import kr.ghtech.artfms.cst.dto.ConsultDTO;

public interface ConsultDAO {
	
	List<ConsultDTO> listconsut();
	ConsultDTO detailConsult(int CONSULT_ID);
	int updateConsult(ConsultDTO dto);
	int insertConsult(ConsultDTO dto);
	int deleteConsult(int CONSULT_ID);
	int insertCstFtable(ConsultDTO dto);
	int deleteCstFtable(ConsultDTO dto);

}
