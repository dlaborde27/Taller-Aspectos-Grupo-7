import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Calendar;

public aspect Logger {
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created **** ");
    }
    
    pointcut realizarTransaccion(): call(* moneyMakeTransaction());
    after() : realizarTransaccion(){
    	try(PrintWriter pw=new PrintWriter(new FileOutputStream(file,true))){
    		pw.println("Transaccion Realizada: "+cal.getTime());
    		System.out.println("****Transaccion Realizada**** "+cal.getTime());
    	}catch(FileNotFoundException e){System.out.println(e.getMessage());}    
    	}
    
    pointcut retirarDinero() : call(* moneyWithdrawal());
    after() : retirarDinero() {
    	try(PrintWriter pw=new PrintWriter(new FileOutputStream(file,true))){
    		pw.println("Retiro Realizado: "+cal.getTime());
    		System.out.println("**** Dinero retirado **** "+cal.getTime());
    	}catch(FileNotFoundException e) {System.out.println(e.getMessage());}
    }
    
   
}
