package tutorial;

public class Nummeriert {
	static int counter = 1;
	public int meineID;
	
	Nummeriert() {
		meineID = counter;
		counter++;
	}
	
	public int meineID() {
		return meineID;
	}
}