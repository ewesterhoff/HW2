// Adder circuit

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    output AandB, AxorB, wire0,
    input a, 
    input b, 
    input carryin
);
    // define gates with delays
    `define AND and #50
    `define OR or #50
    `define XOR xor #50

    wire AandB, AxorB, wire0;
    `XOR xorgateA(AxorB,a,b);

    `XOR xorgateB(sum,a,b,carryin);

    `AND andgate(AandB,a,b);
    `AND andgate(wire0,carryin,AxorB);

    `OR orgate(carryout, AandB, wire0);
  
endmodule
