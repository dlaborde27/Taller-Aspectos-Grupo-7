import java.io.File;
import java.util.Calendar;

public aspect Logger {
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    /*pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****:"+cal.getTime());
    }*/
}
