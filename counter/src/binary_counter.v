`timescale 1ns / 1ps

module binary_counter (
		    input wire 	      en,
		    input wire 	      rst,
		    input wire 	      clk,
		    output reg[17:0] 	cntr);

   always @(posedge clk or posedge rst) begin
      if (rst) begin
      	 cntr = 18'b0;
      end
      else begin
         if (en) begin
            cntr = cntr + 1;
         end
      end
   end

endmodule
