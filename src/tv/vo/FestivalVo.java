package tv.vo;

public class FestivalVo 
{
	private int datano;			//������ ��ȣ, �����̸Ӹ�Ű
	private String keyword; 	//���� ����, varchar(250)
	private String startday;	//������� ������, varchar(15)
	private String url;			//Ȩ������ �ּ�, varchar(250)
	
	public int getDatano() {
		return datano;
	}
	public void setDatano(int datano) {
		this.datano = datano;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}
