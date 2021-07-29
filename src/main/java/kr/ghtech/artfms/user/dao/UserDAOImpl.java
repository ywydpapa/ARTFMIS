package kr.ghtech.artfms.user.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ghtech.artfms.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(UserDTO dto) {
		// TODO Auto-generated method stub
		String name = sqlSession.selectOne("user.loginCheck", dto);
		return (name == null) ? false:true;
	}

	@Override
	public UserDTO detailUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.detailUser", dto);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<UserDTO> userList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.userList");
	}

	@Override
	public int updateUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.updateUser",dto);
	}

	@Override
	public int updPasswd(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.updPasswd", dto);
	}

	@Override
	public UserDTO detail(int USER_ID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.detail", USER_ID);
	}
	
}
