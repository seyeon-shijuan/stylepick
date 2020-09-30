package stylepick;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.FileAlreadyExistsException;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

/**
 * Servlet implementation class CarrServlet
 */
@WebServlet("/StylepickServlet")
public class StylepickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StylepickServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html); charset=UTF-8");
		String year = request.getParameter("year");
		String kbn = request.getParameter("kbn");
		//String input = "D:/test/"+year+".csv";
		String input = "C:/Users/SEYEON/UbuntuShare/"+year+".csv";
		String output = request.getSession().getServletContext().getRealPath("/") + "output/carrdelay/" + year+"_"+kbn;
		System.out.println(output);
		Configuration conf = new Configuration();
		try {
			Job job = new Job(conf,"StylepickServlet");
			job.setJarByClass(this.getClass());
			//클릭한 select의 value가 a인경우 CategoryMapper로 연결
			if(kbn.equals("a")) {
				job.setMapperClass(CategoryMapper.class);
			} else { //클릭한 select value가 a가 아닌경우 -> b인경우 ColourMapper로 연결
				job.setMapperClass(ColourMapper.class);
			}
			job.setReducerClass(SalesCountReducer.class); //리듀서 설정
			job.setInputFormatClass(TextInputFormat.class);
			job.setOutputFormatClass(TextOutputFormat.class);
			job.setOutputKeyClass(Text.class);
			job.setOutputValueClass(IntWritable.class); //매출 건수 cnt니까 Integer
			FileInputFormat.addInputPath(job, new Path(input));
			FileOutputFormat.setOutputPath(job, new Path(output));
			job.waitForCompletion(true);
		} catch (FileAlreadyExistsException e) {
			System.out.println("기존파일존재"+output);
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		String file = "part-r-00000";
		request.setAttribute("file", year);
		//읽을 파일 경로 설정이 outFile에 된다.
		Path outFile = new Path(output + "/" + file);
		FileSystem fs = FileSystem.get(conf);
		//BufferedReader로 outFile을 읽어낸다.
		BufferedReader br= new BufferedReader(new InputStreamReader(fs.open(outFile)));
		Map<String,Integer> map = new TreeMap<String, Integer>();
		String line = null; 
		while((line = br.readLine()) != null) {
			//v[0] : key
			//v[1] : value(몇 건)
			String[] v = line.split("\t"); //key value으로 들어온다. 그리고 이거를 \t 탭을 기준으로 잘라서 array로 담는다.
			map.put(v[0].trim(), Integer.parseInt(v[1].trim()));
		}//while
		request.setAttribute("map", map); //map 객체로 전달
		System.out.println(map);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/salesanalysis.shop");
		//dispatcher에 jsp 파일의 경로를 설정하고, forward해서 데이터를 물고 넘어간다.
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
