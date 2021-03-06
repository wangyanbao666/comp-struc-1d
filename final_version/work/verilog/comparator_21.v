/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module comparator_21 (
    input n,
    input z,
    input v,
    input [5:0] alufn,
    output reg [15:0] s
  );
  
  
  
  always @* begin
    
    case (alufn)
      6'h33: begin
        s[0+0-:1] = z;
      end
      6'h35: begin
        s[0+0-:1] = n ^ v;
      end
      6'h37: begin
        s[0+0-:1] = z | (n ^ v);
      end
      default: begin
        s = 16'h0000;
      end
    endcase
  end
endmodule
