package controller;

import java.awt.AWTException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.AgvMapper;
import dao.UserMapper;
import entity.Agv;
import entity.User;
import service.impl.LoginServiceImpl;
import util.Wifi_connect;

@Controller
public class LoginController {
	@Autowired
	LoginServiceImpl loginServiceImpl;
	@Autowired
	UserMapper userMapper;
	@Autowired
	AgvMapper agvMapper;
	
	@RequestMapping(value = "/hello")
	public String hello(){
		return "login";
	}
	@RequestMapping(value = "/movepath")
	public String movepath(){
		System.out.println("轨迹");
		return "movepath";
	}
	
	@RequestMapping(value ="/reg")
	public String reg(){
		return "reg";
	}
	
	//任务信息管理
		@RequestMapping(value ="/task_management",method={RequestMethod.POST,RequestMethod.GET})
	public String task_management(
			HttpSession session){

		List<Agv> agv=agvMapper.findAllAgv();
//			System.out.println(agv.get(0));
		session.setAttribute("allAgv", agv);
		return "task_management";
	}
	
	
	
	//AGV信息管理
	@RequestMapping(value ="/information_management",method={RequestMethod.POST,RequestMethod.GET})
	public String information_management(
			HttpSession session){
		
		List<Agv> agv=agvMapper.findAllAgv();
//		System.out.println(agv.get(0));
		session.setAttribute("allAgv", agv);
		return "information_management";
	}
	
	
	//增加AGV
	@RequestMapping(value ="/AGV_add",method={RequestMethod.POST,RequestMethod.GET})
	public String AGV_add(
			@RequestParam(value = "agvadd_name") String agvadd_name,
			@RequestParam(value = "agvadd_ip") String agvadd_ip,
			HttpSession session){
		if(agvadd_name!=""&&agvadd_ip!=""){
			Agv agv_add=new Agv();
			agv_add.setName(agvadd_name);
			agv_add.setIp(agvadd_ip);
			agvMapper.addAgv(agv_add);
		}
		List<Agv> agv=agvMapper.findAllAgv();
//		System.out.println(agv.get(0));
		session.setAttribute("allAgv", agv);
		return "information_management";
	}
	
	//删除AGV
	
	@RequestMapping(value ="/agvdelete/{name}",method={RequestMethod.POST,RequestMethod.GET})
	public String agvdelete(@PathVariable("name") String name,
			HttpSession session){
        agvMapper.deleteAgvByname(name);
		List<Agv> agv=agvMapper.findAllAgv();
		session.setAttribute("allAgv", agv);
		return "information_management";
		
	}
	
	//进入修改AGV
	@RequestMapping(value ="/agvmodify1/{name}",method={RequestMethod.POST,RequestMethod.GET})
	public String agvmodify1(
			@PathVariable("name") String name,
			HttpSession session){
		
		Agv agv_modify=agvMapper.findByName(name);
	//	System.out.println(name);
		session.setAttribute("modifyagv", agv_modify);
		return "agvmodify";
	}
	
	
	
	
	//确定修改AGV
	
	@RequestMapping(value ="/agvmodify2",method={RequestMethod.POST,RequestMethod.GET})
	public String agvmodify2(
			@RequestParam(value = "agvmodify_name") String agvmodify_name,
			@RequestParam(value = "agvmodify_ip") String agvmodify_ip,
			HttpSession session){
			Agv agv_modify=new Agv();
			agv_modify=(Agv) session.getAttribute("modifyagv");
			agv_modify.setName(agvmodify_name);
			agv_modify.setIp(agvmodify_ip);
			agvMapper.updateAgv(agv_modify);
	//	   System.out.println(agv_modify);
		List<Agv> agv=agvMapper.findAllAgv();
		session.setAttribute("allAgv", agv);
		return "information_management";
	}
	
	
	
	//运动控制界面
		@RequestMapping(value ="/motion_control")
		public String motion_control(HttpSession session){
			List<Agv> agv=agvMapper.findAllAgv();
			session.setAttribute("allAgv", agv);
			
			return "motion_control";
		}
		
		
		
	//agv控制
		@RequestMapping(value ="/motion/{action}",method={RequestMethod.POST,RequestMethod.GET})
		public void motion_go(@PathVariable("action") int action,
				@RequestParam(value = "AGV_select") String AGV_select,
				
				HttpSession session) throws AWTException{
			System.out.println("选择哪个车？");
			System.out.println(AGV_select);
			Agv agv=agvMapper.findByName(AGV_select);
			String instruction="";
			try {
				switch(action){
				case 1:       //前进
					instruction="01";
					break;
				case 2:       //左转
					instruction="02";
					break;
				case 3:       //停止
					instruction="10";
					break;
				case 4:       //右转
					instruction="03";
					break;
				case 5:       //掉头
					instruction="04";
					break;
				case 6:       //上升
					instruction="06";
					break;
				case 7:       //旋转
					instruction="07";
					break;
				case 8:       //下降
					instruction="08";
					break;
				case 9:       //后退
					instruction="05";
					break;
				case 10:       //停止升降
					instruction="09";	
					break;
				case 11:       //停止升降
					instruction="20";	
					break;
				}
				String ip=agv.getIp();         //agv的ip地址
				System.out.println(ip);
				int port=8899;                 //端口号
				String message=Wifi_connect.connect(ip, port, instruction);   //发出指令，获得反馈
				session.setAttribute("feedback", message); 
				System.out.println(message);
			
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		
		
		//任务控制
				@RequestMapping(value ="/task_control")
				public String task_control(HttpSession session){
					List<Agv> agv=agvMapper.findAllAgv();
					session.setAttribute("allAgv", agv);
					return "task_control";
				}
				
		//执行任务
				@RequestMapping(value ="/task",method={RequestMethod.POST,RequestMethod.GET})
				public String task(
						@RequestParam(value = "agv") String agv_name,
						@RequestParam(value = "task") String task,
						HttpSession session) throws AWTException, UnknownHostException, IOException{
//					System.out.println(action);
					Agv agv=agvMapper.findByName(agv_name);
					String ip=agv.getIp();
					int port=8899; 
					String instruction="c200003300003400003500010";
					System.out.println(instruction);
					String message=Wifi_connect.connect(ip, port, instruction);
					return null;
				}	
	
	
	//进入修改用户
		@RequestMapping(value ="/usermodify1/{user_name}")
		public String usermodify1(@PathVariable("user_name") String user_name,HttpSession session){
			try {
				User user=userMapper.findUserByName(user_name);
				session.setAttribute("modifyuser", user);  //modifyuser进行修改的用户
				return "usermodify";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return null;
		}
		
		//确认修改用户
		@RequestMapping(value ="/usermodify2",method={RequestMethod.POST,RequestMethod.GET})
		public String usermodify1(@RequestParam(value = "usermodify_name") String usermodify_name,@RequestParam(value = "usermodify_password") String usermodify_password,@RequestParam(value = "usermodify_type") String usermodify_type,HttpSession session){
			try {
				User user=new User();
				User user2=(User) session.getAttribute("modifyuser");
				user.setUser_id(user2.getUser_id());
				user.setUser_name(usermodify_name);
				user.setUser_password(usermodify_password);
				user.setUser_type(usermodify_type);
				userMapper.updateUser(user);   //修改用户
				List<User> alluser=new ArrayList<User>();
				alluser=userMapper.findAllUser();
				session.setAttribute("alluser", alluser);  //所有用户
				
				return "systemmanage";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return null;
		}
		
		
		
		
		//展示用户
		@RequestMapping(value = "/systemmanage")
		public String systemmanage(HttpSession session){
			User user=(User) session.getAttribute("this_user");
			if(!"管理员".equals(user.getUser_type())){
				return "kongbai";
			}
			
			try {
				List<User> alluser=new ArrayList<User>();
				alluser=userMapper.findAllUser();
				session.setAttribute("alluser", alluser);  //所有用户
				
				return "systemmanage";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
		//增加用户
		@RequestMapping(value="/usershow",method={RequestMethod.POST,RequestMethod.GET})
		public String usershow(@RequestParam(value = "useradd_name") String useradd_name,@RequestParam(value = "useradd_password") String useradd_password,@RequestParam(value = "useradd_type") String useradd_type,HttpSession session){
			try {
				
				List<User> alluser=new ArrayList<User>();
				User user=new User();
				user.setUser_name(useradd_name);
				user.setUser_password(useradd_password);
				user.setUser_type(useradd_type);
			if(useradd_name!=""){
				userMapper.adduser(user);
			}
				alluser=userMapper.findAllUser();
				
				session.setAttribute("alluser", alluser);  //所有用户
				return "systemmanage";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
		//删除用户
		@RequestMapping(value ="/userdelete1/{user_name}")
		public String userdelete1(@PathVariable("user_name") String user_name,HttpSession session){
			userMapper.deleteuserByname(user_name);
			List<User> alluser=new ArrayList<User>();
			alluser=userMapper.findAllUser();		
			session.setAttribute("alluser", alluser);  //所有用户
			
			return "systemmanage";
		}
		
	//登录
	@RequestMapping(value = "/login")
	public String login(String name, String password,HttpSession session,HttpServletResponse response){
		try {
			User user = loginServiceImpl.login(name, password);
			if(user == null){
			//	System.out.println("登录失败");
				response.setHeader("Content-type", "text/html;charset=UTF-8");
				response.setCharacterEncoding("utf-8");
				
					PrintWriter out = response.getWriter();
					out.print("<script>alert('用户名或密码错误');window.location='hello'</script>");
					out.flush();
					out.close();
					
			}else {
				System.out.println("登录成功");
				session.setAttribute("this_user", user);  //存入用户信息
				return "mainpage";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	//注册用户
	@RequestMapping(value = "/zc_user")
	public String zc_user(String name, String password,String password2,HttpSession session,HttpServletResponse response) throws Exception{
		 System.out.println(name);
		 System.out.println(password+"+"+password2);
			User user=new User();
			User user_e=new User();
			user_e=userMapper.findUserByName(name);

			if(user_e!=null){
				response.setHeader("Content-type", "text/html;charset=UTF-8");
				response.setCharacterEncoding("utf-8");
				
				PrintWriter out = response.getWriter();
				out.print("<script>alert('用户名已存在');window.location='reg'</script>");
				out.flush();
				out.close();
				return "reg";
			}
			
			if(!password.equals(password2)){
				response.setHeader("Content-type", "text/html;charset=UTF-8");
				response.setCharacterEncoding("utf-8");
				
				PrintWriter out = response.getWriter();
				out.print("<script>alert('两次密码输入不一致');window.location='reg'</script>");
				out.flush();
				out.close();
				return "reg";
			}
			
			user.setUser_name(name);
			user.setUser_password(password);
			user.setUser_type("用户");
			userMapper.adduser(user);
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			
			PrintWriter out = response.getWriter();
			out.print("<script>alert('注册成功');window.location='reg'</script>");
			out.flush();
			out.close();
		return "reg";
	}
	
	
	
	@RequestMapping(value = "/register")
	public String register(int id,String name,String type,String password){
		try {
			User user =new User(id,name,type,password);
			userMapper.save(user);
			List<User> users=userMapper.findAllUser();
			for(User user1:users){
				System.out.println(user1);
			}
			return "login";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}
	

}
