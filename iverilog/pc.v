// Write code for modules you need here

// module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);

// // Declare wires here

// // Instantiate modules here

// endmodule


// (1) increment the PC contents by one, (2) add/subtract given value to PC contents.
// The PC register is of length 16-bits. After the reset signal is applied, its
// contents should be zero. Considering the PC module as a black box, it has
// the following inputs: clk, reset, inc, add, sub, offset of which only offset is a
// wire vector of length 16. The only output is pc a 16-bit wire vector of PC
// register contents. The increment and add/subtract operations each take one
// clock cycle, so one or add/subtract operation can be performed every clock
// cycle1
// , as outlined below.
// When inc is high, the increment operation is to be performed. The
// add, sub, offset inputs are ignored and the contents of the PC register are
// simply incremented by one. When add or sub is high, the add or subtract
// operation respectively is performed, during which the value offset is added
// to or subtract from the PC register contents, and the result is stored back
// in the PC register. When inc, add and sub are all low, PC register value
// remains unchanged. It is guaranteed that at most one of inc, add or sub will
// be high in a clock cycle.
// 1Depending upon the inputs received in the current clock cycle, the increment oor
// add/subtract can be performed and made available at the inputs to the PC register in
// the current clock cycle itself. But the contents of the PC register will change only at the
// positive clock edge and so the updated register output will be seen only in the next clock
// cycle but during which the next operation can be computed. In this way one operation
// can be performed every clock cycle.


// Write code for modules you need here
// Write code for modules you need here
module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);
// Declare wires here wire [15:0]cout;
 // InstanJate modules here
slice_0 slice_00(offset[0], inc, sub,add, pc[0],cout[0]);
slice_1 silce_01(offset[1], inc, cout[0],add,pc[1],cout[1]);
slice_1 silce_02(offset[2], inc, cout[1],add,pc[2],cout[2]); 
slice_1 silce_03(offset[3], inc, cout[2],add,pc[3],cout[3]); 
slice_1 silce_04(offset[4], inc, cout[3],add,pc[4],cout[4]); 
slice_1 silce_05(offset[5], inc, cout[4],add,pc[5],cout[5]); 
slice_1 silce_06(offset[6], inc, cout[5],add,pc[6],cout[6]); 
slice_1 silce_07(offset[7], inc, cout[6],add,pc[7],cout[7]); 
slice_1 silce_08(offset[8], inc, cout[7],add,pc[8],cout[8]); 
slice_1 silce_09(offset[9], inc, cout[8],add,pc[9],cout[9]); 
slice_1 silce_01(offset[10], inc, cout[9],add,pc[10],cout[10]); 
slice_1 silce_01(offset[11], inc, cout[10],add,pc[11],cout[11]); 
slice_1 silce_01(offset[12], inc, cout[11],add,pc[12],cout[12]); 
slice_1 silce_01(offset[13], inc, cout[12]],add,pc[13],cout[13]); 
slice_1 silce_01(offset[14], inc, cout[13],add,pc[14],cout[14]); 
slice_1 silce_01(offset[15], inc, cout[14],add,pc[15],cout[15]);
endmodule

module addsub(input wire sub ,pc,i,cin, output wire sum,cout);
wire t;
xor2 xor_0(sub,i,t);
full_adder fa_0(t,pc,sub,sum,cout); 
endmodule

module dfrl (input wire clk, reset, load, in, output wire out); 

wire _in;

mux2 mux2_0(out, in, load, _in);
dfr dfr_1(clk, reset, _in, out); 

endmodule

module slice_0(input wire offset, inc, sub,add, output wire pc,cout); 
wire load,t_or,t_as;
or2 or2_0(offset,inc,t_or);
or3 or3_0(inc,sub,add,load);
//xor2 xor2_0(t_or,sub,t_xor);
addsub addsub_0(sub,pc,t_or,sub,t_as,cout); 
dfrl dfrl_0(clk,reset,load,pc);
endmodule

module slice_1(input wire offset, inc, sub,add, output wire pc,cout); 
wire load,t_and,t_as,t_inc;
invert invert_0(inc,t_inc);
and2 and2_0(offset,t_inc,t_and); 
or3 or3_0(inc,sub,add,load);
addsub addsub_0(sub,pc,t_and,sub,t_as,cout); 
dfrl dfrl_0(clk,reset,load,pc);
endmodule