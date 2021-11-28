using System;
using System.Linq;
					
public static class Program {
	
	static string square = "☐";
	static string snake = "▦";
	static int[] snakeCords = {0, 0};
	static int score = 0;
	static string[,] map = new string[8, 8];
	static string userI = "w";
	static string hunt = "▣";
	static int[] hunterCords = {7, 7};
	static int highscore = 0;
	
	
	public static void Main() {
		startup();
		Console.WriteLine("\nScore: " + score + "\n");
		while (true) {
			string userInput = Console.ReadLine();
			Console.WriteLine("Your input was: " + userInput);
			Game(userInput);
			hunter();
			hunterCheck();
		}
	}
	
	public static void startup() {
		for (int i = 0; i < 8; i++) {
			for (int x = 0; x < 8; x++) {
				map[i, x] = square;
			}
		}
		map[snakeCords[0],snakeCords[1]] = snake;
		map[hunterCords[0], hunterCords[1]] = hunt;
		Console.WriteLine(string.Join("\n", flatten(map)));
	}
	
	public static string[] flatten(string[,] array) {
		string[] answer = new string[8];
		for (int i = 0; i < 8; i++) {
			for (int x = 0; x < 8; x++) {
				answer[i] += array[i, x];
			}
		}
		return answer;
	}
	
	public static void Game(string userInput) {
		string[] hello = {"w", "a", "s", "d"};
		bool testT = false;
		foreach (var item in hello){
      		if (item == userInput){
				testT = true;
        		userI = userInput;
      		}
   		}
		if (testT != true) {
			userInput = userI;
		}
		map[snakeCords[0], snakeCords[1]] = square;
		if (userInput == "w") {
			if (snakeCords[0] > 0) {
				score++;
				snakeCords[0]--;
			} else {	score = 0; snakeCords[0] = 0; snakeCords[1] = 0;	}
		} else if (userInput == "a") {
			if (snakeCords[1] > 0) {
				score++;
				snakeCords[1]--;
			} else {	score = 0; snakeCords[0] = 0; snakeCords[1] = 0;	}
		} else if (userInput == "s") {
			if (snakeCords[0] < 7) {
				score++;
				snakeCords[0]++;
			} else {	score = 0; snakeCords[0] = 0; snakeCords[1] = 0;	}
		} else {
			if (snakeCords[1] < 7) {
				score++;
				snakeCords[1]++;
			} else {	score = 0; snakeCords[0] = 0; snakeCords[1] = 0;	}
		}
		
		map[snakeCords[0], snakeCords[1]] = snake;
	}
	
	public static void hunter() {
		int[] diffC = {snakeCords[0] - hunterCords[0], snakeCords[1] - hunterCords[1]};
		int[] difC = {Math.Abs(diffC[0]), Math.Abs(diffC[1])};
		var max = Math.Max(diffC.Max(), difC.Max());
		map[hunterCords[0], hunterCords[1]] = square;
		
		if (diffC[0] == max) {
			hunterCords[0]++;
		} else if (diffC[1] == max) {
			hunterCords[1]++;
		} else if (difC[0] == max) {
			hunterCords[0]--;
		} else {
			hunterCords[1]--;
		}
		map[hunterCords[0], hunterCords[1]] = hunt;
	}
	
	public static void hunterCheck() {
		if (hunterCords[0] == snakeCords[0] && hunterCords[1] == snakeCords[1]) {
			map[hunterCords[0], hunterCords[1]] = square;
			map[snakeCords[0], snakeCords[1]] = square;
			hunterCords[0] = 7;
			hunterCords[1] = 7;
			snakeCords[0] = 0;
			snakeCords[1] = 0;
			map[hunterCords[0], hunterCords[1]] = hunt;
			map[snakeCords[0], snakeCords[1]] = snake;
			
			if (score > highscore) {
				highscore = score;	
			}
			Console.WriteLine("\n--------------------\nHighScore: " + highscore + "\n");
			score = 0;
		}
		Console.WriteLine(string.Join("\n", flatten(map)));
		Console.WriteLine("\nScore: " + score + "\n");
	}
}
