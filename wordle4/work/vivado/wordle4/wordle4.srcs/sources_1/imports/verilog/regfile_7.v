/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module regfile_7 (
    input clk,
    input rst,
    input [6:0] write_address,
    input we,
    input [15:0] data,
    input [5:0] read_address_a,
    input [5:0] read_address_b,
    output reg [15:0] out_a,
    output reg [15:0] out_b
  );
  
  
  
  reg [6:0] M_guess_1_letter_1_d, M_guess_1_letter_1_q = 1'h0;
  reg [6:0] M_guess_1_letter_2_d, M_guess_1_letter_2_q = 1'h0;
  reg [6:0] M_guess_1_letter_3_d, M_guess_1_letter_3_q = 1'h0;
  reg [6:0] M_guess_1_letter_4_d, M_guess_1_letter_4_q = 1'h0;
  reg [6:0] M_guess_2_letter_1_d, M_guess_2_letter_1_q = 1'h0;
  reg [6:0] M_guess_2_letter_2_d, M_guess_2_letter_2_q = 1'h0;
  reg [6:0] M_guess_2_letter_3_d, M_guess_2_letter_3_q = 1'h0;
  reg [6:0] M_guess_2_letter_4_d, M_guess_2_letter_4_q = 1'h0;
  reg [6:0] M_guess_3_letter_1_d, M_guess_3_letter_1_q = 1'h0;
  reg [6:0] M_guess_3_letter_2_d, M_guess_3_letter_2_q = 1'h0;
  reg [6:0] M_guess_3_letter_3_d, M_guess_3_letter_3_q = 1'h0;
  reg [6:0] M_guess_3_letter_4_d, M_guess_3_letter_4_q = 1'h0;
  reg [6:0] M_guess_4_letter_1_d, M_guess_4_letter_1_q = 1'h0;
  reg [6:0] M_guess_4_letter_2_d, M_guess_4_letter_2_q = 1'h0;
  reg [6:0] M_guess_4_letter_3_d, M_guess_4_letter_3_q = 1'h0;
  reg [6:0] M_guess_4_letter_4_d, M_guess_4_letter_4_q = 1'h0;
  reg [4:0] M_input_letter_1_d, M_input_letter_1_q = 1'h0;
  reg [4:0] M_input_letter_2_d, M_input_letter_2_q = 1'h0;
  reg [4:0] M_input_letter_3_d, M_input_letter_3_q = 1'h0;
  reg [4:0] M_input_letter_4_d, M_input_letter_4_q = 1'h0;
  reg [4:0] M_correct_letter_1_d, M_correct_letter_1_q = 1'h0;
  reg [4:0] M_correct_letter_2_d, M_correct_letter_2_q = 1'h0;
  reg [4:0] M_correct_letter_3_d, M_correct_letter_3_q = 1'h0;
  reg [4:0] M_correct_letter_4_d, M_correct_letter_4_q = 1'h0;
  reg [4:0] M_input_i_d, M_input_i_q = 1'h0;
  reg [4:0] M_correct_k_d, M_correct_k_q = 1'h0;
  reg [2:0] M_i_d, M_i_q = 1'h0;
  reg [2:0] M_j_d, M_j_q = 1'h0;
  reg [2:0] M_k_d, M_k_q = 1'h0;
  reg [1:0] M_input_ctr_d, M_input_ctr_q = 1'h0;
  reg [2:0] M_num_correct_d, M_num_correct_q = 1'h0;
  reg [0:0] M_zero_d, M_zero_q = 1'h0;
  reg [2:0] M_g_d, M_g_q = 1'h0;
  reg [5:0] M_temp_guess_g_letter_i_d, M_temp_guess_g_letter_i_q = 1'h0;
  reg [6:0] M_temp_coloured_letter_d, M_temp_coloured_letter_q = 1'h0;
  reg [10:0] M_word_index_d, M_word_index_q = 1'h0;
  reg [0:0] M_oka_mode_d, M_oka_mode_q = 1'h0;
  
  always @* begin
    M_temp_guess_g_letter_i_d = M_temp_guess_g_letter_i_q;
    M_word_index_d = M_word_index_q;
    M_guess_1_letter_1_d = M_guess_1_letter_1_q;
    M_guess_1_letter_2_d = M_guess_1_letter_2_q;
    M_guess_4_letter_1_d = M_guess_4_letter_1_q;
    M_guess_4_letter_2_d = M_guess_4_letter_2_q;
    M_guess_4_letter_3_d = M_guess_4_letter_3_q;
    M_guess_4_letter_4_d = M_guess_4_letter_4_q;
    M_num_correct_d = M_num_correct_q;
    M_oka_mode_d = M_oka_mode_q;
    M_guess_3_letter_4_d = M_guess_3_letter_4_q;
    M_zero_d = M_zero_q;
    M_temp_coloured_letter_d = M_temp_coloured_letter_q;
    M_guess_3_letter_3_d = M_guess_3_letter_3_q;
    M_guess_3_letter_2_d = M_guess_3_letter_2_q;
    M_guess_3_letter_1_d = M_guess_3_letter_1_q;
    M_guess_1_letter_3_d = M_guess_1_letter_3_q;
    M_guess_1_letter_4_d = M_guess_1_letter_4_q;
    M_guess_2_letter_4_d = M_guess_2_letter_4_q;
    M_correct_letter_4_d = M_correct_letter_4_q;
    M_g_d = M_g_q;
    M_input_letter_3_d = M_input_letter_3_q;
    M_input_letter_2_d = M_input_letter_2_q;
    M_i_d = M_i_q;
    M_input_letter_1_d = M_input_letter_1_q;
    M_j_d = M_j_q;
    M_k_d = M_k_q;
    M_input_ctr_d = M_input_ctr_q;
    M_input_i_d = M_input_i_q;
    M_correct_k_d = M_correct_k_q;
    M_input_letter_4_d = M_input_letter_4_q;
    M_guess_2_letter_1_d = M_guess_2_letter_1_q;
    M_correct_letter_1_d = M_correct_letter_1_q;
    M_guess_2_letter_3_d = M_guess_2_letter_3_q;
    M_correct_letter_3_d = M_correct_letter_3_q;
    M_guess_2_letter_2_d = M_guess_2_letter_2_q;
    M_correct_letter_2_d = M_correct_letter_2_q;
    
    if (we) begin
      
      case (write_address)
        7'h40: begin
          M_guess_1_letter_1_d = data;
        end
        7'h41: begin
          M_guess_1_letter_2_d = data;
        end
        7'h42: begin
          M_guess_1_letter_3_d = data;
        end
        7'h43: begin
          M_guess_1_letter_4_d = data;
        end
        5'h04: begin
          M_guess_2_letter_1_d = data;
        end
        5'h05: begin
          M_guess_2_letter_2_d = data;
        end
        5'h06: begin
          M_guess_2_letter_3_d = data;
        end
        5'h07: begin
          M_guess_2_letter_4_d = data;
        end
        5'h08: begin
          M_guess_3_letter_1_d = data;
        end
        5'h09: begin
          M_guess_3_letter_2_d = data;
        end
        5'h0a: begin
          M_guess_3_letter_3_d = data;
        end
        5'h0b: begin
          M_guess_3_letter_4_d = data;
        end
        5'h0c: begin
          M_guess_4_letter_1_d = data;
        end
        5'h0d: begin
          M_guess_4_letter_2_d = data;
        end
        5'h0e: begin
          M_guess_4_letter_3_d = data;
        end
        5'h0f: begin
          M_guess_4_letter_4_d = data;
        end
        5'h10: begin
          M_input_letter_1_d = data;
        end
        5'h11: begin
          M_input_letter_2_d = data;
        end
        5'h12: begin
          M_input_letter_3_d = data;
        end
        5'h13: begin
          M_input_letter_4_d = data;
        end
        5'h14: begin
          M_i_d = data;
        end
        5'h15: begin
          M_j_d = data;
        end
        5'h16: begin
          M_k_d = data;
        end
        5'h17: begin
<<<<<<< HEAD
          M_correct_letter_1_d = 5'h0c;
        end
        5'h18: begin
          M_correct_letter_2_d = 5'h09;
        end
        5'h19: begin
          M_correct_letter_3_d = 5'h0f;
        end
        5'h1a: begin
          M_correct_letter_4_d = 5'h0e;
=======
          M_correct_letter_1_d = data;
        end
        5'h18: begin
          M_correct_letter_2_d = data;
        end
        5'h19: begin
          M_correct_letter_3_d = data;
        end
        5'h1a: begin
          M_correct_letter_4_d = data;
>>>>>>> 81d1d9559e6e53b259c73dd88862c923e336802b
        end
        5'h1b: begin
          M_num_correct_d = data;
        end
        5'h1c: begin
          M_input_ctr_d = data;
        end
        5'h1d: begin
          M_input_i_d = data;
        end
        5'h1e: begin
          M_correct_k_d = data;
        end
        5'h1f: begin
          M_zero_d = 1'h0;
        end
        6'h20: begin
          M_g_d = data;
        end
        6'h21: begin
          M_temp_guess_g_letter_i_d = data;
        end
        6'h22: begin
          M_temp_coloured_letter_d = data;
        end
        6'h23: begin
          M_word_index_d = data;
        end
        6'h24: begin
          M_oka_mode_d = data;
        end
      endcase
    end
    
    case (read_address_a)
      7'h40: begin
        out_a = M_guess_1_letter_1_q;
      end
      7'h41: begin
        out_a = M_guess_1_letter_2_q;
      end
      7'h42: begin
        out_a = M_guess_1_letter_3_q;
      end
      7'h43: begin
        out_a = M_guess_1_letter_4_q;
      end
      5'h04: begin
        out_a = M_guess_2_letter_1_q;
      end
      5'h05: begin
        out_a = M_guess_2_letter_2_q;
      end
      5'h06: begin
        out_a = M_guess_2_letter_3_q;
      end
      5'h07: begin
        out_a = M_guess_2_letter_4_q;
      end
      5'h08: begin
        out_a = M_guess_3_letter_1_q;
      end
      5'h09: begin
        out_a = M_guess_3_letter_2_q;
      end
      5'h0a: begin
        out_a = M_guess_3_letter_3_q;
      end
      5'h0b: begin
        out_a = M_guess_3_letter_4_q;
      end
      5'h0c: begin
        out_a = M_guess_4_letter_1_q;
      end
      5'h0d: begin
        out_a = M_guess_4_letter_2_q;
      end
      5'h0e: begin
        out_a = M_guess_4_letter_3_q;
      end
      5'h0f: begin
        out_a = M_guess_4_letter_4_q;
      end
      5'h10: begin
        out_a = M_input_letter_1_q;
      end
      5'h11: begin
        out_a = M_input_letter_2_q;
      end
      5'h12: begin
        out_a = M_input_letter_3_q;
      end
      5'h13: begin
        out_a = M_input_letter_4_q;
      end
      5'h14: begin
        out_a = M_i_q;
      end
      5'h15: begin
        out_a = M_j_q;
      end
      5'h16: begin
        out_a = M_k_q;
      end
      5'h17: begin
        out_a = M_correct_letter_1_q;
      end
      5'h18: begin
        out_a = M_correct_letter_2_q;
      end
      5'h19: begin
        out_a = M_correct_letter_3_q;
      end
      5'h1a: begin
        out_a = M_correct_letter_4_q;
      end
      5'h1b: begin
        out_a = M_num_correct_q;
      end
      5'h1c: begin
        out_a = M_input_ctr_q;
      end
      5'h1d: begin
        out_a = M_input_i_q;
      end
      5'h1e: begin
        out_a = M_correct_k_q;
      end
      5'h1f: begin
        out_a = M_zero_q;
      end
      6'h20: begin
        out_a = M_g_q;
      end
      6'h21: begin
        out_a = M_temp_guess_g_letter_i_q;
      end
      6'h22: begin
        out_a = M_temp_coloured_letter_q;
      end
      6'h23: begin
        out_a = M_word_index_q;
      end
      6'h24: begin
        out_a = M_oka_mode_q;
      end
      default: begin
        out_a = M_zero_q;
      end
    endcase
    
    case (read_address_b)
      7'h40: begin
        out_b = M_guess_1_letter_1_q;
      end
      7'h41: begin
        out_b = M_guess_1_letter_2_q;
      end
      7'h42: begin
        out_b = M_guess_1_letter_3_q;
      end
      7'h43: begin
        out_b = M_guess_1_letter_4_q;
      end
      5'h04: begin
        out_b = M_guess_2_letter_1_q;
      end
      5'h05: begin
        out_b = M_guess_2_letter_2_q;
      end
      5'h06: begin
        out_b = M_guess_2_letter_3_q;
      end
      5'h07: begin
        out_b = M_guess_2_letter_4_q;
      end
      5'h08: begin
        out_b = M_guess_3_letter_1_q;
      end
      5'h09: begin
        out_b = M_guess_3_letter_2_q;
      end
      5'h0a: begin
        out_b = M_guess_3_letter_3_q;
      end
      5'h0b: begin
        out_b = M_guess_3_letter_4_q;
      end
      5'h0c: begin
        out_b = M_guess_4_letter_1_q;
      end
      5'h0d: begin
        out_b = M_guess_4_letter_2_q;
      end
      5'h0e: begin
        out_b = M_guess_4_letter_3_q;
      end
      5'h0f: begin
        out_b = M_guess_4_letter_4_q;
      end
      5'h10: begin
        out_b = M_input_letter_1_q;
      end
      5'h11: begin
        out_b = M_input_letter_2_q;
      end
      5'h12: begin
        out_b = M_input_letter_3_q;
      end
      5'h13: begin
        out_b = M_input_letter_4_q;
      end
      5'h14: begin
        out_b = M_i_q;
      end
      5'h15: begin
        out_b = M_j_q;
      end
      5'h16: begin
        out_b = M_k_q;
      end
      5'h17: begin
        out_b = M_correct_letter_1_q;
      end
      5'h18: begin
        out_b = M_correct_letter_2_q;
      end
      5'h19: begin
        out_b = M_correct_letter_3_q;
      end
      5'h1a: begin
        out_b = M_correct_letter_4_q;
      end
      5'h1b: begin
        out_b = M_num_correct_q;
      end
      5'h1c: begin
        out_b = M_input_ctr_q;
      end
      5'h1d: begin
        out_b = M_input_i_q;
      end
      5'h1e: begin
        out_b = M_correct_k_q;
      end
      5'h1f: begin
        out_b = M_zero_q;
      end
      6'h20: begin
        out_b = M_g_q;
      end
      6'h21: begin
        out_b = M_temp_guess_g_letter_i_q;
      end
      6'h22: begin
        out_b = M_temp_coloured_letter_q;
      end
      6'h23: begin
        out_b = M_word_index_q;
      end
      6'h24: begin
        out_b = M_oka_mode_q;
      end
      default: begin
        out_b = M_zero_q;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_guess_1_letter_1_q <= 1'h0;
      M_guess_1_letter_2_q <= 1'h0;
      M_guess_1_letter_3_q <= 1'h0;
      M_guess_1_letter_4_q <= 1'h0;
      M_guess_2_letter_1_q <= 1'h0;
      M_guess_2_letter_2_q <= 1'h0;
      M_guess_2_letter_3_q <= 1'h0;
      M_guess_2_letter_4_q <= 1'h0;
      M_guess_3_letter_1_q <= 1'h0;
      M_guess_3_letter_2_q <= 1'h0;
      M_guess_3_letter_3_q <= 1'h0;
      M_guess_3_letter_4_q <= 1'h0;
      M_guess_4_letter_1_q <= 1'h0;
      M_guess_4_letter_2_q <= 1'h0;
      M_guess_4_letter_3_q <= 1'h0;
      M_guess_4_letter_4_q <= 1'h0;
      M_input_letter_1_q <= 1'h0;
      M_input_letter_2_q <= 1'h0;
      M_input_letter_3_q <= 1'h0;
      M_input_letter_4_q <= 1'h0;
      M_correct_letter_1_q <= 1'h0;
      M_correct_letter_2_q <= 1'h0;
      M_correct_letter_3_q <= 1'h0;
      M_correct_letter_4_q <= 1'h0;
      M_input_i_q <= 1'h0;
      M_correct_k_q <= 1'h0;
      M_i_q <= 1'h0;
      M_j_q <= 1'h0;
      M_k_q <= 1'h0;
      M_input_ctr_q <= 1'h0;
      M_num_correct_q <= 1'h0;
      M_zero_q <= 1'h0;
      M_g_q <= 1'h0;
      M_temp_guess_g_letter_i_q <= 1'h0;
      M_temp_coloured_letter_q <= 1'h0;
      M_word_index_q <= 1'h0;
      M_oka_mode_q <= 1'h0;
    end else begin
      M_guess_1_letter_1_q <= M_guess_1_letter_1_d;
      M_guess_1_letter_2_q <= M_guess_1_letter_2_d;
      M_guess_1_letter_3_q <= M_guess_1_letter_3_d;
      M_guess_1_letter_4_q <= M_guess_1_letter_4_d;
      M_guess_2_letter_1_q <= M_guess_2_letter_1_d;
      M_guess_2_letter_2_q <= M_guess_2_letter_2_d;
      M_guess_2_letter_3_q <= M_guess_2_letter_3_d;
      M_guess_2_letter_4_q <= M_guess_2_letter_4_d;
      M_guess_3_letter_1_q <= M_guess_3_letter_1_d;
      M_guess_3_letter_2_q <= M_guess_3_letter_2_d;
      M_guess_3_letter_3_q <= M_guess_3_letter_3_d;
      M_guess_3_letter_4_q <= M_guess_3_letter_4_d;
      M_guess_4_letter_1_q <= M_guess_4_letter_1_d;
      M_guess_4_letter_2_q <= M_guess_4_letter_2_d;
      M_guess_4_letter_3_q <= M_guess_4_letter_3_d;
      M_guess_4_letter_4_q <= M_guess_4_letter_4_d;
      M_input_letter_1_q <= M_input_letter_1_d;
      M_input_letter_2_q <= M_input_letter_2_d;
      M_input_letter_3_q <= M_input_letter_3_d;
      M_input_letter_4_q <= M_input_letter_4_d;
      M_correct_letter_1_q <= M_correct_letter_1_d;
      M_correct_letter_2_q <= M_correct_letter_2_d;
      M_correct_letter_3_q <= M_correct_letter_3_d;
      M_correct_letter_4_q <= M_correct_letter_4_d;
      M_input_i_q <= M_input_i_d;
      M_correct_k_q <= M_correct_k_d;
      M_i_q <= M_i_d;
      M_j_q <= M_j_d;
      M_k_q <= M_k_d;
      M_input_ctr_q <= M_input_ctr_d;
      M_num_correct_q <= M_num_correct_d;
      M_zero_q <= M_zero_d;
      M_g_q <= M_g_d;
      M_temp_guess_g_letter_i_q <= M_temp_guess_g_letter_i_d;
      M_temp_coloured_letter_q <= M_temp_coloured_letter_d;
      M_word_index_q <= M_word_index_d;
      M_oka_mode_q <= M_oka_mode_d;
    end
  end
  
endmodule
