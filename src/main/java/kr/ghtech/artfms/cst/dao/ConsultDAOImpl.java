package kr.ghtech.artfms.cst.dao;

import kr.ghtech.artfms.cst.dto.ConsultDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

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
		return sqlSession.update("consult.updateConsult", dto);
	}

	@Override
	public int insertConsult(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("consult.insertConsult", dto);
	}

	@Override
	public int deleteConsult(int CONSULT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.update("consult.deleteConsult", CONSULT_ID);
	}

	@Override
	public int insertCstFtable(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("consult.insertCstFtable", dto);
	}

	@Override
	public int deleteCstFtable(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("consult.deleteCstFtable", dto);
	}

	@Override
	public ConsultDTO detailCstRentfee(Integer CONSULT_ID) {
		return sqlSession.selectOne("consult.detailCstRentfee", CONSULT_ID);
	}

	@Override
	public int insertCSTRentfee(ConsultDTO dto) {
		return sqlSession.insert("consult.insertCstRentfee", dto);
	}

	@Override
	public int updateCSTRentfee(ConsultDTO dto) {
		return sqlSession.update("consult.updateCstRentfee", dto);
	}

	@Override
	public int deleteCSTRentfee(ConsultDTO dto) {
		return sqlSession.update("consult.deleteCstRentfee", dto);
	}

	@Override
	public int updateConsult2(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("consult.updconsultp2",dto);
	}
	
	@Override
	public int updateConsult3(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("consult.updconsultp3",dto);
	}

	@Override
	public int updateConsult4(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("consult.updconsultp4",dto);
	}

	@Override
	public int updateConsult5(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("consult.updconsultp5",dto);
	}

	@Override
	public int insertConsult2(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("consult.consultp2", dto);
	}

	@Override
	public int insertConsult3(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("consult.consultp3", dto);
	}

	@Override
	public int insertConsult4(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("consult.consultp4", dto);
	}

	@Override
	public int insertConsult5(ConsultDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("consult.consultp5", dto);
	}

	@Override
	public List<ConsultDTO> reloadP3(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("consult.reloadConsultp3", CONSULT_ID);
	}
	
	@Override
	public List<ConsultDTO> reloadP4m(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("consult.reloadConsultp4m", CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> reloadP5(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("consult.reloadConsultp5", CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> doslistFroom() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("consult.listFroom");
	}

	@Override
	public List<ConsultDTO> doslistEtcroom() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("consult.listEtcroom");
	}

	@Override
	public List<ConsultDTO> ConsultGet(int CONSULT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("consult.consultget", CONSULT_ID);
	}

	@Override
	public List<ConsultDTO> reloadP2froom2(Integer CONSULT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("consult.reloadContp2froom2", CONSULT_ID);
	}

}
