module df(d,clk,q);
    input d,clk;
    output q;
    reg q=0;
    always @ (negedge clk)
    begin
    q<=d;
end
endmodule 

module siso(d, clk, q);
    input d,clk;
    output q;
    wire q1,q2,q3;
    df a(d, clk, q1);
    df b(q1, clk, q2);
    df c(q2, clk, q3);
    df d1(q3, clk, q);
endmodule

module sipo(d, clk, q);
    input d,clk;
    output [3:0]q;
    
    df aa(d, clk, q[3]);
    df bb(q[3], clk, q[2]);
    df cc(q[2], clk, q[1]);
    df dd(q[1], clk, q[0]);
endmodule


