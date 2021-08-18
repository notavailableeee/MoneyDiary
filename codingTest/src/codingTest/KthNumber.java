package codingTest;

import java.util.Arrays;

public class KthNumber {
	
	public static void main(String[] args) {
		int[] array = {1, 5, 2, 6, 3, 7, 4};
		int[][] commands = {
				{2, 5, 3},
				{4, 4, 1},
				{1, 7, 3}
		};
		
		int[] ans = solution(array, commands);
		int[] ret = {5, 6, 3};
		
		boolean ox = true;
		for(int i=0;i<ans.length;i++) {
			
			if(ans[i] != ret[i]) {
				ox = false;
			}
		}
		
		if(ox) {
			System.out.println("o");
		}else {
			System.out.println("x");
		}
	}
	
	

	public static int[] solution(int[] array, int[][] commands) {
        
		int[] answer = new int[commands.length];
		
        for(int i=0;i<commands.length;i++){
        	
            int[] result = Arrays.copyOfRange(array, commands[i][0]-1,commands[i][1]);
            Arrays.sort(result);
            //answer[i] = Arrays.copyOfRange(result, commands[i][2],commands[i][2]+1);
            answer[i] = result[commands[i][2]-1];
        }
        
        
        return answer;
    }
}
