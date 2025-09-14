`timescale 1ns/1ps
module bin2bcd_tb;

  // Testbench signals
  logic [3:0] binary;
  logic [3:0] bcd;
  logic carry;

  // complete your tb
  // DUT
  bin2bcd dut (
    .binary(binary),
    .bcd(bcd),
    .carry(carry)
  );

  initial begin
    for (int i = 0; i < 16; i++) begin
      binary = i[3:0];
      #10;

    end
    $stop;
  end
endmodule
