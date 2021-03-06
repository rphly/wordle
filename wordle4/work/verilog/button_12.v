/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module button_12 (
    input clk,
    input button_input,
    output reg out
  );
  
  
  
  wire [1-1:0] M_button_cond_out;
  reg [1-1:0] M_button_cond_in;
  button_conditioner_18 button_cond (
    .clk(clk),
    .in(M_button_cond_in),
    .out(M_button_cond_out)
  );
  
  wire [1-1:0] M_edge_out;
  reg [1-1:0] M_edge_in;
  edge_detector_19 L_edge (
    .clk(clk),
    .in(M_edge_in),
    .out(M_edge_out)
  );
  
  always @* begin
    M_button_cond_in = button_input;
    M_edge_in = M_button_cond_out;
    out = M_edge_out;
  end
endmodule
