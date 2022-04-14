/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    input usb_rx,
    input a_in,
    input b_in,
    input r_in,
    input e_in,
    input clear_in,
    input check_in,
    output reg outmatrix1,
    output reg outmatrix2,
    output reg outmatrix3,
    output reg outmatrix4,
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
  wire [16-1:0] M_betaCPU_current_state;
  wire [1-1:0] M_betaCPU_out_bottom_matrix1;
  wire [1-1:0] M_betaCPU_out_bottom_matrix2;
  wire [1-1:0] M_betaCPU_out_bottom_matrix3;
  wire [1-1:0] M_betaCPU_out_bottom_matrix4;
  wire [7-1:0] M_betaCPU_debugger1;
  wire [7-1:0] M_betaCPU_debugger2;
  wire [7-1:0] M_betaCPU_debugger3;
  reg [1-1:0] M_betaCPU_has_keyboard_input;
  reg [5-1:0] M_betaCPU_keyboard_input;
  reg [5-1:0] M_betaCPU_panel_input;
  reg [1-1:0] M_betaCPU_has_panel_input;
  beta_2 betaCPU (
    .clk(clk),
    .rst(rst),
    .has_keyboard_input(M_betaCPU_has_keyboard_input),
    .keyboard_input(M_betaCPU_keyboard_input),
    .panel_input(M_betaCPU_panel_input),
    .has_panel_input(M_betaCPU_has_panel_input),
    .current_state(M_betaCPU_current_state),
    .out_bottom_matrix1(M_betaCPU_out_bottom_matrix1),
    .out_bottom_matrix2(M_betaCPU_out_bottom_matrix2),
    .out_bottom_matrix3(M_betaCPU_out_bottom_matrix3),
    .out_bottom_matrix4(M_betaCPU_out_bottom_matrix4),
    .debugger1(M_betaCPU_debugger1),
    .debugger2(M_betaCPU_debugger2),
    .debugger3(M_betaCPU_debugger3)
  );
  wire [1-1:0] M_keyboard_controller_is_pressed;
  wire [16-1:0] M_keyboard_controller_out;
  buttons_controller_3 keyboard_controller (
    .clk(clk),
    .rst(rst),
    .a(a_in),
    .b(b_in),
    .e(e_in),
    .r(r_in),
    .is_pressed(M_keyboard_controller_is_pressed),
    .out(M_keyboard_controller_out)
  );
  wire [1-1:0] M_button_panel_controller_is_pressed;
  wire [5-1:0] M_button_panel_controller_out;
  panel_controller_4 button_panel_controller (
    .clk(clk),
    .rst(rst),
    .clear(clear_in),
    .check(check_in),
    .is_pressed(M_button_panel_controller_is_pressed),
    .out(M_button_panel_controller_out)
  );
  reg [4:0] M_panel_debugger_d, M_panel_debugger_q = 1'h0;
  
  always @* begin
    M_panel_debugger_d = M_panel_debugger_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    io_led = 24'h000000;
    M_betaCPU_keyboard_input = M_keyboard_controller_out;
    M_betaCPU_has_keyboard_input = M_keyboard_controller_is_pressed;
    M_betaCPU_panel_input = M_button_panel_controller_out;
    M_betaCPU_has_panel_input = M_button_panel_controller_is_pressed;
    if (M_button_panel_controller_out != 5'h00) begin
      M_panel_debugger_d = M_button_panel_controller_out;
    end
    io_led[16+0+5-:6] = M_panel_debugger_q;
    outmatrix1 = M_betaCPU_out_bottom_matrix1;
    outmatrix2 = M_betaCPU_out_bottom_matrix2;
    outmatrix3 = M_betaCPU_out_bottom_matrix3;
    outmatrix4 = M_betaCPU_out_bottom_matrix4;
    io_led[0+0+7-:8] = M_betaCPU_debugger1;
    io_led[8+0+7-:8] = M_betaCPU_debugger2;
    io_led[16+0+7-:8] = M_betaCPU_debugger3;
    usb_tx = usb_rx;
  end
  
  always @(posedge clk) begin
    M_panel_debugger_q <= M_panel_debugger_d;
  end
  
endmodule
