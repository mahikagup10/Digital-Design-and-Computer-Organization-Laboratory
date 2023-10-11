//one register with 16 instances of d flip flop
module dfrl_16(input wire clk,rst,load,input wire[15:0]i,output wire [15:0]out); 

dfrl f0(clk,rst,load,i[0],out[0]);
dfrl f1(clk,rst,load,i[1],out[1]);
dfrl f2(clk,rst,load,i[2],out[2]);
dfrl f3(clk,rst,load,i[3],out[3]);
dfrl f4(clk,rst,load,i[4],out[4]);
dfrl f5(clk,rst,load,i[5],out[5]);
dfrl f6(clk,rst,load,i[6],out[6]);
dfrl f7(clk,rst,load,i[7],out[7]);
dfrl f8(clk,rst,load,i[8],out[8]);
dfrl f9(clk,rst,load,i[9],out[9]);
dfrl f10(clk,rst,load,i[10],out[10]);
dfrl f11(clk,rst,load,i[11],out[11]);
dfrl f12(clk,rst,load,i[12],out[12]);
dfrl f13(clk,rst,load,i[13],out[13]);
dfrl f14(clk,rst,load,i[14],out[14]);
dfrl f15(clk,rst,load,i[15],out[15]);

endmodule

module mux8_16(input wire [15:0] i0,i1,i2,i3,i4,i5,i6,i7, input wire j0, j1, j2, output wire [15:0] o);

mux8 mux8_0({i0[0],i1[0],i2[0],i3[0],i4[0],i5[0],i6[0],i7[0]},j0,j1,j2, o[0]);
mux8 mux8_1({i0[1],i1[1],i2[1],i3[1],i4[1],i5[1],i6[1],i7[1]},j0,j1,j2, o[1]);
mux8 mux8_2({i0[2],i1[2],i2[2],i3[2],i4[2],i5[2],i6[2],i7[2]},j0,j1,j2, o[2]);
mux8 mux8_3({i0[3],i1[3],i2[3],i3[3],i4[3],i5[3],i6[3],i7[3]},j0,j1,j2, o[3]);
mux8 mux8_4({i0[4],i1[4],i2[4],i3[4],i4[4],i5[4],i6[4],i7[4]},j0,j1,j2, o[4]);
mux8 mux8_5({i0[5],i1[5],i2[5],i3[5],i4[5],i5[5],i6[5],i7[5]},j0,j1,j2, o[5]);
mux8 mux8_6({i0[6],i1[6],i2[6],i3[6],i4[6],i5[6],i6[6],i7[6]},j0,j1,j2, o[6]);
mux8 mux8_7({i0[7],i1[7],i2[7],i3[7],i4[7],i5[7],i6[7],i7[7]},j0,j1,j2, o[7]);
mux8 mux8_8({i0[8],i1[8],i2[8],i3[8],i4[8],i5[8],i6[8],i7[8]},j0,j1,j2, o[8]);
mux8 mux8_9({i0[9],i1[9],i2[9],i3[9],i4[9],i5[9],i6[9],i7[9]},j0,j1,j2, o[9]);
mux8 mux8_10({i0[10],i1[10],i2[10],i3[10],i4[10],i5[10],i6[10],i7[10]},j0,j1,j2, o[10]);
mux8 mux8_11({i0[11],i1[11],i2[11],i3[11],i4[11],i5[11],i6[11],i7[11]},j0,j1,j2, o[11]);
mux8 mux8_12({i0[12],i1[12],i2[12],i3[12],i4[12],i5[12],i6[12],i7[12]},j0,j1,j2, o[12]);
mux8 mux8_13({i0[13],i1[13],i2[13],i3[13],i4[13],i5[13],i6[13],i7[13]},j0,j1,j2, o[13]);
mux8 mux8_14({i0[14],i1[14],i2[14],i3[14],i4[14],i5[14],i6[14],i7[14]},j0,j1,j2, o[14]);
mux8 mux8_15({i0[15],i1[15],i2[15],i3[15],i4[15],i5[15],i6[15],i7[15]},j0,j1,j2, o[15]);

endmodule

module reg_file (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b);

// Declare wires here
wire [0:7] load;
wire [0:15] dout_0,dout_1,dout_2,dout_3,dout_4,dout_5,dout_6,dout_7;

dfrl_16 dfrl_16_0(clk,reset,load[0],d_in,dout_0);
dfrl_16 dfrl_16_1(clk,reset,load[1],d_in,dout_1);
dfrl_16 dfrl_16_2(clk,reset,load[2],d_in,dout_2);
dfrl_16 dfrl_16_3(clk,reset,load[3],d_in,dout_3);
dfrl_16 dfrl_16_4(clk,reset,load[4],d_in,dout_4);
dfrl_16 dfrl_16_5(clk,reset,load[5],d_in,dout_5);
dfrl_16 dfrl_16_6(clk,reset,load[6],d_in,dout_6);
dfrl_16 dfrl_16_7(clk,reset,load[7],d_in,dout_7);

demux8 demux8_0(wr, wr_addr[2], wr_addr[1], wr_addr[0], load);

mux8_16 mux8_16_9(dout_0, dout_1, dout_2, dout_3, dout_4, dout_5, dout_6, dout_7, rd_addr_a[0],rd_addr_a[1], rd_addr_a[2], d_out_a);
mux8_16 mux8_16_10(dout_0, dout_1, dout_2, dout_3, dout_4, dout_5, dout_6, dout_7, rd_addr_b[0], rd_addr_b[1],rd_addr_b[2], d_out_b);  

endmodule






