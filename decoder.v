// Decoder circuit

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3, nadd0, nadd1,
    input address0, address1,
    input enable
);
    // define gates with delays
    `define AND and #50
    `define OR or #50
    `define NOT not #50

    wire nadd0;
    wire nadd1;

    `NOT Ainv(nadd0, address0);
    `NOT Binv(nadd1, address1);

    `AND andgateA(out0,nadd0,nadd1,enable);
    `AND andgateB(out1,address0,nadd1,enable);
    `AND andgateC(out2,nadd0,address1,enable);
    `AND andgateD(out3,address0,address1,enable);

endmodule

