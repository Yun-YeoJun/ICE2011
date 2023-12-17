// 12224047 ¿±ø©¡ÿ
module tb_CLA6();
    reg[5:0] in_A, in_B;
    reg c_in, clk, rst;
    wire[5:0] out;
    wire c_out;
    
    CLA6 cla6(out, c_out, in_A, in_B, c_in, clk, rst);
    
    always begin
        #1 clk <= ~clk;
    end
    
    initial begin 
        clk <= 1;
        rst<=1;
        #5.5 rst<=0; c_in<=0;
        #2 rst<=1;in_A <= 6'b001010; in_B <= 6'b001101; // 010111
        #2 in_A <= 6'b000000; in_B <= 6'b000000; // 000000
        #2 in_A <= 6'b101010; in_B <= 6'b010101; // 111111
        #2 in_A <= 6'b111111; in_B <= 6'b111111; // 1 111110
        
        #2 rst<=1;in_A <= 6'b001010; in_B <= 6'b001101; c_in <= 1; // 011000
        #2 in_A <= 6'b000000; in_B <= 6'b000000; // 000001
        #2 in_A <= 6'b101010; in_B <= 6'b010101; // 1 000000
        #2 in_A <= 6'b111111; in_B <= 6'b111111; // 1 111111
    end
    
endmodule