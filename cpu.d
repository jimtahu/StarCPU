import std.stdio;

class cpu {
private:
    //instruction pointer
     int rip;
    //registers!
    int reg[32];
    //instrcution memory
    byte insts[];
    
public:
    this(byte mem[]){
        this.insts = mem;
    }//end construtor
    
    void add(byte dest, byte src){
	    reg[dest]+=reg[src];
	    writeln("Adding ",src," to ",dest," resuting in ",reg[dest]);
    }//end add

    void mov(byte dest, byte src){
        reg[dest]=reg[src];
        writeln("Moveing ",reg[src]," from ",src," to ",dest);
    }//end move

    void mov_i(byte dest, byte src){
        reg[dest]=src;
        writeln("Moveing ",src," into ",dest);
    }//end move
    
    void process(byte opcode,byte dest, byte src){
	    switch(opcode){
	        case 'X':
	            writeln("End of program");
	            break;
		    case 'a':
		        add(dest,src);
		        break;
		    case 'm':
		        mov(dest,src);
		        break;
		    case 'M':
		        mov_i(dest,src);
		        break;
		    default:
            	writef("Invailid opcode %x\n",cast(int)opcode);
	    }//end of opcode switch
	    return;
    }//end process
  
    int run(){
        rip=0;
        while(rip<insts.length){
            writef("%x: ",rip);
            process(insts[rip],insts[rip+1],insts[rip+2]);
            rip+=4;
        }//program done!
        return reg[0];
    }//end run
}//end class core

unittest {
    auto i7 = new cpu();
    i7.reg[0] = 0;
    i7.reg[1] = 9;
    i7.mov_i(0,0x7);
    assert(i7.reg[0] == 0x7);
    i7.add(0,1);
    assert(i7.reg[0] == 0x10);
}

