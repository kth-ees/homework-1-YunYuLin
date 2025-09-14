module mux_16to1 (
  input  logic [15:0] J,
  input  logic [3:0]  s,
  output logic        w
);
  always_comb begin
    w = J[s];
  end
endmodule


module bin2bcd (
  input logic [3:0] binary,
  output logic [3:0] bcd,
  output logic carry
);
  // …
  // Add your description here
  // table
  // carry = 1 for 10..15
  logic [15:0] C  = 16'b1111110000000000;

  // bcd[0] = 1 at all odd inputs 1,3,5,7,9,11,13,15
  logic [15:0] B0 = 16'b1010101010101010;

  // bcd[1] = 1 at 2,3,6,7,12,13
  logic [15:0] B1 = 16'b0011000011001100;

  // bcd[2] = 1 at 4,5,6,7,14,15
  logic [15:0] B2 = 16'b1100000011110000;

  // bcd[3] = 1 at 8,9
  logic [15:0] B3 = 16'b0000001100000000;


  // five 16:1 MUX
  // positional port association: J, s, w 
  mux_16to1 u_c  ( C, binary, carry );
  mux_16to1 u_b0 (B0, binary, bcd[0]);
  mux_16to1 u_b1 (B1, binary, bcd[1]);
  mux_16to1 u_b2 (B2, binary, bcd[2]);
  mux_16to1 u_b3 (B3, binary, bcd[3]);
  // …
endmodule
