/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module pattern_rom_8 (
    input [2:0] addressr,
    input [15:0] addressl,
    output reg [15:0] out
  );
  
  
  
  localparam A = 672'h000100020004000800100020000100020004000800100020000100020004000800100020000100020004000800100020000100020004000800100020000100020004000800100020000100020004000800100020;
  
  always @* begin
    out = A[(addressr)*96+(addressl[0+3-:4])*16+15-:16];
  end
endmodule
