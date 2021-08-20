package kr.ghtech.artfms.room.dao;

import java.util.List;

import kr.ghtech.artfms.room.dto.RoomDTO;

public interface RoomDAO {
	
	List<RoomDTO> listOrder(int CONTRACT_ID);
	List<RoomDTO> ordDetail(RoomDTO dto);
	List<RoomDTO> listRESTOrder(int CONTRACT_ID);
	List<RoomDTO> listSTOREOrder(int CONTRACT_ID);
	List<RoomDTO> listaddRESTOrder(int CONTRACT_ID);
	List<RoomDTO> listaddSTOREOrder(int CONTRACT_ID);
	List<RoomDTO> listRESTOrderall();
	List<RoomDTO> listSTOREOrderall();
	List<RoomDTO> listRESTOrderRM(int CONTRACT_ID);
	List<RoomDTO> listSTOREOrderRM(int CONTRACT_ID);
	int insertRorder(RoomDTO dto); 
	int insertSorder(RoomDTO dto);
	int updateRorder(RoomDTO dto);
	int updateSorder(RoomDTO dto);
	int updateForder(RoomDTO dto);
	int updateAorder(RoomDTO dto);
	int updateGorder(RoomDTO dto);
	List<RoomDTO> listiniFtableOrder(int CONTRACT_ID);
	List<RoomDTO> listiniAltarOrder(int CONTRACT_ID);
	List<RoomDTO> listiniFgoodsOrder(int CONTRACT_ID);

}
