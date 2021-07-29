package kr.ghtech.artfms.fnr.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ghtech.artfms.fnr.dto.FnrDTO;

@Repository
public class FnrDAOImpl implements FnrDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<FnrDTO> fnrList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("fnr.listFnr");
	}

	@Override
	public FnrDTO detailFnr(int FNR_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fnr.detailFnr", FNR_ID);
	}

	@Override
	public int updateFnr(FnrDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("fnr.updateFnr", dto);
	}

}
