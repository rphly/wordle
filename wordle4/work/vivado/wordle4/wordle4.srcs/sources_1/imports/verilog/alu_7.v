/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_7 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] alu,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_adder_add;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  reg [6-1:0] M_adder_alufn;
  adder_12 adder (
    .a(M_adder_a),
    .b(M_adder_b),
    .alufn(M_adder_alufn),
    .add(M_adder_add),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  wire [16-1:0] M_comp_comp;
  reg [1-1:0] M_comp_z;
  reg [1-1:0] M_comp_v;
  reg [1-1:0] M_comp_n;
  reg [6-1:0] M_comp_alufn;
  compare_13 comp (
    .z(M_comp_z),
    .v(M_comp_v),
    .n(M_comp_n),
    .alufn(M_comp_alufn),
    .comp(M_comp_comp)
  );
  
  wire [16-1:0] M_bool_bool;
  reg [16-1:0] M_bool_a;
  reg [16-1:0] M_bool_b;
  reg [6-1:0] M_bool_alufn;
  boolean_14 bool (
    .a(M_bool_a),
    .b(M_bool_b),
    .alufn(M_bool_alufn),
    .bool(M_bool_bool)
  );
  
  wire [16-1:0] M_shift_shift;
  reg [16-1:0] M_shift_a;
  reg [16-1:0] M_shift_b;
  reg [6-1:0] M_shift_alufn;
  shifter_15 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .shift(M_shift_shift)
  );
  
  always @* begin
    M_adder_a = a;
    M_adder_b = b;
    M_adder_alufn = alufn;
    z = M_adder_z;
    v = M_adder_v;
    n = M_adder_n;
    M_comp_z = M_adder_z;
    M_comp_v = M_adder_v;
    M_comp_n = M_adder_n;
    M_comp_alufn = alufn;
    M_bool_a = a;
    M_bool_b = b;
    M_bool_alufn = alufn;
    M_shift_a = a;
    M_shift_b = b[0+3-:4];
    M_shift_alufn = alufn;
    
    case (alufn[4+1-:2])
      2'h0: begin
        alu = M_adder_add;
      end
      2'h1: begin
        alu = M_bool_bool;
      end
      2'h2: begin
        alu = M_shift_shift;
      end
      2'h3: begin
        alu = M_comp_comp;
      end
      default: begin
        alu = 16'h0000;
      end
    endcase
  end
endmodule
