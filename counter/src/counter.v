`timescale 1ns / 1ps

module counter(
		input wire 	  en,
		input wire 	  rst,
		input wire 	  clk,
		output wire 	a, b, c, d, e, f, g,
		output wire 	a1, a2, a3, a4);

	wire     cout, real_en;
	wire [3:0] bcd1;
	wire [3:0] bcd2;
	wire [3:0] bcd3;
	wire [3:0] bcd4;
	wire	tick;

	wire [3:0] curr_bcd;

	wire [17:0] cntr;
	wire [1:0]  bcd_cntr;
	wire [6:0]  seven_seg;
	wire [3:0]	anodos;

	one_second one_second (.clk(clk), .tick(tick));

   	bcd_4digits_counter bcd_counter (
		.clk(clk),
		.en(tick),
		.rst(rst),
		.cout(cout),
		.bcd1(bcd1),
		.bcd2(bcd2),
		.bcd3(bcd3),
		.bcd4(bcd4));

   	mux mux (
	    .sel(bcd_cntr),
        .in0(bcd1),
        .in1(bcd2),
        .in2(bcd3),
        .in3(bcd4),
	    .out(curr_bcd));

	decoder_bcd_7s decoder_7s (
		.bcd(curr_bcd),
		.a(seven_seg[0]),
		.b(seven_seg[1]),
		.c(seven_seg[2]),
		.d(seven_seg[3]),
		.e(seven_seg[4]),
		.f(seven_seg[5]),
		.g(seven_seg[6]));

	decoder_2_4 decoder_2_4 (
		       .bcd(bcd_cntr),
		       .a1(anodos[0]),
		       .a2(anodos[1]),
		       .a3(anodos[2]),
		       .a4(anodos[3]));
	
	binary_counter binary_counter (
	    .clk(clk),
	    .en(real_en),
	    .rst(rst),
	    .cntr(cntr));

	assign bcd_cntr = cntr[17:16];

	assign a = seven_seg[0];
	assign b = seven_seg[1];
	assign c = seven_seg[2];
	assign d = seven_seg[3];
	assign e = seven_seg[4];
	assign f = seven_seg[5];
	assign g = seven_seg[6];

	assign a1 = anodos[0];
	assign a2 = anodos[1];
	assign a3 = anodos[2];
	assign a4 = anodos[3];

	assign real_en = ~en;

endmodule
