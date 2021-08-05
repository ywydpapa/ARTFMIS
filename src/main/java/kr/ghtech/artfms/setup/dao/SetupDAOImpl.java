package kr.ghtech.artfms.setup.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ghtech.artfms.setup.dto.SetupDTO;

@Repository
public class SetupDAOImpl implements SetupDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<SetupDTO> listSetup() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("setup.listSetup");
	}

	@Override
	public SetupDTO detailSetup(int SETUP_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("setup.detailSetup", SETUP_ID);
	}

	@Override
	public int updateSetup(SetupDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("setup.update", dto);
	}

	@Override
	public int insertSetup(SetupDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("setup.insert", dto);
	}

	@Override
	public int deleteSetup(SetupDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("setup.delete", dto);
	}

	@Override
	public List<SetupDTO> timelistSetup() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("setup.timelistSetup");
	}

	@Override
	public List<SetupDTO> infolistSetup() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("setup.infolistSetup");
	}

	@Override
	public int updateDefault(SetupDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("setup.updatedefault", dto);
	}

	@Override
	public SetupDTO infoCont() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("setup.infoCont");
	}

}
