// 12224047 ¿±ø©¡ÿ
// `timescale 1ns / 1ps

module CLA6(
    out, c_out,
    in_A, in_B, c_in, clk, rst
    );
    output[5:0] out;
    output c_out;
    input[5:0] in_A, in_B;
    input c_in, clk, rst;
    wire [5:0] a;
    wire [5:0] b;
    wire [5:0] s;
    wire [5:0] p;
    wire [5:0] g;
    wire [6:0] c;
    wire p0c_in;
    wire p1p0c_in, p1g0;
    wire p2g1, p2p1g0, p2p1p0c_in;
    wire p3c3;
    wire p4g3, p4p3c3;
    wire p5g4, p5p4g3, p5p4p3c3;
   
    D_flipflop d_ff0(c[0], c_in, clk, rst);
    
    D_flipflop d_ff1(a[0], in_A[0], clk, rst);
    D_flipflop d_ff2(b[0], in_B[0], clk, rst);
    
    D_flipflop d_ff3(a[1], in_A[1], clk, rst);
    D_flipflop d_ff4(b[1], in_B[1], clk, rst);
    
    D_flipflop d_ff5(a[2], in_A[2], clk, rst);
    D_flipflop d_ff6(b[2], in_B[2], clk, rst);   
     
    D_flipflop d_ff7(a[3], in_A[3], clk, rst);
    D_flipflop d_ff8(b[3], in_B[3], clk, rst);  
    
    D_flipflop d_ff9(a[4], in_A[4], clk, rst);
    D_flipflop d_ff10(b[4], in_B[4], clk, rst);  
    
    D_flipflop d_ff11(a[5], in_A[5], clk, rst);
    D_flipflop d_ff12(b[5], in_B[5], clk, rst);  
    

    or (p[0], a[0], b[0]);
    or (p[1], a[1], b[1]);
    or (p[2], a[2], b[2]);
    or (p[3], a[3], b[3]);
    or (p[4], a[4], b[4]);
    or (p[5], a[5], b[5]);
    
    and (g[0], a[0], b[0]);
    and (g[1], a[1], b[1]);
    and (g[2], a[2], b[2]);
    and (g[3], a[3], b[3]);
    and (g[4], a[4], b[4]);
    and (g[5], a[5], b[5]);
    
    and (p0c_in, p[0], c[0]);
    or (c[1], g[0], p0c_in);
    
    and (p1p0c_in, p[1], p[0], c[0]);
    and (p1g0, p[1], g[0]);
    or (c[2], g[1], p1g0, p1p0c_in);
    
    and (p2g1, p[2], g[1]);
    and (p2p1g0, p[2], g[1], g[0]);
    and (p2p1p0c_in, p[2], p[1], p[0], c[0]);
    or (c[3], g[2], p2g1, p2p1g0, p2p1p0c_in);
    
    and (p3c3, p[3], c[3]);
    or (c[4], g[3], p3c3);
    
    and (p4g3, p[4], g[3]);
    and (p4p3c3, p[4], p[3], c[3]);
    or (c[5], g[4], p4g3, p4p3c3);
    
    and (p5g4, p[5], g[4]);
    and (p5p4g3, p[5], p[4], g[3]);
    and (p5p4p3c3, p[5], p[4], p[3], c[3]);
    or (c[6], g[5], p5g4, p5p4g3, p5p4p3c3);


    xor (s[0], c[0], a[0], b[0]);
    D_flipflop d_ff13(out[0], s[0], clk, rst);
    
    xor (s[1], c[1], a[1], b[1]);
    D_flipflop d_ff14(out[1], s[1], clk, rst);
    
    xor (s[2], c[2], a[2], b[2]);
    D_flipflop d_ff15(out[2], s[2], clk, rst);
    
    xor (s[3], c[3], a[3], b[3]);
    D_flipflop d_ff16(out[3], s[3], clk, rst);
    
    xor (s[4], c[4], a[4], b[4]);
    D_flipflop d_ff17(out[4], s[4], clk, rst);
    
    xor (s[5], c[5], a[5], b[5]);
    D_flipflop d_ff18(out[5], s[5], clk, rst);
    
    D_flipflop d_ff19(c_out, c[6], clk, rst);
    
endmodule

module D_flipflop(Q, D, CLK, CLR_);
    output reg Q;
    input D, CLK, CLR_;
    
    always @(posedge CLK or negedge CLR_)
    begin
    if (CLR_ == 0)
        Q <= 0;
    else
        Q <= D;
    end
endmodule
