
// Write code for modules you need here
//and,or,xor,FA,mux2

module and2(input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module or2(input wire i0, i1, output wire o);
  assign o = i0 | i1;
endmodule

module xor2(input wire i0, i1, output wire o);
  assign o = i0 ^ i1;
endmodule


module mux2 (input wire i0, i1, j, output wire o);
  assign o = (j==0)?i0:i1;
endmodule

module full_adder(input wire tx, i0, cin, output wire sum,cout);
//2 xor
//3 and
//2 or
wire t0,t1,t2,t3,t4;

xor2 x1(tx,i0,t0);
xor2 x2(t0,cin,sum);

and2 a1(tx,i0,t1);
and2 a2(tx,cin,t2);
and2 a3(i0,cin,t3);

or2 or_0(t1,t2,t4);
or2 or_1(t3,t4,cout);
	

endmodule

module addsub(input wire addsub,i0,i1,cin, output wire sum,cout);

wire t;
xor2 xor_0(addsub,i1,t);
full_adder fa_0(t,i0,addsub,sum,cout);

endmodule

module alu_slice (input wire [1:0] op, input wire i0, i1,cin, output wire o, cout);

// Declare wires here
//wire tx0,t_fa,t_and,t_or,t_mx0;
//xor2 x0(i0,op[0],tx0);
wire t_as,t_and,t_or,t_mx0;

//full_adder fa0(tx0,i0,op[0],t_fa,cout);
//addsub as(...)
addsub ad_sb(op[0],i0,i1,op[0],t_as,cout);
and2 and_0(i0,i1,t_and);
or2 or_1(i0,i1,t_or);
mux2 mx0(t_and,t_or,op[0],t_mx0);
mux2 mx1(t_mux0,t_as,op[1],o);


// Instantiate modules here


endmodule


module alu (input wire [1:0] op, input wire [15:0] i0, i1, output wire [15:0] o, output wire cout);
wire c[14:0];

/*
alu_slice al_0(op[0],op[1],io[0],i1[0],o[0],c[0]);
alu_slice al_1(c[0],op[1],io[1],i1[1],o[1],c[1]);
alu_slice al_2(c[1],op[1],io[2],i1[2],o[2],c[2]);
alu_slice al_3(c[2],op[1],io[3],i1[3],o[3],c[3]);
alu_slice al_4(c[3],op[1],io[4],i1[4],o[4],c[4]);
alu_slice al_5(c[4],op[1],io[5],i1[5],o[5],c[5]);
alu_slice al_6(c[5],op[1],io[6],i1[6],o[6],c[6]);
alu_slice al_7(c[6],op[1],io[7],i1[7],o[7],c[7]);
alu_slice al_8(c[7],op[1],io[8],i1[8],o[8],c[8]);
alu_slice al_9(c[8],op[1],io[9],i1[9],o[9],c[9]);
alu_slice al_10(c[9],op[1],io[10],i1[10],o[10],c[10]);
alu_slice al_11(c[10],op[1],io[11],i1[11],o[11],c[11]);
alu_slice al_12(c[11],op[1],io[12],i1[12],o[12],c[12]);
alu_slice al_13(c[12],op[1],io[13],i1[13],o[13],c[13]);
alu_slice al_14(c[13],op[1],io[14],i1[14],o[14],c[14]);
alu_slice al_15(c[14],op[1],io[15],i1[15],o[15],cout);
*/

alu_slice al_0(op,i0[0],i1[0],op[0],o[0],c[0]);
alu_slice al_1(op,i0[1],i1[1],c[0],o[1],c[1]);
alu_slice al_2(op,i0[2],i1[2],c[1],o[2],c[2]);
alu_slice al_3(op,i0[3],i1[3],c[2],o[3],c[3]);
alu_slice al_4(op,i0[4],i1[4],c[3],o[4],c[4]);
alu_slice al_5(op,i0[5],i1[5],c[4],o[5],c[5]);
alu_slice al_6(op,i0[6],i1[6],c[5],o[6],c[6]);
alu_slice al_7(op,i0[7],i1[7],c[6],o[7],c[7]);
alu_slice al_8(op,i0[8],i1[8],c[7],o[8],c[8]);
alu_slice al_9(op,i0[9],i1[9],c[8],o[9],c[9]);
alu_slice al_10(op,i0[10],i1[10],c[9],o[10],c[10]);
alu_slice al_11(op,i0[11],i1[11],c[10],o[11],c[11]);
alu_slice al_12(op,i0[12],i1[12],c[11],o[12],c[12]);
alu_slice al_13(op,i0[13],i1[13],c[12],o[13],c[13]);
alu_slice al_14(op,i0[14],i1[14],c[13],o[14],c[14]);
alu_slice al_15(op,i0[15],i1[15],c[14],o[15],cout);


endmodule
