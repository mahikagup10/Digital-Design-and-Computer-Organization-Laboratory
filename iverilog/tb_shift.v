module testbench();
reg d,clk;
wire Q;
wire [3:0]q;

siso a(d, clk, Q);
sipo b(d, clk, q);

// initial
// begin
// $monitor($time,"d=%b,clk=%b,q=%b",d,clk,Q);
// $monitor($time,"d=%b,clk=%b,q=%b",d,clk,q);
// end
initial
begin
clk=1'b0;
forever #5 clk=~clk;
end
initial
begin
d=1;
#10 d=0;
#10 d=1;
#10 d=0;
#90 $finish;
end 
initial begin $dumpfile("tb_shift.vcd"); 
//$dumpvars(0,testbench);
$dumpvars;
end
endmodule