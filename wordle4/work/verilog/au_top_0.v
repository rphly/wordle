/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    input usb_rx,
    input write_one_button_in,
    input write_zero_button_in,
    input read_button_in,
    output reg outmatrix0,
    output reg [23:0] io_led,
    output reg usb_tx
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_betaCPU_which_matrix;
  wire [1-1:0] M_betaCPU_which_letter;
  reg [1-1:0] M_betaCPU_write_one_button_in;
  reg [1-1:0] M_betaCPU_write_zero_button_in;
  reg [1-1:0] M_betaCPU_read_button_in;
  beta_2 betaCPU (
    .clk(clk),
    .rst(rst),
    .write_one_button_in(M_betaCPU_write_one_button_in),
    .write_zero_button_in(M_betaCPU_write_zero_button_in),
    .read_button_in(M_betaCPU_read_button_in),
    .which_matrix(M_betaCPU_which_matrix),
    .which_letter(M_betaCPU_which_letter)
  );
  wire [1-1:0] M_read_button_out;
  button_3 read_button (
    .clk(clk),
    .button_input(read_button_in),
    .out(M_read_button_out)
  );
  wire [1-1:0] M_write_zero_button_out;
  button_3 write_zero_button (
    .clk(clk),
    .button_input(write_zero_button_in),
    .out(M_write_zero_button_out)
  );
  wire [1-1:0] M_write_one_button_out;
  button_3 write_one_button (
    .clk(clk),
    .button_input(write_one_button_in),
    .out(M_write_one_button_out)
  );
  reg [0:0] M_read_button_dff_d, M_read_button_dff_q = 1'h0;
  reg [0:0] M_write_one_button_dff_d, M_write_one_button_dff_q = 1'h0;
  reg [0:0] M_write_zero_button_dff_d, M_write_zero_button_dff_q = 1'h0;
  
  wire [5-1:0] M_led_strip_pixel;
  wire [1-1:0] M_led_strip_led;
  reg [1-1:0] M_led_strip_update;
  reg [24-1:0] M_led_strip_color;
  led_strip_writer_4 led_strip (
    .clk(clk),
    .rst(rst),
    .update(M_led_strip_update),
    .color(M_led_strip_color),
    .pixel(M_led_strip_pixel),
    .led(M_led_strip_led)
  );
  
  wire [600-1:0] M_letters_out;
  reg [5-1:0] M_letters_selector;
  white_alphabets_5 letters (
    .selector(M_letters_selector),
    .out(M_letters_out)
  );
  
  always @* begin
    M_write_one_button_dff_d = M_write_one_button_dff_q;
    M_read_button_dff_d = M_read_button_dff_q;
    M_write_zero_button_dff_d = M_write_zero_button_dff_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    io_led = 24'h000000;
    M_betaCPU_write_zero_button_in = M_write_zero_button_out;
    M_betaCPU_write_one_button_in = M_write_one_button_out;
    M_betaCPU_read_button_in = M_read_button_out;
    if (M_read_button_out) begin
      if (M_read_button_dff_q == 1'h1) begin
        M_read_button_dff_d = 1'h0;
      end else begin
        M_read_button_dff_d = 1'h1;
      end
    end
    if (M_read_button_dff_q == 1'h1) begin
      io_led[0+0+0-:1] = 1'h1;
    end
    if (M_write_one_button_out) begin
      if (M_write_one_button_dff_q == 1'h1) begin
        M_write_one_button_dff_d = 1'h0;
      end else begin
        M_write_one_button_dff_d = 1'h1;
      end
    end
    if (M_write_one_button_dff_q == 1'h1) begin
      io_led[0+2+0-:1] = 1'h1;
    end
    if (M_write_zero_button_out) begin
      if (M_write_zero_button_dff_q == 1'h1) begin
        M_write_zero_button_dff_d = 1'h0;
      end else begin
        M_write_zero_button_dff_d = 1'h1;
      end
    end
    if (M_write_zero_button_dff_q == 1'h1) begin
      io_led[0+4+0-:1] = 1'h1;
    end
    M_letters_selector = M_betaCPU_which_letter;
    M_led_strip_update = 1'h1;
    M_led_strip_color = M_letters_out[(M_led_strip_pixel)*24+23-:24];
    outmatrix0 = M_led_strip_led;
    usb_tx = usb_rx;
  end
  
  always @(posedge clk) begin
    M_read_button_dff_q <= M_read_button_dff_d;
    M_write_one_button_dff_q <= M_write_one_button_dff_d;
    M_write_zero_button_dff_q <= M_write_zero_button_dff_d;
  end
  
endmodule
