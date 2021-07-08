package kr.ghtech.artfms.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ghtech.artfms.user.dto.UserDTO;

public interface UserDAO {
	
	List<UserDTO> userList();
	public boolean loginCheck(UserDTO dto);
	public UserDTO viewUser(UserDTO dto);
	public void logout(HttpSession session);
	public int updateUser(UserDTO dto);
	public int updPasswd(UserDTO dto);

}
