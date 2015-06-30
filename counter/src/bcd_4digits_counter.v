`timescale 1ns / 1ps

module bcd_4digits_counter(
			input wire 	  en,
			input wire 	  rst,
			input wire 	  clk,
			output wire 	  cout,
			output wire [3:0] bcd1,
			output wire [3:0] bcd2,
			output wire [3:0] bcd3,
			output wire [3:0] bcd4);

   wire [3:0] 				  couts;
   wire [3:0] 				  enableds;
   wire [3:0] 				  bcds[3:0];

   
    genvar 				  idx;
    generate
	    for (idx = 0; idx < 4; idx = idx+1) begin: bdc_x_4
   			bcd_counter bcd_1 (
				.clk(clk),
				.en(enableds[idx]),
				.rst(rst),
				.cout(couts[idx]),
				.bcd(bcds[idx]));  
		end
	endgenerate

   assign enableds[3] = couts[0] && couts[1] && couts[2];
   assign enableds[2] = couts[0] && couts[1];
   assign enableds[1] = couts[0] && en;
   assign enableds[0] = en;
   assign cout = couts[3];

   assign bcd1 = bcds[0];
   assign bcd2 = bcds[1];
   assign bcd3 = bcds[2];
   assign bcd4 = bcds[3];
endmodule
