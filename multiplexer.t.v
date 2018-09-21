// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
    reg addr0, addr1;
    reg enable;
    reg in0, in1, in2, in3;
    wire out;

    //behavioralMultiplexer mux (out,addr0,addr1,in0,in1,in2,in3);
    structuralMultiplexer mux (out,m0,m1,m2,m3,naddr0,naddr1,addr0,addr1,in0,in1,in2,in3); 

    initial begin
    $dumpfile("mux.vcd");
    $dumpvars();

    $display("IN0 IN1  IN2  IN3 | SE1 SE2 | OUT | Expected Output");
    addr0=0;addr1=0;in0=0;in1=1'bx;in2=1'bx;in3=1'bx; #1000 
    $display("%b    %b    %b    %b  |  %b   %b  |  %b  |  %b  ", in0, in1, in2, in3, addr0, addr1, out, in0);
    addr0=0;addr1=0;in0=1;in1=1'bx;in2=1'bx;in3=1'bx; #1000 
    $display("%b    %b    %b    %b  |  %b   %b  |  %b  |  %b  ", in0, in1, in2, in3, addr0, addr1, out, in0);

    addr0=1;addr1=0;in0=1'bx;in1=0;in2=1'bx;in3=1'bx; #1000 
    $display("%b    %b    %b    %b  |  %b   %b  |  %b  |  %b  ", in0, in1, in2, in3, addr0, addr1, out, in1);
    addr0=1;addr1=0;in0=1'bx;in1=1;in2=1'bx;in3=1'bx; #1000 
    $display("%b    %b    %b    %b  |  %b   %b  |  %b  |  %b  ", in0, in1, in2, in3, addr0, addr1, out, in1);

    addr0=0;addr1=1;in0=1'bx;in1=1'bx;in2=0;in3=1'bx; #1000 
    $display("%b    %b    %b    %b  |  %b   %b  |  %b  |  %b  ", in0, in1, in2, in3, addr0, addr1, out, in2);
    addr0=0;addr1=1;in0=1'bx;in1=1'bx;in2=1;in3=1'bx; #1000 
    $display("%b    %b    %b    %b  |  %b   %b  |  %b  |  %b  ", in0, in1, in2, in3, addr0, addr1, out, in2);

    addr0=1;addr1=1;in0=1'bx;in1=1'bx;in2=1'bx;in3=0; #1000 
    $display("%b    %b    %b    %b  |  %b   %b  |  %b  |  %b  ", in0, in1, in2, in3, addr0, addr1, out, in3);
    addr0=1;addr1=1;in0=1'bx;in1=1'bx;in2=1'bx;in3=1; #1000 
    $display("%b    %b    %b    %b  |  %b   %b  |  %b  |  %b  ", in0, in1, in2, in3, addr0, addr1, out, in3);

    $finish();
    end
endmodule
