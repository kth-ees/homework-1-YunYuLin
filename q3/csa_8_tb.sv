module csa_8_tb;

  // Inputs
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] sum;
  logic       carry;

  // check
  logic [8:0] ans;

  // complete
  csa_8 uut(
    .a    (a),
    .b    (b),
    .sum  (sum),
    .carry(carry)  );

  initial begin
    $display(" time  |   a   +   b   | carry  sum  |  ANS");

    // given 7 case
    a = 8'd0;    b = 8'd0;    #1 check_result; // 0, c7 = 0
    a = 8'd2;    b = 8'd3;    #1 check_result; // c3 = 0, c0 = 0, c_inc = 0, c7 = 0
    a = 8'd240;  b = 8'd16;   #1 check_result; // c3 = 0, c0 = 1, c_inc = 0, c7 = 1
    a = 8'd240;  b = 8'd0;    #1 check_result; // c3 = 0, c0 = 0, c_inc = 1, c7 = 0
    a = 8'd15;   b = 8'd17;   #1 check_result; // c3 = 1, c0 = 0, c_inc = 0, c7 = 0
    a = 8'd255;  b = 8'd17;   #1 check_result; // c3 = 1, c0 = 1, c_inc = 0, c7 = 1
    a = 8'd255;  b = 8'd1;    #1 check_result; // c3 = 1, c0 = 0, c_inc = 1, c7 = 1

    // random
    repeat (5) begin
      a = $urandom_range(0, 255);
      b = $urandom_range(0, 255);
      #5 check_result;
    end

    $display("All tests finished.");
    $stop;
  end


  task check_result;
    ans = a + b;
    if ( {carry, sum} !== ans ) begin
      $display("[%0t] ERROR: %0d, %0d => %0b, %0d, should be=%0b %0d",
               $time, a, b, carry, sum, ans[8], ans[7:0]);
    end else begin
      $display("[%0t] PASS : a=%0d b=%0d => %0b, %0d",
               $time, a, b, carry, sum);
    end
  endtask

endmodule
