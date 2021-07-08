package kr.ghtech.artfms.cst.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ghtech.artfms.cst.dto.ConsultDTO;

@Repository
public class ConsultDAOImpl implements ConsultDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ConsultDTO> listconsut() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("consult.listConsult");
	}

	@Override
	public ConsultDTO detailConsult(int CONSULT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("consult.detailConsult",CONSULT_ID);
	}

	@Override
	public int updateConsult(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertConsult(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("consult.insertConsult", dto);
	}

	@Override
	public int deleteConsult(int CONSULT_ID) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
