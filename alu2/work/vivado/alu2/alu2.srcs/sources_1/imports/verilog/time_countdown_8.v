/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module time_countdown_8 (
    input clk,
    input rst,
    input dip,
    output reg [15:0] out
  );
  
  
  
  wire [1-1:0] M_slowclock_value;
  counter_11 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  
  reg [3:0] M_time1_d, M_time1_q = 1'h0;
  
  reg [3:0] M_time2_d, M_time2_q = 2'h2;
  
  reg [3:0] M_time3_d, M_time3_q = 1'h1;
  
  reg [15:0] digit;
  
  always @* begin
    M_time1_d = M_time1_q;
    M_time2_d = M_time2_q;
    M_time3_d = M_time3_q;
    
    digit[0+3-:4] = M_time1_q;
    digit[4+3-:4] = M_time2_q;
    digit[8+3-:4] = M_time3_q;
    digit[12+3-:4] = 4'h0;
    if (digit[0+3-:4] == 1'h0) begin
      if (digit[4+3-:4] == 1'h0) begin
        if (digit[8+3-:4] != 1'h0) begin
          digit[8+3-:4] = digit[8+3-:4] - 1'h1;
          digit[4+3-:4] = 4'h9;
        end
      end else begin
        digit[4+3-:4] = digit[4+3-:4] - 1'h1;
        digit[0+3-:4] = 4'h9;
      end
    end else begin
      digit[0+3-:4] = digit[0+3-:4] - 1'h1;
    end
    if (dip) begin
      digit[0+3-:4] = 4'h0;
      digit[4+3-:4] = 4'h2;
      digit[8+3-:4] = 4'h1;
    end
    M_time1_d = digit[0+3-:4];
    M_time2_d = digit[4+3-:4];
    M_time3_d = digit[8+3-:4];
    out = digit;
  end
  
  always @(posedge M_slowclock_value) begin
    if (rst == 1'b1) begin
      M_time3_q <= 1'h1;
    end else begin
      M_time3_q <= M_time3_d;
    end
  end
  
  
  always @(posedge M_slowclock_value) begin
    if (rst == 1'b1) begin
      M_time2_q <= 2'h2;
    end else begin
      M_time2_q <= M_time2_d;
    end
  end
  
  
  always @(posedge M_slowclock_value) begin
    if (rst == 1'b1) begin
      M_time1_q <= 1'h0;
    end else begin
      M_time1_q <= M_time1_d;
    end
  end
  
endmodule
