import com.muvium.leros.Native;
import com.muvium.MuviumRunnable;

/*
 * Example program for Leros.
 * Just a simple blinking LED.
 * 
 */

public class Blink extends MuviumRunnable {

 
	private static void delayMs( int milliseconds ){
		for (int i= milliseconds; i != 0; i--)
			 for (int j=100; j != 0; j--);
	}
	
    public void run(){
    	
    	for (;;) {
    		Native.wr(0, 0);
 
    		delayMs( 200 );
    		
     		Native.wr(1, 0);
     		
     		delayMs( 200 );
    		
    		
    	} 
    }
    
}

	
 

 