// Experiment 03: Combinational Circuits
// Q3B: Custom 3-bit prime detector Design
//
// Detects prime numbers in the range 0 to 7.
// Primes: 2 (010), 3 (011), 5 (101), 7 (111).
//
// Truth Table (Inputs: A, B, C; Output: P):
// A B C | Decimal | Prime? (P)
// ------+---------+-----------
// 0 0 0 |    0    |    0
// 0 0 1 |    1    |    0
// 0 1 0 |    2    |    1
// 0 1 1 |    3    |    1
// 1 0 0 |    4    |    0
// 1 0 1 |    5    |    1
// 1 1 0 |    6    |    0
// 1 1 1 |    7    |    1
//
// K-Map Matrix (A \ BC):
//      00   01   11   10
//   +----+----+----+----+
// 0 |  0 |  0 |  1 |  1 |  (m3, m2)
//   +----+----+----+----+
// 1 |  0 |  1 |  1 |  0 |  (m5, m7)
//   +----+----+----+----+
//
// Groups:
// 1. Group (m3, m7) -> Term: BC
// 2. Group (m2, m3) -> Term: A'B
// 3. Group (m5, m7) -> Term: AC
//
// Minimized Equation: P = BC + A'B + AC

module prime_detector (
    input a, // MSB
    input b,
    input c, // LSB
    output p
);

    // Minimized logic expression
    assign p = (b & c) | (~a & b) | (a & c);

endmodule
