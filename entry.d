import cpu;
import std.stdio;
import std.file;

int main(string[] args){
    char opp,src,dst;
    auto i7 = new cpu(cast(byte [])read(args[1]));
    return i7.run();
}//end main

