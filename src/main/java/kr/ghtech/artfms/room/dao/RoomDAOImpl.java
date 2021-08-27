package kr.ghtech.artfms.room.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ghtech.artfms.room.dto.RoomDTO;

@Repository
public class RoomDAOImpl implements RoomDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<RoomDTO> listOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.ordlist", CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listRESTOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.restOrdlist", CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listSTOREOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.storeOrdlist", CONTRACT_ID);
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
		return sqlSession.update("room.cfnrestord", dto);
	}

	@Override
	public int updateSorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.cfnstoreord", dto);
	}

	@Override
	public List<RoomDTO> listRESTOrderRM(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.restOrdlistRM", CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listSTOREOrderRM(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.storeOrdlistRM", CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listRESTOrderall() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.restOrdlistall");
	}

	@Override
	public List<RoomDTO> listSTOREOrderall() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.storeOrdlistall");
	}

	@Override
	public List<RoomDTO> listiniFtableOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.iniFtableOrdlist", CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listiniAltarOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.iniAltarOrdlist", CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listiniFgoodsOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.iniFgoodsOrdlist", CONTRACT_ID);
	}

	@Override
	public int updateForder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.cfnftord", dto);
	}

	@Override
	public int updateAorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.cfnaltord", dto);
	}

	@Override
	public int updateGorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.cfnfgord", dto);
	}

	@Override
	public List<RoomDTO> listaddRESTOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.restaddOrdlist", CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> listaddSTOREOrder(int CONTRACT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.storeaddOrdlist", CONTRACT_ID);
	}

	@Override
	public List<RoomDTO> ordDetail(RoomDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.orddetail", dto);
	}

	@Override
	public List<RoomDTO> listOrderall() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.ordlistall");
	}

	@Override
	public int cancRorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.cancrestord", dto);
	}

	@Override
	public int cancSorder(RoomDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.cancstoreord", dto);
	}

	
}
