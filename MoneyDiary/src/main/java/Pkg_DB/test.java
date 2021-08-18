package Pkg_DB;

import java.text.DecimalFormat;

public class test {

	public static void main(String[] args) {
		
		//String str = "+10000000";
		
		//DecimalFormat df = new DecimalFormat("###,###,###");
		//System.out.println(df.format(12365498));
		
		double TLTIN = Integer.parseInt("+40000000");
		double TLTOUT = Integer.parseInt("-5588000");
		double TLTPROPERTY = Integer.parseInt("34412000");
		
		double rate = TLTPROPERTY/TLTIN * 100;
		
		System.out.println(rate);
		

	}

}
