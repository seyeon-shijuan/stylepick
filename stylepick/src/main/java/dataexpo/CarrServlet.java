package dataexpo;

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
@WebServlet("/CarrServlet")
public class CarrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarrServlet() {
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
		//String input = "d:/ubuntushare/dataexpo/" + year + ".csv";
		String input = "D:/test/"+year+".csv";
		String output = request.getSession().getServletContext().getRealPath("/") + "output/carrdelay/" + year+"_"+kbn;
		System.out.println(output);
		Configuration conf = new Configuration();
		try {
			Job job = new Job(conf,"CarrServlet");
			job.setJarByClass(this.getClass());
			//클릭한 select의 value가 a인경우 Arrival
			if(kbn.equals("a")) {
				job.setMapperClass(CarrArrivalDelayMapper.class);
			} else { //클릭한 select value가 a가 아닌경우 Departure
				job.setMapperClass(CarrDepartureDelayMapper.class);
			}
			job.setReducerClass(DelayCountReducer.class); //리듀서는 처음거랑 같이 써도됨
			job.setInputFormatClass(TextInputFormat.class);
			job.setOutputFormatClass(TextOutputFormat.class);
			job.setOutputKeyClass(Text.class);
			job.setOutputValueClass(IntWritable.class); //지연건수 cnt니까 Integer
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
		//트리맵이면 정렬을 한다. 그런데 String type으로 정렬이된다. 1988-01 12 되는데 Date대로 정렬이 안된다. 하기는 월로 정렬하는 람다식
		Map<String,Integer> map = new TreeMap<String, Integer>(); //정렬 불요
		String line = null; 
		while((line = br.readLine()) != null) {
			//v[0] : 1988-1,          >이게 항공사명 UniqueCarrier
			//v[1] : 197610          >이게 밸류 (몇 건)
			String[] v = line.split("\t"); //1988-1 198610으로 들어온다. 그리고 이거를 \t 탭을 기준으로 잘라서 array로 담는다.
			map.put(v[0].trim(), Integer.parseInt(v[1].trim()));
		}//while
		System.out.println(map);
		request.setAttribute("map", map); //map 객체로 전달
		String view = request.getParameter("view");
		if(view == null) view="2";
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/dataexpo2.shop");
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
