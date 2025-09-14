module de_mux_1to16 (
  input  logic      din,
  input  logic [3:0]  s,
  output logic [15:0] w
);
  always_comb begin
    w = '0;
    w[s] = din;
  end
endmodule


module decoder (
  input logic [3:0] binary,
  output logic [15:0] one_hot
);
  // …
  // Add your description here
  // positional port association: din, s, w
  de_mux_1to16 u_de_mux (1, binary, one_hot);
  // …
endmodule
