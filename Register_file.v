//Mips 32 bit Register File
//@author-> Haitham Mohamed 
//Date: 4/12/2014
//version 1
 

module regFile(clk,regWrite,writeData,rs,rt,writeReg,readata1,readata2);
input clk,regWrite;
input[4:0] rs,rt,writeReg;
input[31:0] writeData;
output[31:0] readata1,readata2;
reg[31:0] readata1,readata2;

/*reg[31:0] zero,at,ra;
reg[31:0] v0,v1;
reg[31:0] a0,a1,a2,a3;
reg[31:0] t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;
reg[31:0] s0,s1,s2,s3,s4,s5,s6,s7;
reg[31:0] gp,sp,fp; */

reg[31:0] reg_file[0:31];

always@(posedge clk) // for writing Register
begin
   if(regWrite)
	begin
		if(writeReg==0)
		   reg_file[0]<=0;                          
		else
		   reg_file[regWrite]<=writeData; 

  	end
end

always@(negedge clk) // for reading 2 registers
begin 
  	 readata1<=reg_file[rs];
  	 readata2<=reg_file[rt];
end

endmodule