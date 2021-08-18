package codingTest;

import java.util.ArrayList;
import java.util.Iterator;

public class pracarrayList {

	public static void main(String[] args) {
		
		int inputNum = 6;
		
		System.out.println(solution(inputNum));
	}

	private static String solution(int num) {
		
		//ArrayList<Integer> arr = new ArrayList<>();
		
		int[][] arr = new int[num][num];
		
		arr[0][0] = 1;
		arr[1][0] = 1;
		arr[1][1] = 1;
		
		for(int i=2;i<num;i++) {
			
			for (int j = 0; j <= i; j++) {
				
				if(j==0 || j==i) {
					arr[i][j] = 1;
				}else{
					arr[i][j] = arr[i-1][j-1] + arr[i-1][j];
				}
				
			}
		}
		
		String answer = "";
		
		for(int i=0;i<num;i++) {
			
			answer += "{";
			for (int j = 0; j <= i; j++) {
				
				if(j
						!=i) {
					answer += arr[i][j] + ",";
				}else {
					answer += arr[i][j];
				}
				
			}
			answer += "}";
		}
		//String answer = arr.toString();
		
		return answer;
	}
}
