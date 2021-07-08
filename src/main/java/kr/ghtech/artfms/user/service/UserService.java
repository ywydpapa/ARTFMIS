package kr.ghtech.artfms.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ghtech.artfms.user.dto.UserDTO;

public interface UserService {
	
	public boolean loginCheck(UserDTO dto, HttpSession session);

    public UserDTO viewUser(UserDTO dto);

	public void logout(HttpSession session);

	public List<UserDTO> userList();
	
	public int updateUser(UserDTO dto);
	
	public int updPasswd(UserDTO dto);

}
