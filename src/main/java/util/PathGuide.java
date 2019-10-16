package util;


import java.util.ArrayList;
import java.util.List;

public class PathGuide {
	//m为二维码长度  不需要角度  取出当前点的前一个点和后一个点即可确定当前点的运动方向
    public static List<Integer> guidePath(List<Integer> pathlist,int m,int c){
    	List<Integer> guidepath = new ArrayList<Integer>();
    	int guide;
        for (int i = 0; i < pathlist.size(); i++) {
        	guidepath.add(pathlist.get(i));
        	//确定第一个点的运动方向 
        	if(i==0){
        		int x1=pathlist.get(i)%m;
        		int x2=pathlist.get(i+1)%m;
        		int y1=pathlist.get(i)/m;
        		int y2=pathlist.get(i+1)/m;
        		//c为六轴传感器角度
        		switch (c) {
        			case 0:
	        		if(x1<x2){
	        		//左转
	        			guide = 1;
	        			guidepath.add(guide);
	        			continue;
	        		}
	        		//右转
	        		if(x1>x2){
	        			guide =3;
	        			guidepath.add(guide);
	        			continue;
	        		}
	        		//直行
	        		if(y1<y2){
		        		
		        			guide = 2;
		        			guidepath.add(guide);
		        			continue;
		        	}
	        		//旋转180（基本不存在这种情况  应该只存在路径第一个点）
	        		if(y1>y2){
		        		
		        			guide = 4;
		        			guidepath.add(guide);
		        			continue;
		        	}
	        		break;
        			case 90:
	        		if(y1>y2){
	        		//左转
	        			guide = 1;
	        			guidepath.add(guide);
	        			continue;
	        		}
	        		if(y1>y2){
	        			guide =3;
	        			guidepath.add(guide);
	        			continue;
	        		}
	        		//直行
	        		if(x1>x2){
		        		
		        			guide = 2;
		        			guidepath.add(guide);
		        			continue;
		        	}
	        		//旋转180（基本不存在这种情况  应该只存在路径第一个点）
	        		if(x1>x2){
		        		
		        			guide = 4;
		        			guidepath.add(guide);
		        			continue;
		        	}
	        		break;
        			case 180:
	        		if(x2<x1){
	        		//左转
	        			guide = 1;
	        			guidepath.add(guide);
	        			continue;
	        		}
	        		//右转
	        		if(x2>x1){
	        			guide =3;
	        			guidepath.add(guide);
	        			continue;
	        		}
	        		//直行
	        		if(y1>y2){
		        		
		        			guide = 2;
		        			guidepath.add(guide);
		        			continue;
		        	}
	        		//旋转180（基本不存在这种情况  应该只存在路径第一个点）
	        		if(y1<y2){
		        		
		        			guide = 4;
		        			guidepath.add(guide);
		        			continue;
		        	}
	        		break;
        			case 270:
	        		if(y2<y1){
	        		//左转
	        			guide = 1;
	        			guidepath.add(guide);
	        			continue;
	        		}
	        		//右转
	        		if(y2<y1){
	        			guide =3;
	        			guidepath.add(guide);
	        			continue;
	        		}
	        		//直行
	        		if(x2<x1){
		        		
		        			guide = 2;
		        			guidepath.add(guide);
		        			continue;
		        	}
	        		//旋转180（基本不存在这种情况  应该只存在路径第一个点）
	        		if(x1>x2){
		        		
		        			guide = 4;
		        			guidepath.add(guide);
		        			continue;
		        	}
	        		break;
	        		//角度情况完毕
        		}
        	}//i==0(第一个点)
        	//最后一个点
        	if(i==pathlist.size()-1){
        		//guidepath.add(pathpathlist.size()-1);
        		break;
        	}
        	if(i>0){
        	//	System.out.println(i);
        		int x1=pathlist.get(i-1)%m;
        		int x2=pathlist.get(i+1)%m;
        		int y1=pathlist.get(i-1)/m;
        		int y2=pathlist.get(i+1)/m;
        		int x0=pathlist.get(i)%m;
        		int y0=pathlist.get(i)/m;
        		//直行
        		if((x0>x1&&x2>x0)||(x1>x0&&x0>x2)||(y2>y0&&y0>y1)||(y2<y0&&y0<y1)){
        			guide=2;
        			guidepath.add(guide);
        			continue;
        		}
        		//左转
        		if((y0<y1&&x2>x0)||(x0>x1&&y2<y0)||(y0>y1&&x2>x0)||(x1>x0&&y2>y0)){
        			guide=1;
        			guidepath.add(guide);
        			continue;
        		}
        		//右转
        		if((y0<y1&&x2>x0)||(x0>x1&&y2<y0)||(y1<y0&&x2<x0)||(x1<x0&&y2>y0)){
        			guide=3;
        			guidepath.add(guide);
        			continue;
        		}
        		
        	}
        }//for循环
     return guidepath;
    }
}

