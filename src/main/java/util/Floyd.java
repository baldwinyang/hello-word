package util;
import java.util.ArrayList;
import java.util.List;
public class Floyd {
 
    private static int N = 1000;
    private int[][] dist;
    //顶点i 到 j的最短路径长度，初值是i到j的边的权重
    private int[][] path;
    private List<Integer> result = new ArrayList<Integer>();
 
    public static List<Integer> pathPlan(int begin,int end,int size) {
        Floyd graph = new Floyd(size*size);
        ValueMap maptest=new ValueMap();
        //障碍物
        Integer[] a=new Integer[]{27,28,30,31,33,34,39,40,42,43,45,46,55,63,64,66,67,69,70,75,76,78,79,81,82,90,99,100,102,103,105,106,111,112,114,115,117,118};
        int[][] matrix=maptest.valueMap(size,a);
        graph.findCheapestPath(begin,end,matrix);
        List<Integer> list=graph.result;
        return list;
    }
 
    public  void findCheapestPath(int begin,int end,int[][] matrix){
        floyd(matrix);
        result.add(begin);
        findPath(begin,end);
        result.add(end);
        
    }
 
    public void findPath(int i,int j){
        // 找到路由节点
        int k=path[i][j];
        if(k==-1)
            return;
        // 从i到路由节点进行递归寻找中间节点
        findPath(i,k);
        result.add(k);
        // 从j到路由节点进行递归寻找中间节点
        findPath(k,j);
    }
    public  void floyd(int[][] matrix){
        int size=matrix.length;
        for(int i=0;i< size;i++){
            for(int j=0;j< size;j++){
                path[i][j]=-1;
                dist[i][j]=matrix[i][j];
            }
        }
        for(int k=0;k< size;k++){
            for(int i=0;i< size;i++){
                for(int j=0;j< size;j++){
                    if(dist[i][k]!=N&&
                        dist[k][j]!=N&&
                        dist[i][k]+dist[k][j]< dist[i][j]){
                        // 更新i和j两点间的距离
                        dist[i][j]=dist[i][k]+dist[k][j];
                        // 更新i和j两点间的路由信息
                        path[i][j]=k;
                    }
                }
            }
        }
    }
 
    public Floyd(int size){
        this.path=new int[size][size];
        this.dist=new int[size][size];
    }
}
