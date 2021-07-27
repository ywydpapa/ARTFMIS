package kr.ghtech.artfms.cst.service;

import java.util.List;

import kr.ghtech.artfms.cont.dto.ContDTO;
import org.springframework.stereotype.Service;

import kr.ghtech.artfms.cst.dto.ConsultDTO;

@Service
public interface ConsultService {

	List<ConsultDTO> listconsut();
	ConsultDTO detailConsult(int CONSULT_ID);
	int updateConsult(ConsultDTO dto);
	int insertConsult(ConsultDTO dto);
	int deleteConsult(int CONSULT_ID);
	int insertCstFtable(ConsultDTO dto);
	int deleteCstFtable(ConsultDTO dto);

	ConsultDTO detailCstRentfee(Integer CONSULT_ID);
	int insertCSTRentfee(ConsultDTO dto);
	int updateCSTRentfee(ConsultDTO dto);
	int deleteCSTRentfee(ConsultDTO dto);
}
