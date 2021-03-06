package kr.ghtech.artfms.room.service;

import java.util.List;

import kr.ghtech.artfms.room.dto.RoomDTO;

public interface RoomService {

	List<RoomDTO> listOrder(int CONTRACT_ID);
	List<RoomDTO> listOrderall();
	List<RoomDTO> listorderroom();
	List<RoomDTO> ordDetail(RoomDTO dto);
	List<RoomDTO> listRESTOrder(int CONTRACT_ID);
	List<RoomDTO> listSTOREOrder(int CONTRACT_ID);
	List<RoomDTO> listaddRESTOrder(int CONTRACT_ID);
	List<RoomDTO> listaddSTOREOrder(int CONTRACT_ID);
	int insertRorder(RoomDTO dto); 
	int insertSorder(RoomDTO dto);
	int updateRorder(RoomDTO dto);
	int updateSorder(RoomDTO dto);
	int cancRorder(RoomDTO dto);
	int cancSorder(RoomDTO dto);
	int updateForder(RoomDTO dto);
	int updateAorder(RoomDTO dto);
	int updateGorder(RoomDTO dto);
	List<RoomDTO> listRESTOrderRM(int CONTRACT_ID);
	List<RoomDTO> listSTOREOrderRM(int CONTRACT_ID);
	List<RoomDTO> listRESTOrderall();
	List<RoomDTO> listSTOREOrderall();
	List<RoomDTO> listiniFtableOrder(int CONTRACT_ID);
	List<RoomDTO> listiniAltarOrder(int CONTRACT_ID);
	List<RoomDTO> listiniFgoodsOrder(int CONTRACT_ID);
}
