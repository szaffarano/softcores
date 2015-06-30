`timescale 1ns / 1ps

module decoder_2_4 (
		       input wire [1:0] bcd,
		       output reg 	a1, a2, a3, a4);

	always@*
	begin
		case (bcd)
			2'b00:
				begin
					a1 = 0;
					a2 = 1;
					a3 = 1;
					a4 = 1;
				end
			2'b01:
				begin
					a2 = 0;
					a3 = 1;
					a4 = 1;
					a1 = 1;
				end
			2'b10:
				begin
					a3 = 0;
					a4 = 1;
					a1 = 1;
					a2 = 1;
				end
			2'b11:
				begin
					a4 = 0;
					a1 = 1;
					a2 = 1;
					a3 = 1;
				end
		endcase
	end
endmodule
