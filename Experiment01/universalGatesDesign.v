// Experiment 01: Basic Gates
// Q2: Universal Gates Implementation Design

// Realizing logic operations using ONLY NAND gates
module universal_nand (
    input a,
    input b,
    output out_not_a,
    output out_and,
    output out_or,
    output out_xor,
    output out_xnor
);

    wire nand_ab;
    wire nand_a_nand_ab;
    wire nand_b_nand_ab;
    
    wire not_a;
    wire not_b;
    wire nor_not_a_not_b;

    // 1. NOT Gate: A' = A NAND A
    assign out_not_a = ~(a & a);

    // 2. AND Gate: AB = (A NAND B) NAND (A NAND B)
    assign nand_ab = ~(a & b);
    assign out_and = ~(nand_ab & nand_ab);

    // 3. OR Gate: A + B = (A NAND A) NAND (B NAND B)
    assign not_a = ~(a & a);
    assign not_b = ~(b & b);
    assign out_or = ~(not_a & not_b);

    // 4. XOR Gate: A ^ B = [A NAND (A NAND B)] NAND [B NAND (A NAND B)]
    assign nand_a_nand_ab = ~(a & nand_ab);
    assign nand_b_nand_ab = ~(b & nand_ab);
    assign out_xor = ~(nand_a_nand_ab & nand_b_nand_ab);

    // 5. XNOR Gate: A ~^ B = [(A NAND A) NAND (B NAND B)] NAND (A NAND B)
    // Note: (A NAND A) NAND (B NAND B) is (A + B)
    // So (A + B) NAND (A NAND B) = A ~^ B
    assign nor_not_a_not_b = ~(not_a & not_b); // (A + B)
    assign out_xnor = ~(nor_not_a_not_b & nand_ab);

endmodule


// Realizing logic operations using ONLY NOR gates
module universal_nor (
    input a,
    input b,
    output out_not_a,
    output out_or,
    output out_and,
    output out_xor,
    output out_xnor
);

    wire nor_ab;
    wire nor_a_nor_ab;
    wire nor_b_nor_ab;
    
    wire not_a;
    wire not_b;
    wire nand_not_a_not_b;

    // 1. NOT Gate: A' = A NOR A
    assign out_not_a = ~(a | a);

    // 2. OR Gate: A + B = (A NOR B) NOR (A NOR B)
    assign nor_ab = ~(a | b);
    assign out_or = ~(nor_ab | nor_ab);

    // 3. AND Gate: AB = (A NOR A) NOR (B NOR B)
    assign not_a = ~(a | a);
    assign not_b = ~(b | b);
    assign out_and = ~(not_a | not_b);

    // 4. XNOR Gate: A ~^ B = [A NOR (A NOR B)] NOR [B NOR (A NOR B)]
    assign nor_a_nor_ab = ~(a | nor_ab);
    assign nor_b_nor_ab = ~(b | nor_ab);
    assign out_xnor = ~(nor_a_nor_ab | nor_b_nor_ab);

    // 5. XOR Gate: A ^ B = [(A NOR A) NOR (B NOR B)] NOR (A NOR B)
    // Note: (A NOR A) NOR (B NOR B) is AB
    // So AB NOR (A NOR B) = A ^ B
    assign nand_not_a_not_b = ~(not_a | not_b); // AB
    assign out_xor = ~(nand_not_a_not_b | nor_ab);

endmodule
