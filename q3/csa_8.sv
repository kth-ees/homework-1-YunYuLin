module csa_8 (
  input logic [7:0] a, b,
  output logic [7:0] sum,
  output logic carry

);
  // …
  // Add your description here

  logic c3;      // carry of low adder to use as 2to1_MUX select
  logic c0, c1;  // carry of two high adder
  logic [3:0] sum0, sum1;
  logic c_inc;   // carry of the high a + high b + 1

  // low 4 bit
  adder_4 lo_add ( .A( a[3:0] ), .B( b[3:0] ), .sum( sum[3:0] ), .carry( c3 ) );

  // high 4 bit, two case
  // ci = 0
  adder_4 hi0_add ( .A( a[7:4] ), .B( b[7:4] ), .sum( sum0[3:0] ), .carry( c0 ) );
  // ci = 1, hi0_add + 1 
  adder_4 hi1_add ( .A( sum0[3:0] ), .B( 4'b0001 ), .sum( sum1[3:0] ), .carry( c_inc ) );
  assign c1 = c0 | c_inc;

  // select
  assign sum[7:4] = c3 ? sum1[3:0] : sum0[3:0];
  assign carry = c3 ? c1 : c0;

  // …
endmodule
