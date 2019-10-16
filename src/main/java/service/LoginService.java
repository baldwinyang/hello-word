package service;

import entity.User;

public interface LoginService {
	User login(String name, String passsword) throws Exception;
}
