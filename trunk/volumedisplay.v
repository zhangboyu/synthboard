module volumedisplay(
input volume, 
output reg [6:0] HEX7
);

always @(*)
begin
	if (volume == 1'b1)
		HEX7 = 7'b0100100;
	else
		HEX7 = 7'b1111001;
end

endmodule