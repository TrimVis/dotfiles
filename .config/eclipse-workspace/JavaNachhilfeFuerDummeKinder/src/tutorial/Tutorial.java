package tutorial;

public class Tutorial {
	
	public static void main(String[] args) {
		//System.out.println("Hello World!");
		
		// Deklaration
		Kreis b ;
		// Deklaration und initialisierung
		Kreis c = new Kreis(20, 10, 2.0);
		Kreis c1 = new Kreis(20, 10, 2.0);
		Kreis c2 = new Kreis(20, 10, 2.0);
		Kreis c3 = new Kreis(20, 10, 2.0);
		Kreis c4 = new Kreis(20, 10, 2.0);
		
		//System.out.println(a.name + ": " + a.getArea(1));
		//System.out.println("kreise: " + c.anzahlInstanzen());
		//System.out.println(a.pi);
		
		
		
		Nummeriert a0 = new Nummeriert();
		Nummeriert a1 = new Nummeriert();
		Nummeriert a2 = new Nummeriert();
		Nummeriert a3 = new Nummeriert();
		Nummeriert a4 = new Nummeriert();
		Nummeriert a5 = new Nummeriert();

		System.out.println(a0.meineID());
		System.out.println(a1.meineID());
		System.out.println(a2.meineID());
		System.out.println(a3.meineID());
		System.out.println(a4.meineID());
		System.out.println(a5.meineID());
	}

}