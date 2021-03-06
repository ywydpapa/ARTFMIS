package kr.ghtech.artfms.goods.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ghtech.artfms.goods.dao.GoodsDAO;
import kr.ghtech.artfms.goods.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Inject
	GoodsDAO goodsDao;
	
	@Override
	public List<GoodsDTO> listGoods1() {
		// TODO Auto-generated method stub
		return goodsDao.listGoods1();
	}
	@Override
	public List<GoodsDTO> listGoods2() {
		// TODO Auto-generated method stub
		return goodsDao.listGoods2();
	}
	@Override
	public List<GoodsDTO> listGoods3() {
		// TODO Auto-generated method stub
		return goodsDao.listGoods3();
	}

	@Override
	public GoodsDTO detailGoods(int GOODS_ID) {
		// TODO Auto-generated method stub
		return goodsDao.detailGoods(GOODS_ID);
	}

	@Override
	public int updateGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.updateGoods(dto);
	}

	@Override
	public int deleteGoods(int GOODS_ID) {
		// TODO Auto-generated method stub
		return goodsDao.deleteGoods(GOODS_ID);
	}

	@Override
	public int insertGoods(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.insertGoods(dto);
	}

	@Override
	public int insertRoom(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.insertRoom(dto);
	}

	@Override
	public List<GoodsDTO> listRoom(int FROOM_TYP) {
		// TODO Auto-generated method stub
		return goodsDao.listRoom(FROOM_TYP);
	}
	@Override
	public GoodsDTO detailRoom(int FROOM_ID) {
		// TODO Auto-generated method stub
		return goodsDao.detailRoom(FROOM_ID);
	}
	@Override
	public List<GoodsDTO> menu006() {
		// TODO Auto-generated method stub
		return goodsDao.menu006();
	}
	@Override
	public List<GoodsDTO> menu008() {
		// TODO Auto-generated method stub
		return goodsDao.menu008();
	}
	@Override
	public int updateRoom(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.updateRoom(dto);
	}
	@Override
	public int insertAltar(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.insertAltar(dto);
	}
	@Override
	public int insertFtable(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.insertFtable(dto);
	}
	@Override
	public List<GoodsDTO> listAltar(int ALTAR_CAT) {
		// TODO Auto-generated method stub
		return goodsDao.listAltar(ALTAR_CAT);
	}
	@Override
	public List<GoodsDTO> listFtable(int FTABLE_CAT) {
		// TODO Auto-generated method stub
		return goodsDao.listFtable(FTABLE_CAT);
	}
	@Override
	public GoodsDTO detailAltar(int ALTAR_ID) {
		// TODO Auto-generated method stub
		return goodsDao.detailAltar(ALTAR_ID);
	}
	@Override
	public GoodsDTO detailFtable(int FTABLE_ID) {
		// TODO Auto-generated method stub
		return goodsDao.detailFtable(FTABLE_ID);
	}
	@Override
	public int updateAltar(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.updateAltar(dto);
	}
	@Override
	public int updateFtable(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.updateFtable(dto);
	}
	@Override
	public List<GoodsDTO> listGoods01(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return goodsDao.listGoods01(CAT_02_ID);
	}
	@Override
	public List<GoodsDTO> listGoods4() {
		// TODO Auto-generated method stub
		return goodsDao.listGoods4();
	}
	@Override
	public List<GoodsDTO> listGoods02(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return goodsDao.listGoods02(CAT_02_ID);
	}
	@Override
	public List<GoodsDTO> listGoods03(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return goodsDao.listGoods03(CAT_02_ID);
	}
	@Override
	public List<GoodsDTO> listGoods04(int CAT_02_ID) {
		// TODO Auto-generated method stub
		return goodsDao.listGoods04(CAT_02_ID);
	}
	@Override
	public List<GoodsDTO> dosdefaultlist121() {
		// TODO Auto-generated method stub
		return goodsDao.dosdefaultlist121();
	}
	@Override
	public List<GoodsDTO> dosdefaultlist122() {
		// TODO Auto-generated method stub
		return goodsDao.dosdefaultlist122();
	}
	@Override
	public List<GoodsDTO> dosdefaultlist2(int MESSR_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return goodsDao.dosdefaultlist2(MESSR_ORD_FROOM_ID);
	}
	@Override
	public List<GoodsDTO> dosdefaultlist3(int STORE_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return goodsDao.dosdefaultlist3(STORE_ORD_FROOM_ID);
	}
	@Override
	public int insertDos1(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.insertDos1(dto); 
	}
	@Override
	public int insertDos2(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.insertDos2(dto);
	}
	@Override
	public int insertDos3(GoodsDTO dto) {
		// TODO Auto-generated method stub
		return goodsDao.insertDos3(dto);
	}
	@Override
	public int deleteDos1(String FNRS_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return goodsDao.deleteDos1(FNRS_ORD_FROOM_ID);
	}
	@Override
	public int deleteDos2(String MESSR_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return goodsDao.deleteDos2(MESSR_ORD_FROOM_ID);
	}
	@Override
	public int deleteDos3(String STORE_ORD_FROOM_ID) {
		// TODO Auto-generated method stub
		return goodsDao.deleteDos3(STORE_ORD_FROOM_ID);
	}
	@Override
	public List<GoodsDTO> setlistRoom(int FROOM_TYP) {
		// TODO Auto-generated method stub
		return goodsDao.setlistRoom(FROOM_TYP);
	}
	@Override
	public List<GoodsDTO> doslistRoom(int FROOM_TYP) {
		// TODO Auto-generated method stub
		return goodsDao.doslistRoom(FROOM_TYP);
	}
	@Override
	public int uploadFile(HttpSession session, MultipartHttpServletRequest fileList) throws IOException {
		MultipartFile file = fileList.getFile("file");
		GoodsDTO froomfiledata = new GoodsDTO();
		froomfiledata.setFileId(UUID.randomUUID().toString());
		froomfiledata.setFileName(file.getOriginalFilename());
		froomfiledata.setFileContent(file.getBytes());
		Path mimeType_base = Paths.get("D:/"+ file.getOriginalFilename());
		String mimeType = Files.probeContentType(mimeType_base);
		froomfiledata.setFileExtention(mimeType);
		froomfiledata.setFileSize(fileList.getParameter("fileSize"));
		froomfiledata.setFROOM_IDX(fileList.getParameter("FROOM_IDX"));
		return goodsDao.uploadFile(froomfiledata);
	}
	@Override
	public List<GoodsDTO> detailRoomfile(int FROOM_ID) {
		// TODO Auto-generated method stub
		return goodsDao.detailRoomfile(FROOM_ID);
	}
	@Override
	public Integer deletefile(HttpSession session, GoodsDTO froomfiledata) {
		// TODO Auto-generated method stub
		return goodsDao.deletefile(froomfiledata);
	}
	@Override
	public int uploadFile2(HttpSession session, Integer test, MultipartHttpServletRequest fileList) throws IOException {
		MultipartFile file = fileList.getFile("file");
		GoodsDTO froomfiledata = new GoodsDTO();
		froomfiledata.setFileId(UUID.randomUUID().toString());
		//System.out.println(test);
		//System.out.println(test.toString());
		froomfiledata.setFROOM_ID(test);
		froomfiledata.setFileName(file.getOriginalFilename());
		froomfiledata.setFileContent(file.getBytes());
		Path mimeType_base = Paths.get("D:/"+ file.getOriginalFilename());
		String mimeType = Files.probeContentType(mimeType_base);
		froomfiledata.setFileExtention(mimeType);
		froomfiledata.setFileSize(fileList.getParameter("fileSize"));
		froomfiledata.setFROOM_IDX(fileList.getParameter("FROOM_IDX"));
		return goodsDao.uploadFile2(froomfiledata);
	}
	@Override
	public int selectnewroom(MultipartHttpServletRequest fileList) {
		// TODO Auto-generated method stub
		GoodsDTO froomfiledata = new GoodsDTO();
		froomfiledata.setFROOM_TITLE(fileList.getParameter("FROOM_TITLE"));
		return goodsDao.selectnewroom(froomfiledata);
	}
	@Override
	public List<GoodsDTO> selectnewroom1(MultipartHttpServletRequest fileList) {
		GoodsDTO froomfiledata = new GoodsDTO();
		System.out.println(fileList.getParameter("FROOM_TITLE"));
		froomfiledata.setFROOM_TITLE(fileList.getParameter("FROOM_TITLE"));
		return goodsDao.selectnewroom1(froomfiledata);
	}
	@Override
	public List<GoodsDTO> detailRoomfile1(String fileId) {
		// TODO Auto-generated method stub
		return goodsDao.detailRoomfile(fileId);
	}
	
}