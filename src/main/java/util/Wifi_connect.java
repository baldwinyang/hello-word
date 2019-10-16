package util;

import java.awt.AWTException;
import java.awt.Robot;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Timer;
import java.util.TimerTask;

public class Wifi_connect {
	 
 public static String connect(String ip,int port,String str) throws UnknownHostException, IOException, AWTException{
	  String message = null;
	  Socket socket= new Socket(ip,port);
	  OutputStream out =socket.getOutputStream();
	  OutputStreamWriter osw= new OutputStreamWriter(out,"UTF-8");
	  PrintWriter pw= new PrintWriter(osw,true);
	  pw.write(str);
	  pw.flush();
	  socket.shutdownOutput();
	  InputStream in= socket.getInputStream();	
	  BufferedInputStream bis = new BufferedInputStream(in);  
	  //DataInputStream dis = new DataInputStream(in);
	  InputStreamReader isr= new InputStreamReader(in,"UTF-8");
	  BufferedReader br= new BufferedReader(isr);	  
	  for(int i=0;i<100;i++){
	  //延迟
	  int len;
	  
	  byte[] buf = new byte[128]; 
	  while((len = bis.read(buf))!=-1){
		  System.out.println(new String(buf,0,len));
		  }
	  }
	  //message=br.readLine();
	  System.out.println(message);
	  pw.close();
	  osw.close();
	  out.close();
	  br.close();
	  isr.close();
	  in.close();
	  socket.close();
	  return message;
				
 }
 
	
}
