/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_4 (
    input clk,
    input rst,
    input btn_is_pressed,
    input btn_input,
    output reg outmatrix0
  );
  
  
  
  localparam RESET_TOP_DISPLAY_game_fsm = 4'd0;
  localparam RESET_BOTTOM_DISPLAY_game_fsm = 4'd1;
  localparam SET_INPUT_CTR_TO_0_game_fsm = 4'd2;
  localparam SET_GUESS_CTR_TO_0_game_fsm = 4'd3;
  localparam SET_NUM_CORRECT_INPUTS_TO_0_game_fsm = 4'd4;
  localparam IDLE_game_fsm = 4'd5;
  localparam CLEAR_SET_INPUT_CTR_1_game_fsm = 4'd6;
  localparam CLEAR_RESET_BOTTOM_DISPLAY_game_fsm = 4'd7;
  localparam STORE_INPUT_game_fsm = 4'd8;
  localparam INCREMENT_INPUT_CTR_game_fsm = 4'd9;
  localparam PRINT_LETTER_TO_MATRIX_game_fsm = 4'd10;
  
  reg [3:0] M_game_fsm_d, M_game_fsm_q = RESET_TOP_DISPLAY_game_fsm;
  wire [16-1:0] M_rf_out_a;
  wire [16-1:0] M_rf_out_b;
  reg [5-1:0] M_rf_write_address;
  reg [1-1:0] M_rf_we;
  reg [16-1:0] M_rf_data;
  reg [5-1:0] M_rf_read_address_a;
  reg [5-1:0] M_rf_read_address_b;
  regfile_7 rf (
    .clk(clk),
    .rst(rst),
    .write_address(M_rf_write_address),
    .we(M_rf_we),
    .data(M_rf_data),
    .read_address_a(M_rf_read_address_a),
    .read_address_b(M_rf_read_address_b),
    .out_a(M_rf_out_a),
    .out_b(M_rf_out_b)
  );
  
  localparam INPUT_CTR = 14'h2b5c;
  
  localparam INPUT_LETTER_1 = 5'h10;
  
  wire [5-1:0] M_matrix0_pixel;
  wire [1-1:0] M_matrix0_led;
  reg [1-1:0] M_matrix0_update;
  reg [24-1:0] M_matrix0_color;
  led_strip_writer_8 matrix0 (
    .clk(clk),
    .rst(rst),
    .update(M_matrix0_update),
    .color(M_matrix0_color),
    .pixel(M_matrix0_pixel),
    .led(M_matrix0_led)
  );
  
  wire [600-1:0] M_white_letters_out;
  reg [2-1:0] M_white_letters_selector;
  white_alphabets_9 white_letters (
    .selector(M_white_letters_selector),
    .out(M_white_letters_out)
  );
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    
    M_rf_we = 1'h0;
    M_rf_read_address_a = 5'h00;
    M_rf_read_address_b = 5'h00;
    M_rf_data = 16'h0000;
    M_rf_write_address = 5'h00;
    M_white_letters_selector = 1'h0;
    M_matrix0_update = 1'h0;
    M_matrix0_color = 1'h0;
    outmatrix0 = 1'h0;
    if (rst) begin
      M_game_fsm_d = RESET_TOP_DISPLAY_game_fsm;
    end else begin
      
      case (M_game_fsm_q)
        RESET_TOP_DISPLAY_game_fsm: begin
          M_game_fsm_d = RESET_BOTTOM_DISPLAY_game_fsm;
        end
        RESET_BOTTOM_DISPLAY_game_fsm: begin
          M_game_fsm_d = SET_INPUT_CTR_TO_0_game_fsm;
        end
        SET_INPUT_CTR_TO_0_game_fsm: begin
          M_rf_write_address = 14'h2b5c;
          M_rf_data = 1'h0;
          M_rf_we = 1'h1;
          M_game_fsm_d = IDLE_game_fsm;
        end
        IDLE_game_fsm: begin
          if (btn_is_pressed) begin
            M_game_fsm_d = STORE_INPUT_game_fsm;
          end
        end
        CLEAR_SET_INPUT_CTR_1_game_fsm: begin
          M_game_fsm_d = CLEAR_RESET_BOTTOM_DISPLAY_game_fsm;
        end
        CLEAR_RESET_BOTTOM_DISPLAY_game_fsm: begin
          M_game_fsm_d = IDLE_game_fsm;
        end
        STORE_INPUT_game_fsm: begin
          M_rf_we = 1'h0;
          M_rf_read_address_a = 14'h2b5c;
          M_rf_write_address = 5'h10 + M_rf_out_a;
          M_rf_data = btn_input;
          M_rf_we = 1'h1;
          M_game_fsm_d = PRINT_LETTER_TO_MATRIX_game_fsm;
        end
        INCREMENT_INPUT_CTR_game_fsm: begin
          M_rf_read_address_a = 14'h2b5c;
          M_rf_write_address = 14'h2b5c;
          M_rf_data = M_rf_out_a + 1'h1;
          M_rf_we = 1'h1;
          M_game_fsm_d = IDLE_game_fsm;
        end
        PRINT_LETTER_TO_MATRIX_game_fsm: begin
          M_rf_we = 1'h0;
          M_rf_read_address_a = 14'h2b5c;
          M_rf_read_address_b = 5'h10 + M_rf_out_a;
          M_white_letters_selector = M_rf_out_b;
          
          case (M_rf_out_a)
            1'h0: begin
              M_matrix0_update = 1'h1;
              M_matrix0_color = M_white_letters_out[(M_matrix0_pixel)*24+23-:24];
              outmatrix0 = M_matrix0_led;
            end
          endcase
          M_game_fsm_d = INCREMENT_INPUT_CTR_game_fsm;
        end
        default: begin
          M_game_fsm_d = IDLE_game_fsm;
        end
      endcase
    end
  end
  
  always @(posedge clk) begin
    M_game_fsm_q <= M_game_fsm_d;
  end
  
endmodule
