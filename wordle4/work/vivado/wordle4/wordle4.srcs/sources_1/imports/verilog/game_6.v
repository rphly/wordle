/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_6 (
    input clk,
    input rst,
    input regfile_out_a,
    input regfile_out_b,
    input write_one_in,
    input write_zero_in,
    input read_button_in,
    output reg which_matrix,
    output reg which_letter,
    output reg regfile_we,
    output reg regfile_write_address,
    output reg regfile_ra,
    output reg regfile_rb,
    output reg regfile_data
  );
  
  
  
  localparam IDLE_game_fsm = 3'd0;
  localparam STORE_INPUT_game_fsm = 3'd1;
  localparam UPDATE_MATRIX_game_fsm = 3'd2;
  localparam STORE_ONE_game_fsm = 3'd3;
  localparam STORE_ZERO_game_fsm = 3'd4;
  
  reg [2:0] M_game_fsm_d, M_game_fsm_q = IDLE_game_fsm;
  
  localparam INPUT_CTR = 5'h1c;
  
  localparam INPUT_LETTER_1 = 5'h10;
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    
    regfile_we = 1'h0;
    regfile_write_address = 1'h0;
    regfile_ra = 1'h0;
    regfile_rb = 1'h0;
    regfile_data = 2'h2;
    which_matrix = 1'h0;
    which_letter = 1'h0;
    if (rst) begin
      M_game_fsm_d = IDLE_game_fsm;
    end else begin
      
      case (M_game_fsm_q)
        IDLE_game_fsm: begin
          if (write_zero_in) begin
            M_game_fsm_d = STORE_ZERO_game_fsm;
          end
          if (write_one_in) begin
            M_game_fsm_d = STORE_ONE_game_fsm;
          end
          if (read_button_in) begin
            M_game_fsm_d = UPDATE_MATRIX_game_fsm;
          end
        end
        STORE_ONE_game_fsm: begin
          regfile_we = 1'h1;
          regfile_write_address = 5'h10;
          regfile_ra = 1'h0;
          regfile_rb = 1'h0;
          regfile_data = 1'h1;
          M_game_fsm_d = IDLE_game_fsm;
        end
        STORE_ZERO_game_fsm: begin
          regfile_we = 1'h1;
          regfile_write_address = 5'h10;
          regfile_ra = 1'h0;
          regfile_rb = 1'h0;
          regfile_data = 1'h0;
          M_game_fsm_d = IDLE_game_fsm;
        end
        UPDATE_MATRIX_game_fsm: begin
          regfile_we = 1'h0;
          regfile_ra = 5'h10;
          regfile_rb = 5'h1c;
          which_letter = regfile_out_a;
          which_matrix = regfile_out_b;
          M_game_fsm_d = IDLE_game_fsm;
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
