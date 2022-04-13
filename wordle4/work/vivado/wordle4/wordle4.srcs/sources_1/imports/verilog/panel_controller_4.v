/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module panel_controller_4 (
    input clk,
    input rst,
    input clear,
    input check,
    output reg is_pressed,
    output reg [4:0] out
  );
  
  
  
  wire [1-1:0] M_clear__out;
  button_10 clear_ (
    .clk(clk),
    .button_input(clear),
    .out(M_clear__out)
  );
  wire [1-1:0] M_check__out;
  button_10 check_ (
    .clk(clk),
    .button_input(check),
    .out(M_check__out)
  );
  
  always @* begin
    if (M_clear__out) begin
      out = 5'h1f;
      is_pressed = 1'h1;
    end else begin
      if (M_check__out) begin
        out = 5'h1e;
        is_pressed = 1'h1;
      end else begin
        out = 5'h00;
        is_pressed = 1'h0;
      end
    end
  end
endmodule
