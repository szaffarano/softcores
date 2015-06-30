`timescale 1ns / 1ps

module bcd_counter (
		    input wire 	      en,
		    input wire 	      rst,
		    input wire 	      clk,
		    output reg 	      cout,
		    output wire [3:0] bcd
		    );

   reg [3:0] 			      tmp = 0;

   always @(posedge clk or posedge rst) begin
      if (rst) begin
      	 tmp = 4'b0;
      end
      else begin
         if (en) begin
            tmp = tmp + 1;
            cout = 0;
            if (tmp == 10) begin
               tmp = 0;
            end
            else if (tmp == 9) begin
               cout = 1;
            end
         end
      end
   end

   assign bcd = tmp;

endmodule
