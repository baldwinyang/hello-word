import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Chinese {
        public static void find_str(String dir,String str) {
            BufferedReader br = null;
            try {
                br = new BufferedReader(new FileReader(dir));
                StringBuffer sb = new StringBuffer();
                while((str = br.readLine()) != null) {
                    sb.append(str);
                }

                String regex = "test";
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(sb);

                int num = 0;
                while(matcher.find()) {
                    num++;
                }

                System.out.println("次数为： " + num);

            } catch (FileNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } finally {
                try {
                    if(null != br) {
                        //关闭资源
                        br.close();
                    }
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

        }

    }
