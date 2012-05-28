import cpu;
import std.stdio;
import std.file;

int main(string[] args){
    char opp,src,dst;
    if(args.length<2){
    	writefln("Usage: %s <programfile>",args[0]);
	return 1;
    }//end if not enough items
    auto i7 = new cpu(cast(byte [])read(args[1]));
    return i7.run();
}//end main

