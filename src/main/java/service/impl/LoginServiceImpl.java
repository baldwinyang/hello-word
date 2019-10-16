package service.impl;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserMapper;
import entity.User;
import service.LoginService;
import util.StringUtil;
@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	UserMapper userMapper;
	//处理方法是有问题的 只要用户名和密码不为空 且数据库中有此用户名  密码对不对都可以登录
	public User login(String name, String passsword) throws Exception {
        System.out.println(name + passsword);
        if(StringUtil.isNullOrZero(name)){
            System.out.println("用戶名不能為空");
            return null;
        }
        if(StringUtil.isNullOrZero(passsword)){
            System.out.println("密碼不能為空");
            return null;
        }
        User user = userMapper.findUserByName(name);
        return user;
	}
}
