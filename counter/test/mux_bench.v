`timescale 1 ns / 1ps

module mux_tb;

   localparam T = 20;

   reg [1:0] sel;
   reg [3:0] in0;
   reg [3:0] in1;
   reg [3:0] in2;
   reg [3:0] in3;

   wire [3:0] out;


   mux UUT (
		    .sel(sel),
          .in0(in0),
          .in1(in1),
          .in2(in2),
          .in3(in3),
		    .out(out));

   initial begin
      in0 = 4'b1010;
      in1 = 4'b0101;
      in2 = 4'b1100;
      in3 = 4'b0011;

      #(T*2);

      sel = 2'b00;
      #(T*2);
      sel = 2'b01;
      #(T*2);
      sel = 2'b10;
      #(T*2);
      sel = 2'b11;
      #(T*2);

		$stop;
   end

endmodule
