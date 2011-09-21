import leros.Native;

import com.muvium.MuviumRunnable;

/*
 * Example program for Leros.
 * Just a simple blinking LED.
 * 
 */

public class Blink extends MuviumRunnable {

 
    public void run(){
	for (;;) {
		Native.wr(0, 0);
		for (int i=0; i<255; ++i)
			for (int j=0; j<255; ++j)
				for (int k=0; k<255; ++k)
					for (int l=0; l<255; ++l)
						;
		Native.wr(1, 0);
		for (int i=0; i<255; ++i)
			for (int j=0; j<255; ++j)
				for (int k=0; k<255; ++k)
					for (int l=0; l<255; ++l)
						;
	}
    }
}

 