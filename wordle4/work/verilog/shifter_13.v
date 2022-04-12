/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_13 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] shift
  );
  
  
  
  always @* begin
    
    case (alufn[0+3-:4])
      4'h0: begin
        shift = a << b[0+3-:4];
      end
      4'h1: begin
        shift = a >> b[0+3-:4];
      end
      4'h3: begin
        shift = $signed(a) >>> b[0+3-:4];
      end
      default: begin
        shift = 1'h0;
      end
    endcase
  end
endmodule