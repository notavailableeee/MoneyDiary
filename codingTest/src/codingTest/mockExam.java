package codingTest;
import java.util.*;

public class mockExam {

	public static void main(String[] args) {
		int[] answer = {1,3,2,4,2};
		
		int[] yap = solution(answer);
		
		for(int i=0;i<yap.length;i++) {
			
			System.out.println(yap[i]+1);
			
		}
		
	}
	
	public static int[] solution(int[] answers) { // ������ �� �迭
		
		
		// 수포자 배열
		int[][] suposa = {
		                  {1,2,3,4,5},
		                  {2,1,2,3,2,4,2,5},
		                  {3,3,1,1,2,2,4,4,5,5}
						};
		
		// 정답 Map
		Map<Integer, Integer> answerNums = new HashMap<>();
		int score = 0;
		
		// 첫번째 학생 정답
		for(int i=0;i<answers.length;i++) {
			
			if(answers[i]==suposa[0][i%5]) {
				score += 1;
			}
			
		}
		answerNums.put(0, score);
		score=0;
		
		// 두번째 학생 정답
		for(int i=0;i<answers.length;i++) {
			
			if(answers[i]==suposa[1][i%8]) {
				score += 1;
			}
			
		}
		answerNums.put(1, score);
		score=0;
		
		// 세번째 학생 정답
		for(int i=0;i<answers.length;i++) {
			
			if(answers[i]==suposa[2][i%10]) {
				score += 1;
			}
			
		}
		answerNums.put(2, score);
		score=0;
		
		// 제일 많이 맞춘 학생
		
		// 제일 많이 맞춘 학생의 점수
		int maxScore = Collections.max(answerNums.values());
		// 제일 많이 맞춘 학생 index
		List<Integer> maxStu = new ArrayList<>();
		for(int i=0;i<answerNums.size();i++) {
			
			if(answerNums.get(i)==maxScore) {
				maxStu.add(i);
			}
		}
		
		int[] maxStus = new int[maxStu.size()];
			
		int size=0;

		for(int one : maxStu){

		  maxStus[size++] = one;

		}
		return maxStus;
    }
}
