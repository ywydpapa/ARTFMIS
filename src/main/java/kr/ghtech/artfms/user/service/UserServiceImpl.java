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
			UserDTO dto2 = detailUser(dto);
			session.setAttribute("USER_LOGINID",dto2.getUSER_LOGINID());
			session.setAttribute("USER_NAMK", dto2.getUSER_NAMK());
			session.setAttribute("USER_RANK", dto2.getUSER_RANK());
			session.setAttribute("USER_ROLE", dto2.getUSER_ROLE1());
		}
		return result;
	}

	@Override
	public UserDTO detailUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.detailUser(dto);
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

	@Override
	public UserDTO detail(int USER_ID) {
		// TODO Auto-generated method stub
		return userDao.detail(USER_ID);
	}

	@Override
	public int insertUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.insertUser(dto);
	}
}
