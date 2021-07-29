package kr.ghtech.artfms.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ghtech.artfms.user.dto.UserDTO;

public interface UserService {
	
	public boolean loginCheck(UserDTO dto, HttpSession session);

    public UserDTO detailUser(UserDTO dto);
    
    public UserDTO detail(int USER_ID);

	public void logout(HttpSession session);

	public List<UserDTO> userList();
	
	public int updateUser(UserDTO dto);
	
	public int updPasswd(UserDTO dto);

}
