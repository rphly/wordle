/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_8 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] add,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [15:0] twoscomp_b;
  
  reg [15:0] addtemp;
  
  reg [15:0] multemp;
  
  always @* begin
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    add = a;
    if (alufn[0+1-:2] == 2'h2) begin
      add = a * b;
      multemp = a * b;
      z = (multemp == 16'h0000);
      if ((a == 16'h0000) | (b == 16'h0000)) begin
        v = 1'h0;
      end else begin
        if ((multemp / a == b) | (multemp / b == a)) begin
          v = 1'h0;
        end else begin
          v = 1'h1;
        end
      end
      n = multemp[15+0-:1];
    end else begin
      twoscomp_b = b ^ {5'h10{alufn[0+0-:1]}};
      if (alufn[0+0-:1]) begin
        addtemp = a - b;
      end else begin
        addtemp = a + b;
      end
      add = addtemp;
      z = (addtemp == 16'h0000);
      v = (a[15+0-:1] & twoscomp_b[15+0-:1] & !addtemp[15+0-:1]) || (!a[15+0-:1] & !twoscomp_b[15+0-:1] & addtemp[15+0-:1]);
      n = addtemp[15+0-:1];
    end
  end
endmodule
