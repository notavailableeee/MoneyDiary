package codingTest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class lostTrainning {

	public static void main(String[] args) {
		
		int n = 5;
		int[] lost = {1,3};
		int[] reserve = {2,4};
		
		int answer = solution(n, lost, reserve);
		System.out.println(answer);
	}
	
	public static int solution(int n, int[] lost, int[] reserve) {
		// lost int배열 ArrayList 로 바꾸기
		List<Integer> lostStu = new ArrayList<>();
		for(int i=0;i<lost.length;i++) {
			lostStu.add(lost[i]);
		}
		
		// reserve int 배열 ArrayList 로 바꾸기
		List<Integer>  reserveStu = new ArrayList<>();
		for(int i=0;i<reserve.length;i++) {
			reserveStu.add(reserve[i]);
		}

		// 전체 학생 배열
		List<Integer> whole = new ArrayList<>();
		for(int i=0;i<n;i++) {
			
			whole.add(i+1);
		}
		
		// 수업참여가 가능한 학생 answer
        int answer = 0;
        
        // lost, reserve 에 속해 있지 않은 학생은 수업 참여 가능
        //answer += n - lostStu.size() - reserveStu.size();
        for(int i=0;i<lostStu.size();i++) {
        	
        	if(whole.contains((Object)lostStu.get(i))) {
        		
        		whole.remove((Object)lostStu.get(i));
        	}
        }
        for(int i=0;i<reserveStu.size();i++) {
        	
        	if(whole.contains((Object)reserveStu.get(i))) {
        		
        		whole.remove((Object)reserveStu.get(i));
        	}
        }
        answer += whole.size();
        //System.out.println(answer);
        /*
        if(answer<0) {
        	answer = 0;
        }
        */
		// reserve 학생 중 lost 학생 제거 
		for(int i=0;i<lostStu.size();i++) {
			
			if(reserveStu.contains(lostStu.get(i))) {
				
				reserveStu.remove((Object)lostStu.get(i));
				lostStu.remove(i);
				answer+=1;
			}
		}
		//System.out.println(answer);
        // 체육복 여분이 있는 학생은 수업 참여 가능
        answer += reserveStu.size();
        // 체육복을 빌릴 수 있는 학생 찾기
        for(int i=0;i<lostStu.size();i++) {
        	
        	if(reserveStu.contains((lostStu.get(i)-1))) {
                //System.out.println(lostStu.get(i));

        		answer += 1;
        		reserveStu.remove((Object)(lostStu.get(i)-1));
        		lostStu.remove(i);
        		i--;
        	}else if(reserveStu.contains((lostStu.get(i)+1))) {
        		//System.out.println(lostStu.get(i));
        		answer += 1;
        		reserveStu.remove((Object)(lostStu.get(i)+1));
        		lostStu.remove(i);
        		i--;
        	}
        }
		/*
		 * for(int i=0;i<lostStu.size();i++) {
		 * 
		 * 
		 * }
		 */
        //System.out.println(answer);
        return answer;
    }
}
