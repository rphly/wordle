/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module regfile_tester_3 (
    input clk,
    input rst,
    output reg [15:0] out
  );
  
  
  
  wire [16-1:0] M_r_out_a;
  wire [16-1:0] M_r_out_b;
  reg [5-1:0] M_r_write_address;
  reg [1-1:0] M_r_we;
  reg [16-1:0] M_r_data;
  reg [5-1:0] M_r_read_address_a;
  reg [5-1:0] M_r_read_address_b;
  regfile_8 r (
    .clk(clk),
    .rst(rst),
    .write_address(M_r_write_address),
    .we(M_r_we),
    .data(M_r_data),
    .read_address_a(M_r_read_address_a),
    .read_address_b(M_r_read_address_b),
    .out_a(M_r_out_a),
    .out_b(M_r_out_b)
  );
  
  localparam INPUT_CTR = 5'h1c;
  
  localparam INPUT_LETTER_1 = 5'h10;
  
  always @* begin
    M_r_we = 1'h0;
    M_r_write_address = 5'h00;
    M_r_read_address_a = 5'h10;
    M_r_read_address_b = 5'h00;
    M_r_data = 16'h0000;
    out = M_r_out_a;
  end
endmodule