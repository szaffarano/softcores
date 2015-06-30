`timescale 1ns / 1ps

module one_second (
   input wire  clk,
   output reg  tick);

   integer counter = 0;

   always @(posedge clk) begin
      if (counter == 50000000) begin
         counter = 0;
         tick = 1;
      end
      else begin
         counter = counter + 1;
         tick = 0;
      end
   end

endmodule
