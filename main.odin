package main 

import "core:fmt"
import "core:os"
import "core:strings"
import "core:math"

main :: proc() {
	//fmt.println(os.args[1:]) // the rest of the arguments
	
	buf: [256]byte
	
	accumulator: i32 = 0
	
	for {
		fmt.print(">> ");
		n, err := os.read(os.stdin, buf[:])
		if err == nil {
			str := strings.trim_space(string(buf[:n]))
			
			if str == "exit" {
				break;
			}
			
			for c in str {
				if c == 'i' {
					accumulator += 1
				}
				
				if c == 'd' {
					accumulator -= 1
				}
				
				if c == 's' {
					accumulator = i32(math.pow(f32(accumulator), 2))
				}
				
				 if c == 'o' {
					fmt.println(accumulator)
				}
				
				if accumulator == -1 || accumulator == 256 {
					accumulator = 0
				}
			}
		}
	}
}