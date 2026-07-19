// Experiment 03: Combinational Circuits
// Q3A: K-Map Minimization implementation
//
// Minimizing the 4-variable function:
// F(A, B, C, D) = Sum m(0, 2, 5, 7, 8, 10, 13, 15)
//
// Truth Table:
// A B C D | F
// ---------+--
// 0 0 0 0 | 1 (m0)
// 0 0 0 1 | 0 (m1)
// 0 0 1 0 | 1 (m2)
// 0 0 1 1 | 0 (m3)
// 0 1 0 0 | 0 (m4)
// 0 1 0 1 | 1 (m5)
// 0 1 1 0 | 0 (m6)
// 0 1 1 1 | 1 (m7)
// 1 0 0 0 | 1 (m8)
// 1 0 0 1 | 0 (m9)
// 1 0 1 0 | 1 (m10)
// 1 0 1 1 | 0 (m11)
// 1 1 0 0 | 0 (m12)
// 1 1 0 1 | 1 (m13)
// 1 1 1 0 | 0 (m14)
// 1 1 1 1 | 1 (m15)
//
// K-Map Matrix (AB \ CD):
//       00   01   11   10
//    +----+----+----+----+
// 00 |  1 |  0 |  0 |  1 |   <-- Corners (m0, m2)
//    +----+----+----+----+
// 01 |  0 |  1 |  1 |  0 |   <-- Center (m5, m7)
//    +----+----+----+----+
// 11 |  0 |  1 |  1 |  0 |   <-- Center (m13, m15)
//    +----+----+----+----+
// 10 |  1 |  0 |  0 |  1 |   <-- Corners (m8, m10)
//    +----+----+----+----+
//
// Groups:
// 1. Four Corners (m0, m2, m8, m10) -> Term: B'D'
// 2. Middle 2x2 Block (m5, m7, m13, m15) -> Term: BD
//
// Minimized Equation: F = B'D' + BD = B XNOR D (B ~^ D)

module kmap_minimization (
    input a,
    input b,
    input c,
    input d,
    output f
);

    // Minimized logic expression
    assign f = (~b & ~d) | (b & d);

endmodule
