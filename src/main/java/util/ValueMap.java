/*
 * 走的太久忘了为什么要出发，初始矩阵起始就是表中任意两点之间的距离
 * */
package util;
 

public class ValueMap {
	//障碍物
	//mapsize地图大小     obs_list障碍物列表
	public int[][] valueMap(int mapsize,Integer[] obs_list){
		int N=1000;
		int[][] mapchge = new int[mapsize*mapsize][mapsize*mapsize];
		Double[][] initmap = new Double[mapsize*mapsize][mapsize*mapsize];
		int i,j = 0;
		for(i=0;i<mapsize*mapsize;i++){
			for(j=0;j<mapsize*mapsize;j++){
				if(i<=j){
					double value=(j%mapsize-i%mapsize)*(j%mapsize-i%mapsize)+(j/mapsize-i/mapsize)*(j/mapsize-i/mapsize);
					initmap[i][j]=Math.sqrt(value);
					// 初始化矩阵只有节点为1的节点是跟后文有关系的其他并没有什么关系
					//这个距离为（j%mapsize,j/mapsize）与(i%mapsize,i/mapsize)的距离		
				}
				initmap[j][i]=initmap[i][j];
			}
		}
		//填入后边的变换
		for(i=0;i<mapsize*mapsize;i++){
			for(j=0;j<mapsize*mapsize;j++){

				if(initmap[i][j]==1){
					mapchge[i][j]=1;
				}else{
					mapchge[i][j]=N;
				}

				//i点为障碍点 则有
				if(useLoop(obs_list,i)){
					for(int k=0;k<mapsize*mapsize;k++)
						mapchge[i][k]=N;
				}
				if(useLoop(obs_list,j)){
					for(int k=0;k<mapsize*mapsize;k++)
						mapchge[k][j]=N;
				}
				if(i==j){
					mapchge[i][j]=0;
				}
			}
		}
		return mapchge;
	}
	
	public static boolean useLoop(Integer[] arr,Integer value){
		 
		for(Integer s:arr){
			if(s.equals(value)){
				return true;
			}
		}
		return false;
	}
}
















	/*
	public static void main(String args[]) {
		ValueMap map=new ValueMap();
		//障碍物
		Integer[] a={27,28,30,31,33,34,39,40,42,43,45,46,63,64,66,67,69,70,75,76,78,79,81,82,99,100,102,103,105,106,111,112,114,115,117,118};
		double[][] mapinit = new double[144][144];
		double[][] mapchge = new double[144][144];
		mapinit=map.valueMap(12, a);
		//mapchge=mapinit;
		for(int i=0;i<12*12;i++){
			for(int j=0;j<12*12;j++){

				if(mapinit[i][j]==1){
					mapchge[i][j]=1;
				}else{
					mapchge[i][j]=Double.POSITIVE_INFINITY;
				}

				//i点为障碍点 则有
				if(useLoop(a,i)){
					for(int k=0;k<12*12;k++)
						mapchge[i][k]=Double.POSITIVE_INFINITY;
				}
				if(useLoop(a,j)){
					for(int k=0;k<12*12;k++)
						mapchge[k][j]=Double.POSITIVE_INFINITY;
				}
				if(i==j){
					mapchge[i][j]=0;
				}
			}
		}
		System.out.print(mapchge[27][29]);
/*
		for(int i=0;i<12*12;i++){
			for(int j=0;j<12*12;j++){
				System.out.printf("%12f",mapchge[i][j]);
			}
			System.out.println();
		}
*/	
	/*
	 * 改成函数之后的测试
	 * 数组使用前要初始化 究竟是什么意思？   主函数中的inITmap1并没有初始化
	 * */
	/*
	public static void main(String args[]) {
	
		ValueMap map1=new ValueMap();
		Integer[] a={27,28,30,31,33,34,39,40,42,43,45,46,63,64,66,67,69,70,75,76,78,79,81,82,99,100,102,103,105,106,111,112,114,115,117,118};
		int[][] initmap1=new int[12*12][12*12];
		//initmap1=map1.valueMap(12, a);
		for(int i=0;i<12*12;i++){
			for(int j=0;j<12*12;j++){
				System.out.printf("%12d",map1.valueMap(12,a)[i][j]);
				//System.out.printf("%12d",initmap1[i][j]);
			}
			System.out.println();
		}
	}


}*/

		

