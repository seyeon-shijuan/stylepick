package dataexpo;

import org.apache.hadoop.io.Text;

public class Airline {
	private int year;
	private int month;
	private int arriveDelayTime;
	private int departureDelayTime;
	private int distance;
	private int airtime; //0728
	private int arriveEarlyTime; //0731
	private int departureEarlyTime; //0731
	private int arriveOnTime; //0731
	private int departureOnTime; //0731
	private boolean arriveDelayAvailable = true;
	private boolean departureDelayAvailable = true;
	private boolean distanceAvailable = true;
	private boolean airtimeAvailable = true; //0728
	private boolean arriveEarlyAvailable =true; //0731
	private boolean departureEarlyAvailable =true; //0731
	private boolean arriveOntimeAvailable = true; //0731
	private boolean departureOntimeAvailable = true; //0731
	
	private String uniqueCarrier;
	public Airline(Text text) {
		try {
			//csv 파일 : ,로 데이터 구분
			String[] columns = text.toString().split(",");
			year = Integer.parseInt(columns[0]); //연도를 숫자로
			month = Integer.parseInt(columns[1]); //월을 숫자로
			uniqueCarrier = columns[8]; //항공사 코드
			if(!columns[15].equals("NA")) {
				//NA : 출발지연 없는 경우
				departureDelayTime = Integer.parseInt(columns[15]);
			} else {
				departureDelayAvailable = false;	
			}
			
			if(!columns[14].equals("NA")) {
				//NA : 도착지연 없는 경우
				arriveDelayTime = Integer.parseInt(columns[14]);
			} else {
				arriveDelayAvailable = false;
			}
			
			if(!columns[18].equals("NA")) {
				//NA : 운항거리 없는 경우 ->해당 플래그를 false로 설정
				distance = Integer.parseInt(columns[18]);
			} else {
				distanceAvailable = false;
			}
			
			//0728 AIRTIME
			if(!columns[12].equals("NA")) {
				//NA : 운항시간 없는 경우 ->해당 플래그를 false로 설정
				airtime = Integer.parseInt(columns[12]);
			} else {
				airtimeAvailable = false;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}// Airline(Text text)
	
	//0731
	public int getArriveEarlyTime() {
		return arriveEarlyTime;
	}

	public int getDepartureEarlyTime() {
		return departureEarlyTime;
	}

	public int getArriveOnTime() {
		return arriveOnTime;
	}

	public int getDepartureOnTime() {
		return departureOnTime;
	}

	public boolean isArriveEarlyAvailable() {
		return arriveEarlyAvailable;
	}

	public boolean isDepartureEarlyAvailable() {
		return departureEarlyAvailable;
	}

	public boolean isArriveOntimeAvailable() {
		return arriveOntimeAvailable;
	}

	public boolean isDepartureOntimeAvailable() {
		return departureOntimeAvailable;
	}

	public int getYear() {
		return year;
	}
	public int getMonth() {
		return month;
	}
	public int getArriveDelayTime() {
		return arriveDelayTime;
	}
	public int getDepartureDelayTime() {
		return departureDelayTime;
	}
	public int getDistance() {
		return distance;
	}
	//0728
	public int getAirtime() {
		return airtime;
	}
	public boolean isArriveDelayAvailable() {
		return arriveDelayAvailable;
	}
	public boolean isDepartureDelayAvailable() {
		return departureDelayAvailable;
	}
	public boolean isDistanceAvailable() {
		return distanceAvailable;
	}
	//0728
	public boolean isAirtimeAvailable() {
		return airtimeAvailable;
	}
	public String getUniqueCarrier() {
		return uniqueCarrier;
	}
	
	
}
