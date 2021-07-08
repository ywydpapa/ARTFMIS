package kr.ghtech.artfms.code.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ghtech.artfms.code.dto.CodeDTO;
import kr.ghtech.artfms.cont.dto.ContDTO;

@Repository
public class CodeDAOImpl implements CodeDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<CodeDTO> listCode01() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode01");
	}

	@Override
	public List<CodeDTO> listCode0201() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode0201");
	}
	
	@Override
	public List<CodeDTO> listCode0202() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode0202");
	}

	@Override
	public List<CodeDTO> listCode0203() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode0203");
	}


	@Override
	public List<CodeDTO> listCode03() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode03");
	}

	@Override
	public ContDTO detailCode(int CAT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("code.detailCode", CAT_ID);
	}

	@Override
	public int updateCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.detailCode", dto);
	}

	@Override
	public int deleteCode(int CAT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.delete("code.deleteCode", CAT_ID);
	}

	@Override
	public int insertCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("code.insertCode", dto);
	}

	@Override
	public int insertCode01(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("code.insertCode01", dto);
	}

	@Override
	public int insertCode02(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("code.insertCode02", dto);
	}

	@Override
	public CodeDTO detailCode01(int CAT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("code.detailCode01",CAT_ID);
	}

	@Override
	public List<CodeDTO> listCode02() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode02");
	}

	@Override
	public List<CodeDTO> listCodealtar() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCodealtar");
	}

	@Override
	public List<CodeDTO> listCodeftable() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCodeftable");
	}

	@Override
	public List<CodeDTO> listCode020n(int CAT01) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode020n", CAT01);
	}

	@Override
	public int updateCode01(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.updateCode01", dto);
	}

	@Override
	public int updateCode02(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.updateCode02", dto);
	}

	@Override
	public CodeDTO detailCode02(int CAT_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("code.detailCode02",CAT_ID);
	}

	@Override
	public List<CodeDTO> listbaseCode() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listbaseCode");
	}

	@Override
	public int insertBcode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("code.insertbCode", dto); 
	}

	@Override
	public int updateBcode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("code.updatebCode", dto);
	}

	@Override
	public List<CodeDTO> listconBcode(String BCD_CAT_TYPE) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listconBcode", BCD_CAT_TYPE);
	}

	@Override
	public List<CodeDTO> listCode0204() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listCode0204");
	}

	@Override
	public List<CodeDTO> listconBcodedos1() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listconBcodedos1");
	}
	
	@Override
	public List<CodeDTO> listconBcodedos2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("code.listconBcode/2");
	}
}
