package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserMapper {
	User findUserByName(String name)throws Exception;
	public void save(User user);
	public List<User> findAllUser();
	void adduser(User user);
	void deleteuserByname(String user_name);
	void updateUser(User user);
	
	
}
