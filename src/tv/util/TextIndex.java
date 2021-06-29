package tv.util;

public class TextIndex 
{
	private String k;
	
	public void setK(String k) 
	{
		this.k = k;
	}

	public String _index(String value)
	{
		if(value == null)
		{
			return value +"...";
		}
		if(k == null)
		{
			k = "";
		}
		int RbodyIndex = value.indexOf(k);
		int RbodylastIndex = value.lastIndexOf(k);
		System.out.print("text" + value);
		System.out.print("text" +k);
		System.out.print("text" +RbodyIndex);
		System.out.print("text" +RbodylastIndex);
			if(RbodyIndex != -1 && value.length() >10 && RbodyIndex + 10 < value.length())
			{	
				if(RbodyIndex == 0 && (value.length()-RbodyIndex) >= 10)
				{
					return value.substring(RbodyIndex, RbodyIndex+9)+"...";
				}
				if(RbodyIndex >= 2 && RbodyIndex > (value.length()-12))
				{
					String value2 = "..."+value.substring(RbodyIndex, RbodyIndex+9)+"...";
					value = value2;
					return value;
				}
				if(RbodyIndex >= 2 && (value.length()-RbodyIndex) >= 10)
				{
					value = ".."+value.substring(RbodyIndex, RbodyIndex+9)+"...";
					return value;
				}
			}else if(value.length() <10)
			{
				return value;
			}else
			{
				return "..." + value.substring((value.length() -9), value.length());
			}
			return value + "...";
	}
	
	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub

	}

}
