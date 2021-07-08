package kr.ghtech.artfms.cst.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ghtech.artfms.cst.dto.ConsultDTO;

@Service
public interface ConsultService {

	List<ConsultDTO> listconsut();
	ConsultDTO detailConsult(int CONSULT_ID);
	int updateConsult(ConsultDTO dto);
	int insertConsult(ConsultDTO dto);
	int deleteConsult(int CONSULT_ID);


}
