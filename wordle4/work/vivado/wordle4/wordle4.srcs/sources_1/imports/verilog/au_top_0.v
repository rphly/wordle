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
    input e_in,
    input i_in,
    input l_in,
    input n_in,
    input o_in,
    input p_in,
    input s_in,
    input t_in,
    input clear_in,
    input check_in,
    output reg out_bottom_matrix1,
    output reg out_bottom_matrix2,
    output reg out_bottom_matrix3,
    output reg out_bottom_matrix4,
    output reg out_top_matrix1,
    output reg out_top_matrix2,
    output reg out_top_matrix3,
    output reg out_top_matrix4,
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
  wire [1-1:0] M_betaCPU_out_top_matrix1;
  wire [1-1:0] M_betaCPU_out_top_matrix2;
  wire [1-1:0] M_betaCPU_out_top_matrix3;
  wire [1-1:0] M_betaCPU_out_top_matrix4;
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
    .out_top_matrix1(M_betaCPU_out_top_matrix1),
    .out_top_matrix2(M_betaCPU_out_top_matrix2),
    .out_top_matrix3(M_betaCPU_out_top_matrix3),
    .out_top_matrix4(M_betaCPU_out_top_matrix4),
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
    .e(e_in),
    .i(i_in),
    .l(l_in),
    .n(n_in),
    .o(o_in),
    .p(p_in),
    .s(s_in),
    .t(t_in),
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
    M_betaCPU_keyboard_input = M_keyboard_controller_out;
    M_betaCPU_has_keyboard_input = M_keyboard_controller_is_pressed;
    M_betaCPU_panel_input = M_button_panel_controller_out;
    M_betaCPU_has_panel_input = M_button_panel_controller_is_pressed;
    if (M_button_panel_controller_out != 5'h00) begin
      M_panel_debugger_d = M_button_panel_controller_out;
    end
    out_bottom_matrix1 = M_betaCPU_out_bottom_matrix1;
    out_bottom_matrix2 = M_betaCPU_out_bottom_matrix2;
    out_bottom_matrix3 = M_betaCPU_out_bottom_matrix3;
    out_bottom_matrix4 = M_betaCPU_out_bottom_matrix4;
    out_top_matrix1 = M_betaCPU_out_top_matrix1;
    out_top_matrix2 = M_betaCPU_out_top_matrix2;
    out_top_matrix3 = M_betaCPU_out_top_matrix3;
    out_top_matrix4 = M_betaCPU_out_top_matrix4;
    io_led = 24'hffffff;
    usb_tx = usb_rx;
  end
  
  always @(posedge clk) begin
    M_panel_debugger_q <= M_panel_debugger_d;
  end
  
endmodule
