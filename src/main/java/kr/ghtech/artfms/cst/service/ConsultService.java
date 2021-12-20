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
	int insertCstFtable(ConsultDTO dto);
	int deleteCstFtable(ConsultDTO dto);

	ConsultDTO detailCstRentfee(Integer CONSULT_ID);
	int insertCSTRentfee(ConsultDTO dto);
	int updateCSTRentfee(ConsultDTO dto);
	int deleteCSTRentfee(ConsultDTO dto);
	int updateConsult2(ConsultDTO dto);
	int updateConsult3(ConsultDTO dto);
	int updateConsult4(ConsultDTO dto);
	int updateConsult5(ConsultDTO dto);
	int insertConsult2(ConsultDTO dto);
	int insertConsult3(ConsultDTO dto);
	int insertConsult4(ConsultDTO dto);
	int insertConsult5(ConsultDTO dto);
	
	List<ConsultDTO> reloadP3(Integer CONSULT_ID);
	List<ConsultDTO> reloadP4m(Integer CONSULT_ID);
	List<ConsultDTO> reloadP5(Integer CONSULT_ID);
	List<ConsultDTO> doslistFroom();
	List<ConsultDTO> doslistEtcroom();
	List<ConsultDTO> ConsultGet(Integer CONSULT_ID);
	List<ConsultDTO> reloadP2froom2(Integer CONSULT_ID);
	List<ConsultDTO> consultSeleteGet(Integer CONSULT_ID);
	List<ConsultDTO> consultModalList();
	List<ConsultDTO> consultModalSearch(ConsultDTO dto);
	List<ConsultDTO> writeConsultSelect(Integer CONSULT_ID);
	List<ConsultDTO> getConsultId();
}
