`timescale 1 ns / 1ps

module bcd_counter_tb;

   localparam T = 20;

   reg 	    clk, en, rst;

   wire     cout;
   wire [3:0] bcd;



   bcd_counter UUT (
		    .clk(clk),
		    .en(en),
		    .rst(rst),
		    .cout(cout),
		    .bcd(bcd));

   // clk del bench corriendo por siempre en 20 ns
   always begin
      clk = 1'b1;
      #(T/2);
      clk = 1'b0;
      #(T/2);
   end

   // maneja el reset, que queda bajo luego de medio ciclo desde el inicio.
   initial begin
      rst = 1'b1;
      #(T/2);
      rst = 1'b0;
   end

   initial begin
      // esperar un ciclo de clk
      @(negedge clk);

      en = 1'b1;

      #(T*15);

      rst = 1'b1;

      @(negedge clk);

      rst = 1'b0;

      #(T*15);

      @(negedge clk);
		
      rst = 1'b1;
      
      @(negedge clk);

      rst = 1'b0;
      en = 1'b0;
      #(T*2);
      
		$stop;
   end

endmodule
