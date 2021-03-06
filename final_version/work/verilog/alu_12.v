/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_12 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg zi;
  reg vi;
  reg ni;
  
  wire [16-1:0] M_ad_s;
  wire [1-1:0] M_ad_z;
  wire [1-1:0] M_ad_v;
  wire [1-1:0] M_ad_n;
  reg [16-1:0] M_ad_a;
  reg [16-1:0] M_ad_b;
  reg [6-1:0] M_ad_alufn;
  adder_20 ad (
    .a(M_ad_a),
    .b(M_ad_b),
    .alufn(M_ad_alufn),
    .s(M_ad_s),
    .z(M_ad_z),
    .v(M_ad_v),
    .n(M_ad_n)
  );
  
  wire [16-1:0] M_cmp_s;
  reg [1-1:0] M_cmp_n;
  reg [1-1:0] M_cmp_z;
  reg [1-1:0] M_cmp_v;
  reg [6-1:0] M_cmp_alufn;
  comparator_21 cmp (
    .n(M_cmp_n),
    .z(M_cmp_z),
    .v(M_cmp_v),
    .alufn(M_cmp_alufn),
    .s(M_cmp_s)
  );
  
  wire [16-1:0] M_boole_s;
  reg [16-1:0] M_boole_a;
  reg [16-1:0] M_boole_b;
  reg [6-1:0] M_boole_alufn;
  boolean_22 boole (
    .a(M_boole_a),
    .b(M_boole_b),
    .alufn(M_boole_alufn),
    .s(M_boole_s)
  );
  
  wire [16-1:0] M_shift_s;
  reg [16-1:0] M_shift_a;
  reg [4-1:0] M_shift_b;
  reg [6-1:0] M_shift_alufn;
  shifter_23 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .s(M_shift_s)
  );
  
  wire [16-1:0] M_flipper_s;
  reg [16-1:0] M_flipper_c;
  reg [16-1:0] M_flipper_current_state;
  flip_24 flipper (
    .c(M_flipper_c),
    .current_state(M_flipper_current_state),
    .s(M_flipper_s)
  );
  
  always @* begin
    M_ad_a = a;
    M_ad_b = b;
    M_ad_alufn = alufn;
    zi = M_ad_z;
    vi = M_ad_v;
    ni = M_ad_n;
    z = zi;
    v = vi;
    n = ni;
    M_cmp_alufn = alufn;
    M_cmp_v = vi;
    M_cmp_z = zi;
    M_cmp_n = ni;
    M_boole_alufn = alufn;
    M_boole_a = a;
    M_boole_b = b;
    M_shift_alufn = alufn;
    M_shift_a = a;
    M_shift_b = b[0+3-:4];
    M_flipper_c = a;
    M_flipper_current_state = b;
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = M_ad_s;
      end
      2'h1: begin
        out = M_boole_s;
      end
      2'h2: begin
        out = M_shift_s;
      end
      2'h3: begin
        out = M_cmp_s;
      end
      default: begin
        out = 16'h0000;
      end
    endcase
    if (alufn == 6'h3f) begin
      out = M_flipper_s;
    end
    if (alufn == 6'h02) begin
      out = a * b;
    end
  end
endmodule
