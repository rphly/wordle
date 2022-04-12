/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module buttons_controller_3 (
    input clk,
    input rst,
    input b,
    input e,
    input a,
    input r,
    output reg is_pressed,
    output reg [15:0] out
  );
  
  
  
  wire [1-1:0] M_b_button_out;
  button_8 b_button (
    .clk(clk),
    .button_input(b),
    .out(M_b_button_out)
  );
  wire [1-1:0] M_e_button_out;
  button_8 e_button (
    .clk(clk),
    .button_input(e),
    .out(M_e_button_out)
  );
  wire [1-1:0] M_a_button_out;
  button_8 a_button (
    .clk(clk),
    .button_input(a),
    .out(M_a_button_out)
  );
  wire [1-1:0] M_r_button_out;
  button_8 r_button (
    .clk(clk),
    .button_input(r),
    .out(M_r_button_out)
  );
  
  always @* begin
    out = 16'h0000;
    is_pressed = 1'h0;
    if (M_b_button_out) begin
      out = 16'h0001;
      is_pressed = 1'h1;
    end
    if (M_e_button_out) begin
      out = 16'h0002;
      is_pressed = 1'h1;
    end
    if (M_a_button_out) begin
      out = 16'h0003;
      is_pressed = 1'h1;
    end
    if (M_r_button_out) begin
      out = 16'h0004;
      is_pressed = 1'h1;
    end
  end
endmodule
