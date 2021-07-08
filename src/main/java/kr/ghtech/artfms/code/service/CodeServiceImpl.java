package kr.ghtech.artfms.code.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ghtech.artfms.code.dao.CodeDAO;
import kr.ghtech.artfms.code.dto.CodeDTO;
import kr.ghtech.artfms.cont.dto.ContDTO;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Inject
	CodeDAO codeDao;

	@Override
	public List<CodeDTO> listCode01() {
		// TODO Auto-generated method stub
		return codeDao.listCode01();
	}

	@Override
	public List<CodeDTO> listCode0201() {
		// TODO Auto-generated method stub
		return codeDao.listCode0201();
	}
	
	@Override
	public List<CodeDTO> listCode0202() {
		// TODO Auto-generated method stub
		return codeDao.listCode0202();
	}

	@Override
	public List<CodeDTO> listCode0203() {
		// TODO Auto-generated method stub
		return codeDao.listCode0203();
	}

	@Override
	public List<CodeDTO> listCode03() {
		// TODO Auto-generated method stub
		return codeDao.listCode03();
	}

	@Override
	public ContDTO detailCode(int CAT_ID) {
		// TODO Auto-generated method stub
		return codeDao.detailCode(CAT_ID);
	}

	@Override
	public int updateCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateCode(dto);
	}

	@Override
	public int deleteCode(int CAT_ID) {
		// TODO Auto-generated method stub
		return codeDao.deleteCode(CAT_ID);
	}

	@Override
	public int insertCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.insertCode(dto);
	}

	@Override
	public int insertCode01(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.insertCode01(dto);
	}

	@Override
	public CodeDTO detailCode01(int CAT_ID) {
		// TODO Auto-generated method stub
		return codeDao.detailCode01(CAT_ID);
	}

	@Override
	public int insertCode02(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.insertCode02(dto);
	}

	@Override
	public List<CodeDTO> listCode02() {
		// TODO Auto-generated method stub
		return codeDao.listCode02();
	}

	@Override
	public List<CodeDTO> listCodealtar() {
		// TODO Auto-generated method stub
		return codeDao.listCodealtar();
		}

	@Override
	public List<CodeDTO> listCodeftable() {
		// TODO Auto-generated method stub
		return codeDao.listCodeftable();
	}

	@Override
	public List<CodeDTO> listCode020n(int CAT01) {
		// TODO Auto-generated method stub
		return codeDao.listCode020n(CAT01);
	}

	@Override
	public int updateCode01(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateCode01(dto);
	}

	@Override
	public int updateCode02(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateCode02(dto);
	}

	@Override
	public CodeDTO detailCode02(int CAT_ID) {
		// TODO Auto-generated method stub
		return codeDao.detailCode02(CAT_ID);
	}

	@Override
	public List<CodeDTO> listbaseCode() {
		// TODO Auto-generated method stub
		return codeDao.listbaseCode();
			
	}

	@Override
	public int insertbCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.insertBcode(dto);
	}

	@Override
	public int updatebCode(CodeDTO dto) {
		// TODO Auto-generated method stub
		return codeDao.updateBcode(dto);
	}

	@Override
	public List<CodeDTO> listconBcode(String BCD_CAT_TYPE) {
		// TODO Auto-generated method stub
		return codeDao.listconBcode(BCD_CAT_TYPE);
	}

	@Override
	public List<CodeDTO> listCode0204() {
		// TODO Auto-generated method stub
		return codeDao.listCode0204();
	}

	@Override
	public List<CodeDTO> listconBcodedos1() {
		// TODO Auto-generated method stub
		return codeDao.listconBcodedos1();
	}
	
	@Override
	public List<CodeDTO> listconBcodedos2() {
		// TODO Auto-generated method stub
		return codeDao.listconBcode("2");
	}

}
