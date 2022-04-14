/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module matrix_7 (
    input clk,
    input rst,
    input [6:0] letter_address,
    output reg data_out
  );
  
  
  
  wire [5-1:0] M_matrix_writer_pixel;
  wire [1-1:0] M_matrix_writer_led;
  reg [1-1:0] M_matrix_writer_update;
  reg [24-1:0] M_matrix_writer_color;
  led_strip_writer_13 matrix_writer (
    .clk(clk),
    .rst(rst),
    .update(M_matrix_writer_update),
    .color(M_matrix_writer_color),
    .pixel(M_matrix_writer_pixel),
    .led(M_matrix_writer_led)
  );
  
  wire [600-1:0] M_white_letters_out;
  reg [5-1:0] M_white_letters_selector;
  white_alphabets_14 white_letters (
    .selector(M_white_letters_selector),
    .out(M_white_letters_out)
  );
  
  always @* begin
    M_white_letters_selector = letter_address;
    M_matrix_writer_update = 1'h1;
    M_matrix_writer_color = M_white_letters_out[(M_matrix_writer_pixel)*24+23-:24];
    data_out = M_matrix_writer_led;
  end
endmodule
