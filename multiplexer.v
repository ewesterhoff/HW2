// Multiplexer circuit

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out, m0, m1, m2, m3, naddr0, naddr1,
    input address0, address1,
    input in0, in1, in2, in3
);
    // define gates with delays
    `define AND and #50
    `define OR or #50
    `define NOT not #50

    wire naddr0, naddr1;
    wire m0,m1,m2,m3;

    `NOT invA(naddr0, address0);
    `NOT invB(naddr1, address1);
    
    `AND andgateA(m0,in0,naddr0,naddr1);
    `AND andgateB(m1,in1,address0,naddr1);
    `AND andgateC(m2,in2,naddr0,address1);
    `AND andgateD(m3,in3,address0,address1);

    `OR orgate(out,m0,m1,m2,m3);
endmodule

