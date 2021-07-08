package kr.ghtech.artfms.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.ghtech.artfms.user.dao.UserDAO;
import kr.ghtech.artfms.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO userDao;
	
	@Override
	public boolean loginCheck(UserDTO dto, HttpSession session) {
		// TODO Auto-generated method stub
		boolean result = userDao.loginCheck(dto);
		if (result) {
			UserDTO dto2 = viewUser(dto);
			session.setAttribute("USER_LOGINID",dto2.getUSER_LOGINID());
			session.setAttribute("USER_NAMK", dto2.getUSER_NAMK());
			session.setAttribute("USER_RANK", dto2.getUSER_RANK());
		}
		return result;
	}

	@Override
	public UserDTO viewUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.viewUser(dto);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	@Override
	public List<UserDTO> userList() {
		// TODO Auto-generated method stub
		return userDao.userList();
	}

	@Override
	public int updateUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.updateUser(dto);
	}

	@Override
	public int updPasswd(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.updPasswd(dto);
	}
}
