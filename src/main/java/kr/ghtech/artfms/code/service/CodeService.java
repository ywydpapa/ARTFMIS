package kr.ghtech.artfms.code.service;

import java.util.List;

import kr.ghtech.artfms.code.dto.CodeDTO;
import kr.ghtech.artfms.cont.dto.ContDTO;

public interface CodeService {

	List<CodeDTO> listbaseCode();
	List<CodeDTO> listCode01();
	List<CodeDTO> listCode020n(int CAT01);
	List<CodeDTO> listCode0201();
	List<CodeDTO> listCode0202();
	List<CodeDTO> listCode0203();
	List<CodeDTO> listCode0204();
	List<CodeDTO> listCode02();
	List<CodeDTO> listCode03();
	List<CodeDTO> listCodealtar();
	List<CodeDTO> listCodeftable();
	List<CodeDTO> listconBcode(String BCD_CAT_TYPE);
	List<CodeDTO> listconBcodedos1();
	List<CodeDTO> listconBcodedos2();
	ContDTO detailCode(int CAT_ID);
	CodeDTO detailCode01(int CAT_ID);
	CodeDTO detailCode02(int CAT_ID);
	int updateCode(CodeDTO dto);
	int deleteCode(int CAT_ID);
	int insertCode(CodeDTO dto);
	int insertbCode(CodeDTO dto);
	int updatebCode(CodeDTO dto);
	int insertCode01(CodeDTO dto);
	int insertCode02(CodeDTO dto);
	int updateCode01(CodeDTO dto);
	int updateCode02(CodeDTO dto);
}
