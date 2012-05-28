import cpu;
import std.stdio;
import std.file;

const int MAGIC_HEAD=3;

int main(string[] args){
    byte[] prog;
    if(args.length<2){
    	writefln("Usage: %s <programfile>",args[0]);
	return 1;
    }//end if not enough items
    prog = cast(byte [])read(args[1]);
    auto i7 = new cpu(prog[MAGIC_HEAD..$]);
    return i7.run();
}//end main

