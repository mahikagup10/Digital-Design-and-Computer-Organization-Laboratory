module dff(i,clk,o);
    input i,clk;
    output o;
    //reg out=0;
    always @ (posedge clk)
    begin
    o<=i;
    end
endmodule 

module siso(i, clk, o);
    input i,clk;
    output o;
    wire q1,q2,q3;
    dff a(i, clk, q1);
    dff b(q1, clk, q2);
    dff c(q2, clk, q3);
    dff d1(q3, clk, o);
endmodule


/*module siso (input wire clk, i, output wire o);

wire [2:0]t;

df df0(clk, i[0], t[0]);
df df1(clk, t[0], t[1]);
df df2(clk, t[1], t[2]);
df df3(clk, t[2], o);

endmodule

module sipo(input wire i,clk,reset output wire [0:3]o)
    dfr d0(clk,reset,i,o[0]);
    dfr d1(clk,reset,o[0],o[1]);
    dfr d2(clk,reset,o[1],o[2]);
    dfr d3(clk,reset,o[2],o[3]);
endmodule




module df (input wire clk, in, output wire out);
  reg df_out;
  always@(posedge clk) df_out <= in;
  assign out = df_out;
endmodule

module dfr (input wire clk, reset, in, output wire out);
    wire reset_, df_in;
    invert invert_0 (reset, reset_);
    and2 and2_0 (in, reset_, df_in);
    df df_0 (clk, df_in, out);
endmodule
*/