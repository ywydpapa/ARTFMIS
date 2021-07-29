package kr.ghtech.artfms.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ghtech.artfms.user.dto.UserDTO;

public interface UserDAO {
	
	List<UserDTO> userList();
	public boolean loginCheck(UserDTO dto);
	public UserDTO detailUser(UserDTO dto);
	public UserDTO detail(int USER_ID);
	public void logout(HttpSession session);
	public int insertUser(UserDTO dto);	
	public int updateUser(UserDTO dto);
	public int updPasswd(UserDTO dto);

}
