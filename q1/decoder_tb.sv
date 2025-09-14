`timescale 1ns/1ps

module decoder_tb;

  // Testbench signals
  logic [3:0] binary;
  logic [15:0] one_hot;

  // Instantiate the decoder module
  decoder uut (
    .binary(binary),
    .one_hot(one_hot)
  );

  // Complete your testbench here

  initial begin
    for ( int i = 0 ; i < 16 ; i++) begin
      binary = i[3:0];
      #10;
    end
    $finish;
  end

endmodule
