/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_6 (
    input clk,
    input rst,
    input [15:0] regfile_out_a,
    input [15:0] regfile_out_b,
    input [4:0] keyboard_input,
    input has_keyboard_input,
    input [4:0] panel_input,
    input has_panel_input,
    input [15:0] alu_out,
    input [19:0] selected_word,
    input [31:0] random_number_out,
    output reg [4:0] which_matrix,
    output reg [4:0] which_letter,
    output reg regfile_we,
    output reg [15:0] regfile_write_address,
    output reg [15:0] regfile_ra,
    output reg [15:0] regfile_rb,
    output reg [15:0] regfile_data,
    output reg [15:0] current_state,
    output reg [5:0] alufn,
    output reg [2:0] asel,
    output reg [2:0] bsel,
    output reg [10:0] words_selector,
    output reg [3:0] bottom_matrix_controller_update,
    output reg [6:0] bottom_matrix1_letter_address,
    output reg [6:0] bottom_matrix2_letter_address,
    output reg [6:0] bottom_matrix3_letter_address,
    output reg [6:0] bottom_matrix4_letter_address,
    output reg [3:0] top_matrix_controller_update,
    output reg [6:0] top_matrix1_letter_address,
    output reg [6:0] top_matrix2_letter_address,
    output reg [6:0] top_matrix3_letter_address,
    output reg [6:0] top_matrix4_letter_address,
    output reg [4:0] g_out,
    output reg next_random_number,
    output reg [19:0] correct_word_out,
    output reg [7:0] debugger1,
    output reg [7:0] debugger2,
    output reg [7:0] debugger3,
    output reg [8:0] correct_word_index
  );
  
  
  
  localparam CHECK_IF_FIRST_INPUT_game_fsm = 6'd0;
  localparam SET_OKA_MODE_TO_ZERO_game_fsm = 6'd1;
  localparam RESET_TOP_DISPLAY_game_fsm = 6'd2;
  localparam RESET_BOTTOM_DISPLAY_game_fsm = 6'd3;
  localparam SET_INPUT_CTR_TO_0_game_fsm = 6'd4;
  localparam SET_GUESS_CTR_TO_0_game_fsm = 6'd5;
  localparam SET_NUM_CORRECT_INPUTS_TO_0_game_fsm = 6'd6;
  localparam IDLE_game_fsm = 6'd7;
  localparam RETRIEVE_INPUT_I_game_fsm = 6'd8;
  localparam RETRIEVE_CORRECT_K_game_fsm = 6'd9;
  localparam COMPARE_INPUT_I_WITH_CORRECT_K_game_fsm = 6'd10;
  localparam COMPARE_K_EQUALS_3_AND_INCREMENT_game_fsm = 6'd11;
  localparam CHECK_BUTTON_PRESSED_game_fsm = 6'd12;
  localparam COMPARE_INPUT_CTR_EQUALS_3_game_fsm = 6'd13;
  localparam COMPARE_INPUT_I_WITH_CORRECT_I_game_fsm = 6'd14;
  localparam CLEAR_RESET_BOTTOM_DISPLAY_game_fsm = 6'd15;
  localparam STORE_INPUT_game_fsm = 6'd16;
  localparam INCREMENT_INPUT_CTR_game_fsm = 6'd17;
  localparam PRINT_LETTER_TO_MATRIX_game_fsm = 6'd18;
  localparam SET_I_TO_ZERO_game_fsm = 6'd19;
  localparam SET_K_TO_ZERO_game_fsm = 6'd20;
  localparam COMPARE_POSITIONS_K_AND_I_game_fsm = 6'd21;
  localparam SET_TEMP_GUESS_G_LETTER_I_ADDR_WHITE_game_fsm = 6'd22;
  localparam SET_TEMP_GUESS_G_LETTER_I_ADDR_GREEN_game_fsm = 6'd23;
  localparam SET_TEMP_GUESS_G_LETTER_I_ADDR_YELLOW_game_fsm = 6'd24;
  localparam SET_WHITE_LETTER_game_fsm = 6'd25;
  localparam SET_GREEN_LETTER_game_fsm = 6'd26;
  localparam SET_YELLOW_LETTER_game_fsm = 6'd27;
  localparam SET_TEMP_COLOURED_LETTER_GREEN_game_fsm = 6'd28;
  localparam SET_TEMP_COLOURED_LETTER_YELLOW_game_fsm = 6'd29;
  localparam SET_TEMP_COLOURED_LETTER_WHITE_game_fsm = 6'd30;
  localparam RESET_NUM_CORRECT_INPUTS_TO_0_game_fsm = 6'd31;
  localparam INCREMENT_K_game_fsm = 6'd32;
  localparam INCREMENT_NUM_CORRECT_game_fsm = 6'd33;
  localparam COMPARE_NUM_CORRECT_EQUALS_3_game_fsm = 6'd34;
  localparam COMPARE_I_EQUALS_3_AND_INCREMENT_game_fsm = 6'd35;
  localparam INCREMENT_GUESS_CTR_game_fsm = 6'd36;
  localparam COMPARE_GUESS_CTR_EQUALS_3_game_fsm = 6'd37;
  localparam SHOW_TOP_DISPLAY_game_fsm = 6'd38;
  localparam SHOW_TOP_DISPLAY_2_game_fsm = 6'd39;
  localparam SHOW_TOP_DISPLAY_3_game_fsm = 6'd40;
  localparam SHOW_TOP_DISPLAY_4_game_fsm = 6'd41;
  localparam SET_CORRECT_WORD_game_fsm = 6'd42;
  localparam SET_CORRECT_WORD_2_game_fsm = 6'd43;
  localparam SET_CORRECT_LETTER_1_game_fsm = 6'd44;
  localparam SET_CORRECT_LETTER_2_game_fsm = 6'd45;
  localparam SET_CORRECT_LETTER_3_game_fsm = 6'd46;
  localparam SET_CORRECT_LETTER_4_game_fsm = 6'd47;
  localparam LOSE_game_fsm = 6'd48;
  localparam WIN_game_fsm = 6'd49;
  
  reg [5:0] M_game_fsm_d, M_game_fsm_q = CHECK_IF_FIRST_INPUT_game_fsm;
  
  localparam INPUT_CTR = 5'h1c;
  
  localparam INPUT_LETTER_1 = 5'h10;
  
  localparam I = 5'h14;
  
  localparam K = 5'h16;
  
  localparam CORRECT_LETTER_1 = 5'h17;
  
  localparam INPUT_I = 5'h1d;
  
  localparam CORRECT_K = 5'h1e;
  
  localparam G = 6'h20;
  
  localparam GUESS_1_LETTER_1 = 7'h40;
  
  localparam GUESS_2_LETTER_1 = 5'h04;
  
  localparam GUESS_3_LETTER_1 = 5'h08;
  
  localparam GUESS_4_LETTER_1 = 5'h0c;
  
  localparam TEMP_GUESS_G_LETTER_I_ADDR = 6'h21;
  
  localparam TEMP_COLOURED_LETTER = 6'h22;
  
  localparam NUM_CORRECT = 5'h1b;
  
  localparam CLEAR_SIGNAL = 5'h1f;
  
  localparam CHECK_SIGNAL = 5'h1e;
  
  localparam RESTART_SIGNAL = 5'h15;
  
  localparam OKA_MODE = 5'h11;
  
  localparam CORRECT_WORD = 6'h23;
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    
    debugger1 = 1'h0;
    debugger2 = 1'h0;
    debugger3 = 1'h0;
    regfile_we = 1'h0;
    regfile_write_address = 1'h0;
    regfile_ra = 1'h0;
    regfile_rb = 1'h0;
    regfile_data = 1'h0;
    which_matrix = 5'h00;
    which_letter = 5'h00;
    current_state = 2'h0;
    alufn = 1'h0;
    asel = 1'h0;
    bsel = 1'h0;
    words_selector = 1'h0;
    g_out = 1'h0;
    next_random_number = 1'h0;
    correct_word_index = 1'h0;
    correct_word_out = 20'h00000;
    bottom_matrix_controller_update = 3'h0;
    bottom_matrix1_letter_address = 5'h00;
    bottom_matrix2_letter_address = 5'h00;
    bottom_matrix3_letter_address = 5'h00;
    bottom_matrix4_letter_address = 5'h00;
    top_matrix_controller_update = 3'h0;
    top_matrix1_letter_address = 5'h00;
    top_matrix2_letter_address = 5'h00;
    top_matrix3_letter_address = 5'h00;
    top_matrix4_letter_address = 5'h00;
    if (rst) begin
      M_game_fsm_d = SET_OKA_MODE_TO_ZERO_game_fsm;
    end else begin
      
      case (M_game_fsm_q)
        SET_OKA_MODE_TO_ZERO_game_fsm: begin
          regfile_write_address = 5'h11;
          regfile_data = 1'h0;
          regfile_we = 1'h1;
          M_game_fsm_d = SET_GUESS_CTR_TO_0_game_fsm;
        end
        SET_GUESS_CTR_TO_0_game_fsm: begin
          regfile_write_address = 6'h20;
          regfile_ra = 1'h0;
          regfile_rb = 1'h0;
          regfile_data = 1'h0;
          regfile_we = 1'h1;
          M_game_fsm_d = RESET_NUM_CORRECT_INPUTS_TO_0_game_fsm;
        end
        RESET_NUM_CORRECT_INPUTS_TO_0_game_fsm: begin
          regfile_write_address = 5'h1b;
          regfile_ra = 1'h0;
          regfile_rb = 1'h0;
          regfile_data = 1'h0;
          regfile_we = 1'h1;
          M_game_fsm_d = RESET_TOP_DISPLAY_game_fsm;
        end
        RESET_TOP_DISPLAY_game_fsm: begin
          M_game_fsm_d = SET_INPUT_CTR_TO_0_game_fsm;
        end
        SET_INPUT_CTR_TO_0_game_fsm: begin
          regfile_we = 1'h1;
          regfile_write_address = 5'h1c;
          regfile_ra = 1'h0;
          regfile_rb = 1'h0;
          regfile_data = 1'h0;
          M_game_fsm_d = RESET_BOTTOM_DISPLAY_game_fsm;
        end
        RESET_BOTTOM_DISPLAY_game_fsm: begin
          bottom_matrix_controller_update = 3'h5;
          bottom_matrix1_letter_address = 5'h00;
          bottom_matrix2_letter_address = 5'h00;
          bottom_matrix3_letter_address = 5'h00;
          bottom_matrix4_letter_address = 5'h00;
          M_game_fsm_d = IDLE_game_fsm;
        end
        IDLE_game_fsm: begin
          current_state = 1'h0;
          regfile_rb = 5'h11;
          next_random_number = 1'h1;
          if (has_panel_input) begin
            if (panel_input == 5'h1f) begin
              M_game_fsm_d = SET_INPUT_CTR_TO_0_game_fsm;
            end else begin
              if (panel_input == 5'h1e) begin
                M_game_fsm_d = CHECK_BUTTON_PRESSED_game_fsm;
              end else begin
                if (panel_input == 5'h15) begin
                  M_game_fsm_d = SET_OKA_MODE_TO_ZERO_game_fsm;
                end else begin
                  if (panel_input == 5'h11) begin
                    regfile_write_address = 5'h11;
                    regfile_data = 1'h1;
                    regfile_we = 1'h1;
                  end
                end
              end
            end
          end else begin
            if (has_keyboard_input) begin
              regfile_we = 1'h1;
              regfile_ra = 5'h1c;
              regfile_write_address = 5'h10 + regfile_out_a;
              regfile_data = keyboard_input;
              M_game_fsm_d = CHECK_IF_FIRST_INPUT_game_fsm;
            end else begin
              M_game_fsm_d = IDLE_game_fsm;
            end
          end
        end
        CHECK_IF_FIRST_INPUT_game_fsm: begin
          regfile_ra = 6'h20;
          regfile_rb = 5'h1c;
          if (regfile_out_a == 1'h0 && regfile_out_b == 1'h0) begin
            M_game_fsm_d = SET_CORRECT_WORD_game_fsm;
          end else begin
            M_game_fsm_d = PRINT_LETTER_TO_MATRIX_game_fsm;
          end
        end
        SET_CORRECT_WORD_game_fsm: begin
          regfile_write_address = 6'h23;
          asel = 3'h6;
          bsel = 3'h7;
          if (alu_out == 2'h1) begin
            regfile_data = random_number_out[0+8-:9] - 8'hce;
          end else begin
            regfile_data = random_number_out[0+8-:9];
          end
          regfile_we = 1'h1;
          regfile_ra = 6'h23;
          correct_word_index = regfile_out_a;
          M_game_fsm_d = SET_CORRECT_LETTER_1_game_fsm;
        end
        SET_CORRECT_LETTER_1_game_fsm: begin
          regfile_ra = 6'h23;
          regfile_write_address = 5'h17;
          words_selector = regfile_out_a;
          regfile_data = selected_word[15+4-:5];
          regfile_we = 1'h1;
          M_game_fsm_d = SET_CORRECT_LETTER_2_game_fsm;
        end
        SET_CORRECT_LETTER_2_game_fsm: begin
          regfile_ra = 6'h23;
          regfile_write_address = 6'h18;
          words_selector = regfile_out_a;
          regfile_data = selected_word[10+4-:5];
          regfile_we = 1'h1;
          M_game_fsm_d = SET_CORRECT_LETTER_3_game_fsm;
        end
        SET_CORRECT_LETTER_3_game_fsm: begin
          regfile_ra = 6'h23;
          regfile_write_address = 6'h19;
          words_selector = regfile_out_a;
          regfile_data = selected_word[5+4-:5];
          regfile_we = 1'h1;
          M_game_fsm_d = SET_CORRECT_LETTER_4_game_fsm;
        end
        SET_CORRECT_LETTER_4_game_fsm: begin
          regfile_ra = 6'h23;
          regfile_write_address = 6'h1a;
          words_selector = regfile_out_a;
          regfile_data = selected_word[0+4-:5];
          regfile_we = 1'h1;
          M_game_fsm_d = PRINT_LETTER_TO_MATRIX_game_fsm;
        end
        PRINT_LETTER_TO_MATRIX_game_fsm: begin
          current_state = 1'h1;
          regfile_we = 1'h0;
          regfile_ra = 5'h1c;
          alufn = 6'h00;
          asel = 3'h0;
          bsel = 3'h6;
          regfile_rb = alu_out;
          
          case (regfile_out_a)
            16'h0000: begin
              bottom_matrix_controller_update = 3'h1;
              bottom_matrix1_letter_address = regfile_out_b;
            end
            16'h0001: begin
              bottom_matrix_controller_update = 3'h2;
              bottom_matrix2_letter_address = regfile_out_b;
            end
            16'h0002: begin
              bottom_matrix_controller_update = 3'h3;
              bottom_matrix3_letter_address = regfile_out_b;
            end
            16'h0003: begin
              bottom_matrix_controller_update = 3'h4;
              bottom_matrix4_letter_address = regfile_out_b;
            end
          endcase
          M_game_fsm_d = INCREMENT_INPUT_CTR_game_fsm;
        end
        INCREMENT_INPUT_CTR_game_fsm: begin
          current_state = 2'h2;
          regfile_ra = 5'h1c;
          asel = 3'h0;
          bsel = 3'h4;
          alufn = 6'h33;
          if (alu_out == 16'h0000) begin
            regfile_write_address = 5'h1c;
            regfile_data = regfile_out_a + 1'h1;
            regfile_we = 1'h1;
            M_game_fsm_d = IDLE_game_fsm;
          end else begin
            M_game_fsm_d = IDLE_game_fsm;
          end
        end
        CHECK_BUTTON_PRESSED_game_fsm: begin
          current_state = 2'h3;
          regfile_ra = 5'h1c;
          asel = 3'h0;
          bsel = 3'h4;
          alufn = 6'h33;
          if (alu_out == 16'h0001) begin
            M_game_fsm_d = SET_I_TO_ZERO_game_fsm;
          end else begin
            M_game_fsm_d = IDLE_game_fsm;
          end
        end
        SET_I_TO_ZERO_game_fsm: begin
          regfile_write_address = 5'h14;
          regfile_ra = 1'h0;
          regfile_rb = 1'h0;
          regfile_data = 1'h0;
          regfile_we = 1'h1;
          M_game_fsm_d = SET_K_TO_ZERO_game_fsm;
        end
        SET_K_TO_ZERO_game_fsm: begin
          regfile_write_address = 5'h16;
          regfile_ra = 1'h0;
          regfile_rb = 1'h0;
          regfile_data = 1'h0;
          regfile_we = 1'h1;
          M_game_fsm_d = RETRIEVE_INPUT_I_game_fsm;
        end
        RETRIEVE_INPUT_I_game_fsm: begin
          regfile_ra = 5'h14;
          regfile_rb = 5'h10 + regfile_out_a;
          regfile_data = regfile_out_b;
          regfile_write_address = 5'h1d;
          regfile_we = 1'h1;
          M_game_fsm_d = RETRIEVE_CORRECT_K_game_fsm;
        end
        RETRIEVE_CORRECT_K_game_fsm: begin
          regfile_write_address = 5'h1e;
          regfile_ra = 5'h16;
          regfile_rb = 5'h17 + regfile_out_a;
          regfile_data = regfile_out_b;
          regfile_we = 1'h1;
          M_game_fsm_d = COMPARE_INPUT_I_WITH_CORRECT_K_game_fsm;
        end
        COMPARE_INPUT_I_WITH_CORRECT_K_game_fsm: begin
          current_state = 3'h4;
          regfile_we = 1'h0;
          regfile_ra = 5'h1d;
          regfile_rb = 5'h1e;
          asel = 3'h0;
          bsel = 3'h0;
          alufn = 6'h33;
          if (alu_out == 1'h1) begin
            M_game_fsm_d = COMPARE_POSITIONS_K_AND_I_game_fsm;
          end else begin
            M_game_fsm_d = SET_TEMP_GUESS_G_LETTER_I_ADDR_WHITE_game_fsm;
          end
        end
        SET_TEMP_GUESS_G_LETTER_I_ADDR_WHITE_game_fsm: begin
          regfile_ra = 6'h20;
          regfile_rb = 5'h14;
          
          case (regfile_out_a)
            1'h0: begin
              regfile_data = 7'h40 + regfile_out_b;
            end
            1'h1: begin
              regfile_data = 5'h04 + regfile_out_b;
            end
            2'h2: begin
              regfile_data = 5'h08 + regfile_out_b;
            end
            2'h3: begin
              regfile_data = 5'h0c + regfile_out_b;
            end
          endcase
          regfile_write_address = 6'h21;
          regfile_we = 1'h1;
          M_game_fsm_d = SET_TEMP_COLOURED_LETTER_WHITE_game_fsm;
        end
        SET_TEMP_COLOURED_LETTER_WHITE_game_fsm: begin
          regfile_ra = 5'h14;
          regfile_rb = 5'h10 + regfile_out_a;
          regfile_write_address = 6'h22;
          regfile_data = 7'h00 + regfile_out_b[0+6-:7];
          regfile_we = 1'h1;
          M_game_fsm_d = SET_WHITE_LETTER_game_fsm;
        end
        SET_WHITE_LETTER_game_fsm: begin
          current_state = 3'h5;
          regfile_ra = 6'h21;
          regfile_rb = 6'h22;
          regfile_write_address = regfile_out_a;
          regfile_data = regfile_out_b;
          regfile_we = 1'h1;
          M_game_fsm_d = COMPARE_K_EQUALS_3_AND_INCREMENT_game_fsm;
        end
        COMPARE_POSITIONS_K_AND_I_game_fsm: begin
          current_state = 3'h6;
          regfile_we = 1'h0;
          regfile_ra = 5'h16;
          regfile_rb = 5'h14;
          asel = 3'h0;
          bsel = 3'h0;
          alufn = 6'h33;
          if (alu_out == 1'h1) begin
            M_game_fsm_d = SET_TEMP_GUESS_G_LETTER_I_ADDR_GREEN_game_fsm;
          end else begin
            M_game_fsm_d = SET_TEMP_GUESS_G_LETTER_I_ADDR_YELLOW_game_fsm;
          end
        end
        SET_TEMP_GUESS_G_LETTER_I_ADDR_GREEN_game_fsm: begin
          regfile_ra = 6'h20;
          regfile_rb = 5'h14;
          
          case (regfile_out_a)
            1'h0: begin
              regfile_data = 7'h40 + regfile_out_b;
            end
            1'h1: begin
              regfile_data = 5'h04 + regfile_out_b;
            end
            2'h2: begin
              regfile_data = 5'h08 + regfile_out_b;
            end
            2'h3: begin
              regfile_data = 5'h0c + regfile_out_b;
            end
          endcase
          regfile_write_address = 6'h21;
          regfile_we = 1'h1;
          M_game_fsm_d = SET_TEMP_COLOURED_LETTER_GREEN_game_fsm;
        end
        SET_TEMP_COLOURED_LETTER_GREEN_game_fsm: begin
          regfile_ra = 5'h14;
          regfile_rb = 5'h10 + regfile_out_a;
          regfile_write_address = 6'h22;
          regfile_data = 7'h20 + regfile_out_b[0+6-:7];
          regfile_we = 1'h1;
          M_game_fsm_d = SET_GREEN_LETTER_game_fsm;
        end
        SET_GREEN_LETTER_game_fsm: begin
          current_state = 3'h7;
          regfile_ra = 6'h21;
          regfile_rb = 6'h22;
          regfile_write_address = regfile_out_a;
          regfile_data = regfile_out_b;
          regfile_we = 1'h1;
          M_game_fsm_d = INCREMENT_NUM_CORRECT_game_fsm;
        end
        INCREMENT_NUM_CORRECT_game_fsm: begin
          regfile_ra = 5'h1b;
          alufn = 6'h00;
          asel = 3'h0;
          bsel = 3'h2;
          regfile_write_address = 5'h1b;
          regfile_data = alu_out;
          regfile_we = 1'h1;
          M_game_fsm_d = COMPARE_NUM_CORRECT_EQUALS_3_game_fsm;
        end
        COMPARE_NUM_CORRECT_EQUALS_3_game_fsm: begin
          regfile_ra = 5'h1b;
          asel = 3'h0;
          bsel = 3'h4;
          alufn = 6'h33;
          if (alu_out == 16'h0000) begin
            M_game_fsm_d = COMPARE_I_EQUALS_3_AND_INCREMENT_game_fsm;
          end else begin
            M_game_fsm_d = WIN_game_fsm;
          end
        end
        SET_TEMP_GUESS_G_LETTER_I_ADDR_YELLOW_game_fsm: begin
          regfile_ra = 6'h20;
          regfile_rb = 5'h14;
          
          case (regfile_out_a)
            1'h0: begin
              regfile_data = 7'h40 + regfile_out_b;
            end
            1'h1: begin
              regfile_data = 5'h04 + regfile_out_b;
            end
            2'h2: begin
              regfile_data = 5'h08 + regfile_out_b;
            end
            2'h3: begin
              regfile_data = 5'h0c + regfile_out_b;
            end
          endcase
          regfile_write_address = 6'h21;
          regfile_we = 1'h1;
          M_game_fsm_d = SET_TEMP_COLOURED_LETTER_YELLOW_game_fsm;
        end
        SET_TEMP_COLOURED_LETTER_YELLOW_game_fsm: begin
          regfile_ra = 5'h14;
          regfile_rb = 5'h10 + regfile_out_a;
          regfile_write_address = 6'h22;
          regfile_data = 7'h40 + regfile_out_b[0+6-:7];
          regfile_we = 1'h1;
          M_game_fsm_d = SET_YELLOW_LETTER_game_fsm;
        end
        SET_YELLOW_LETTER_game_fsm: begin
          regfile_ra = 6'h21;
          regfile_rb = 6'h22;
          regfile_write_address = regfile_out_a;
          regfile_data = regfile_out_b;
          regfile_we = 1'h1;
          M_game_fsm_d = COMPARE_I_EQUALS_3_AND_INCREMENT_game_fsm;
        end
        COMPARE_K_EQUALS_3_AND_INCREMENT_game_fsm: begin
          regfile_ra = 5'h16;
          asel = 3'h0;
          bsel = 3'h4;
          alufn = 6'h33;
          if (alu_out == 16'h0000) begin
            regfile_write_address = 5'h16;
            regfile_data = regfile_out_a + 1'h1;
            regfile_we = 1'h1;
            M_game_fsm_d = RETRIEVE_CORRECT_K_game_fsm;
          end else begin
            M_game_fsm_d = COMPARE_I_EQUALS_3_AND_INCREMENT_game_fsm;
          end
        end
        COMPARE_I_EQUALS_3_AND_INCREMENT_game_fsm: begin
          regfile_ra = 5'h14;
          asel = 3'h0;
          bsel = 3'h4;
          alufn = 6'h33;
          if (alu_out == 16'h0000) begin
            regfile_write_address = 5'h14;
            regfile_data = regfile_out_a + 1'h1;
            regfile_we = 1'h1;
            M_game_fsm_d = SET_K_TO_ZERO_game_fsm;
          end else begin
            M_game_fsm_d = SET_NUM_CORRECT_INPUTS_TO_0_game_fsm;
          end
        end
        SET_NUM_CORRECT_INPUTS_TO_0_game_fsm: begin
          regfile_write_address = 5'h1b;
          regfile_ra = 1'h0;
          regfile_rb = 1'h0;
          regfile_data = 1'h0;
          regfile_we = 1'h1;
          M_game_fsm_d = SHOW_TOP_DISPLAY_game_fsm;
        end
        SHOW_TOP_DISPLAY_game_fsm: begin
          regfile_we = 1'h0;
          regfile_ra = 6'h20;
          
          case (regfile_out_a)
            1'h0: begin
              regfile_rb = 7'h40;
              top_matrix_controller_update = 3'h1;
              top_matrix1_letter_address = regfile_out_b;
            end
            1'h1: begin
              regfile_rb = 5'h04;
              top_matrix_controller_update = 3'h1;
              top_matrix1_letter_address = regfile_out_b;
            end
            2'h2: begin
              regfile_rb = 5'h08;
              top_matrix_controller_update = 3'h1;
              top_matrix1_letter_address = regfile_out_b;
            end
            2'h3: begin
              regfile_rb = 5'h0c;
              top_matrix_controller_update = 3'h1;
              top_matrix1_letter_address = regfile_out_b;
            end
          endcase
          M_game_fsm_d = SHOW_TOP_DISPLAY_2_game_fsm;
        end
        SHOW_TOP_DISPLAY_2_game_fsm: begin
          regfile_we = 1'h0;
          regfile_ra = 6'h20;
          
          case (regfile_out_a)
            1'h0: begin
              regfile_rb = 8'h41;
              top_matrix_controller_update = 3'h2;
              top_matrix2_letter_address = regfile_out_b;
            end
            1'h1: begin
              regfile_rb = 6'h05;
              top_matrix_controller_update = 3'h2;
              top_matrix2_letter_address = regfile_out_b;
            end
            2'h2: begin
              regfile_rb = 6'h09;
              top_matrix_controller_update = 3'h2;
              top_matrix2_letter_address = regfile_out_b;
            end
            2'h3: begin
              regfile_rb = 6'h0d;
              top_matrix_controller_update = 3'h2;
              top_matrix2_letter_address = regfile_out_b;
            end
          endcase
          M_game_fsm_d = SHOW_TOP_DISPLAY_3_game_fsm;
        end
        SHOW_TOP_DISPLAY_3_game_fsm: begin
          regfile_we = 1'h0;
          regfile_ra = 6'h20;
          
          case (regfile_out_a)
            1'h0: begin
              regfile_rb = 8'h42;
              top_matrix_controller_update = 3'h3;
              top_matrix3_letter_address = regfile_out_b;
            end
            1'h1: begin
              regfile_rb = 6'h06;
              top_matrix_controller_update = 3'h3;
              top_matrix3_letter_address = regfile_out_b;
            end
            2'h2: begin
              regfile_rb = 6'h0a;
              top_matrix_controller_update = 3'h3;
              top_matrix3_letter_address = regfile_out_b;
            end
            2'h3: begin
              regfile_rb = 6'h0e;
              top_matrix_controller_update = 3'h3;
              top_matrix3_letter_address = regfile_out_b;
            end
          endcase
          M_game_fsm_d = SHOW_TOP_DISPLAY_4_game_fsm;
        end
        SHOW_TOP_DISPLAY_4_game_fsm: begin
          regfile_we = 1'h0;
          regfile_ra = 6'h20;
          
          case (regfile_out_a)
            1'h0: begin
              regfile_rb = 8'h43;
              top_matrix_controller_update = 3'h4;
              top_matrix4_letter_address = regfile_out_b;
            end
            1'h1: begin
              regfile_rb = 6'h07;
              top_matrix_controller_update = 3'h4;
              top_matrix4_letter_address = regfile_out_b;
            end
            2'h2: begin
              regfile_rb = 6'h0b;
              top_matrix_controller_update = 3'h4;
              top_matrix4_letter_address = regfile_out_b;
            end
            2'h3: begin
              regfile_rb = 6'h0f;
              top_matrix_controller_update = 3'h4;
              top_matrix4_letter_address = regfile_out_b;
            end
          endcase
          M_game_fsm_d = INCREMENT_GUESS_CTR_game_fsm;
        end
        INCREMENT_GUESS_CTR_game_fsm: begin
          regfile_ra = 6'h20;
          alufn = 6'h00;
          asel = 3'h0;
          bsel = 3'h2;
          regfile_write_address = 6'h20;
          regfile_data = alu_out;
          regfile_we = 1'h1;
          M_game_fsm_d = COMPARE_GUESS_CTR_EQUALS_3_game_fsm;
        end
        COMPARE_GUESS_CTR_EQUALS_3_game_fsm: begin
          regfile_we = 1'h0;
          regfile_ra = 6'h20;
          asel = 3'h0;
          bsel = 3'h5;
          alufn = 6'h33;
          if (regfile_out_a == 1'h1) begin
            M_game_fsm_d = COMPARE_GUESS_CTR_EQUALS_3_game_fsm;
          end
          if (alu_out == 16'h0000) begin
            M_game_fsm_d = SET_INPUT_CTR_TO_0_game_fsm;
          end else begin
            M_game_fsm_d = LOSE_game_fsm;
          end
        end
        LOSE_game_fsm: begin
          regfile_ra = 6'h23;
          words_selector = regfile_out_a;
          correct_word_out = selected_word;
          top_matrix_controller_update = 3'h7;
          bottom_matrix_controller_update = 3'h6;
        end
        WIN_game_fsm: begin
          regfile_ra = 6'h23;
          words_selector = regfile_out_a;
          correct_word_out = selected_word;
          top_matrix_controller_update = 4'h8;
          bottom_matrix_controller_update = 3'h6;
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
