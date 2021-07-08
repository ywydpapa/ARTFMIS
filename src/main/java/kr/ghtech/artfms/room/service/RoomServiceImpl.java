package kr.ghtech.artfms.room.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ghtech.artfms.room.dao.RoomDAO;
import kr.ghtech.artfms.room.dto.RoomDTO;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Inject
	RoomDAO RoomDao;

	@Override
	public List<RoomDTO> listOrder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RoomDTO> listRESTOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listRESTOrder(CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listSTOREOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listSTOREOrder(CONTRACT_ID);
	}

	@Override
	public int insertRorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return RoomDao.updateRorder(dto);
	}

	@Override
	public int updateSorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return RoomDao.updateSorder(dto);
	}

	@Override
	public List<RoomDTO> listRESTOrderRM(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listRESTOrderRM(CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listSTOREOrderRM(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listSTOREOrderRM(CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listRESTOrderall() {
		// TODO Auto-generated method stub
		return RoomDao.listRESTOrderall();
	}

	@Override
	public List<RoomDTO> listSTOREOrderall() {
		// TODO Auto-generated method stub
		return RoomDao.listSTOREOrderall();
	}

	@Override
	public List<RoomDTO> listiniFtableOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listiniFtableOrder(CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listiniAltarOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listiniAltarOrder(CONTRACT_ID);
		
	}

	@Override
	public List<RoomDTO> listiniFgoodsOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listiniFgoodsOrder(CONTRACT_ID);
	}

	@Override
	public int updateForder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return RoomDao.updateForder(dto);
	}

	@Override
	public int updateAorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return RoomDao.updateAorder(dto);
	}

	@Override
	public int updateGorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return RoomDao.updateGorder(dto);
	}

	@Override
	public List<RoomDTO> listaddRESTOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listaddRESTOrder(CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listaddSTOREOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return RoomDao.listaddSTOREOrder(CONTRACT_ID);
	}
}
