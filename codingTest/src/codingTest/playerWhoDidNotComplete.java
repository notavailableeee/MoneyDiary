package codingTest;

import java.util.*;

public class playerWhoDidNotComplete {

	public static void main(String[] args) {
		
		String[] participant = {"mislav", "stanko", "mislav", "ana"};
		String[] completion = {"stanko", "ana", "mislav"};
		
		String answer = solution(participant, completion);
		System.out.println(answer);
	}


    public static String solution(String[] participant, String[] completion) {
        
    	String answer = "";
    	
        List<String> list = new ArrayList<>(); 
        Collections.addAll(list, participant);
        Collections.sort(list);
        
        List<String> list2 = new ArrayList<>(); 
        Collections.addAll(list2, completion);
        Collections.sort(list2);
        
        for(int i=0;i<list2.size();i++){
            if(!list2.get(i).equals(list.get(i))) {
            	answer = list.get(i);
            	break;
            }
        }
        

    	if(answer=="") {
    				answer = list.get(list.size()-1);
    	}
        
        return answer;
    }
}