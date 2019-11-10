package tutorial;

public class Kreis {
	public static int counter = 0;
	int x;
	public int y;
	public double radius;
	public String name;
	private double pi = 3.1418;
	
	Kreis(int x, int y, double radius) {
		counter++;
		this.x = x;
		this.y = y;
		this.radius = radius;
		this.name = "leererString";
	}
	
	public double getArea(double factor) {
		return factor * pi * (double)radius * (double)radius;
	}
	
	public static int anzahlInstanzen() {
		return counter;
	}
		
}