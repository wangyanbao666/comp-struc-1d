/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boolean_21 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] s
  );
  
  
  
  always @* begin
    
    case (alufn[0+3-:4])
      4'h8: begin
        s = a & b;
      end
      4'he: begin
        s = a | b;
      end
      4'h6: begin
        s = a ^ b;
      end
      4'ha: begin
        s = a;
      end
      default: begin
        s = a;
      end
    endcase
  end
endmodule