/*------------------------------------------------------------------------------
 * File          : chacha_quarter_round.sv
 * Project       : RTL
 * Author        : epjoed
 * Creation date : May 23, 2023
 * Description   :
 *------------------------------------------------------------------------------*/

module chacha_quarter_round #(parameter WIDTH) 
(
	input  logic [WIDTH-1:0] a_in,
	input  logic [WIDTH-1:0] b_in,
	input  logic [WIDTH-1:0] c_in,
	input  logic [WIDTH-1:0] d_in,
	output logic [WIDTH-1:0] a_in,
	output logic [WIDTH-1:0] b_in,
	output logic [WIDTH-1:0] c_in,
	output logic [WIDTH-1:0] d_in
	
);
	//local signals
	logic [WIDTH-1:0] a_temp0;
	logic [WIDTH-1:0] b_temp0;
	logic [WIDTH-1:0] c_temp0;
	logic [WIDTH-1:0] d_temp0;
	logic [WIDTH-1:0] a_temp1;
	logic [WIDTH-1:0] b_temp1;
	logic [WIDTH-1:0] c_temp1;
	logic [WIDTH-1:0] d_temp1;
	logic [WIDTH-1:0] a_temp2;
	logic [WIDTH-1:0] b_temp2;
	logic [WIDTH-1:0] c_temp2;
	logic [WIDTH-1:0] d_temp2;
	logic [WIDTH-1:0] a_temp3;
	logic [WIDTH-1:0] b_temp3;
	logic [WIDTH-1:0] c_temp3;
	logic [WIDTH-1:0] d_temp3;

	
	//logical row 0
	//a += b; d ^= a; d <<<=16;
	assign a_temp0 = a_in + b_in;
	assign b_temp0 = b_in;
	assign c_temp0 = c_in;
	assign d_temp0 = d_in ^ a_temp0;
	assign d_temp0 = {d_temp0[15:0], d_temp0[31:16]};
	
	//logical row 1
	//c += d; b ^= c; b <<<= 12;
	assign a_temp1 = a_temp0;
	assign c_temp1 = c_temp0 + d_temp0;
	assign b_temp1 = b_temp0 ^ c_temp1;
	assign b_temp1 = {b_temp1[19:0], b_temp1[31:20]};
	assign d_temp1 = d_temp0;
	
	//logical row 2
	//a += b; d ^= a; d <<< 8;
	assign temp_a2 = a_temp1 + b_temp1;
	assign temp_b2 = b_temp1;
	assign temp_c2 = c_temp1;
	assign temp_d2 = d_temp1 ^ a_temp1;
	assign temp_d2 = {d_temp1[23:0], d_temp1[31:24]};
	
	//logical row 3
	//c += d; b ^= c; b <<<= 7;
	

endmodule
