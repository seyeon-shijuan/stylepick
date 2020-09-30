package stylepick;

import org.apache.hadoop.io.Text;

/*year;month;day;order;country;session ID;page 1 (main category);
 * page 2 (clothing model);colour;location;model photography;price;price 2;page

================================================================
7. PAGE 1 (MAIN CATEGORY) -> concerns the main product category:
1-outer or dress
2-top
3-bottom
4-others
================================================================
9. COLOUR -> colour of product

1-beige
2-black
3-blue
4-brown
5-burgundy
6-gray
7-green
8-navy blue
9-of many colors
10-olive
11-pink
12-red
13-violet
14-white
================================================================
 */
public class VO {
	private int year;
	private int month;
	private int day;
	private int order;
	private int country;
	private int sessionID;
	private int category; //7
	private int clothingmodel;
	private int colour; //9
	private int location;
	private int photography;
	private int priceinUSD;
	private int priceHTA;
	private int page;
	
	public VO(Text text) {
		try {
			//csv 파일 : ,로 데이터 구분
			String[] columns = text.toString().split(";");
			year = Integer.parseInt(columns[0]); //연도를 숫자로
			month = Integer.parseInt(columns[1]); //월을 숫자로
			category = Integer.parseInt(columns[6]); //category를 숫자로
			colour = Integer.parseInt(columns[9]); //colour를 숫자로
		} catch (Exception e) {
			// TODO: handle exception
		}
	}// VO(Text text)
	
	public String getCategory() {
		String str = "";
		switch(category) {
			case 1:
				str="겉옷/원피스";break;
			case 2:
				str="상의";break;
			case 3:
				str="하의";break;
			default :
				str="악세사리";break;
		}
		return str;
	}
	public String getColour() {
		String str = "";
		switch(colour) {
			case 1:
				str="베이지";break;
			case 2:
				str="블랙";break;
			case 3:
				str="블루";break;
			case 4:
				str="브라운";break;
			case 5:
				str="버건디";break;
			case 6:
				str="그레이";break;
			case 7:
				str="그린";break;
			case 8:
				str="네이비";break;
			case 9:
				str="혼합색";break;
			case 10:
				str="쑥색";break;
			case 11:
				str="핑크";break;
			case 12:
				str="레드";break;
			case 13:
				str="보라";break;
			default:
				str="화이트";break;
				
		}
		return str;
	}
	
}
