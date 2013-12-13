module tonedisplay(key_press, HEX4,HEX5,HEX6);
input [15:0] key_press;
output [6:0] HEX4,HEX5,HEX6;
reg [3:0] c1tone;
reg [3:0] c2tone;
reg [3:0] c3tone;

always @(*)
begin
	if ((key_press [7:0] == 8'h16) && (key_press [15:8] !== 8'hf0))
		c1tone = 4'd1;
	
	else if ((key_press [7:0] == 8'h1e)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd2;
	
	else if ((key_press [7:0] == 8'h26)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd3;
	
	else if ((key_press [7:0] == 8'h25)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd4;
	
	else if ((key_press [7:0] == 8'h2e)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd5;
	
	else if ((key_press [7:0] == 8'h36)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd6;
	
	else if ((key_press [7:0] == 8'h3d)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd7;
	
	else if ((key_press [7:0] == 8'h3e)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd8;
	
	else if ((key_press [7:0] == 8'h46)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd9;
	
	else if ((key_press [7:0] == 8'h45)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd10;
	
	else if ((key_press [7:0] == 8'h4e)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd11;
	
	else if ((key_press [7:0] == 8'h55)&& (key_press [15:8] !== 8'hf0))
		c1tone = 4'd12;
	
	else
		c1tone = 4'd0;
		
		
	if ((key_press [7:0] == 8'h15)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd1;
	
	else if ((key_press [7:0] == 8'h1d)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd2;
	
	else if ((key_press [7:0] == 8'h24)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd3;
	
	else if ((key_press [7:0] == 8'h2d)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd4;
	
	else if ((key_press [7:0] == 8'h2c)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd5;
	
	else if ((key_press [7:0] == 8'h35)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd6;
	
	else if ((key_press [7:0] == 8'h3c)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd7;
	
	else if ((key_press [7:0] == 8'h43)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd8;
	
	else if ((key_press [7:0] == 8'h44)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd9;
	
	else if ((key_press [7:0] == 8'h4d)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd10;
	
	else if ((key_press [7:0] == 8'h54)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd11;
	
	else if ((key_press [7:0] == 8'h5b)&& (key_press [15:8] !== 8'hf0))
		c2tone = 4'd12;
	
	else
		c2tone = 4'd0;

		
	if ((key_press [7:0] == 8'h1c)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd1;
	
	else if ((key_press [7:0] == 8'h1b)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd2;
	
	else if ((key_press [7:0] == 8'h23)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd3;
	
	else if ((key_press [7:0] == 8'h2b)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd4;
	
	else if ((key_press [7:0] == 8'h34)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd5;
	
	else if ((key_press [7:0] == 8'h33)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd6;
	
	else if ((key_press [7:0] == 8'h3b)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd7;
	
	else if ((key_press [7:0] == 8'h42)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd8;
	
	else if ((key_press [7:0] == 8'h4b)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd9;
	
	else if ((key_press [7:0] == 8'h4c)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd10;
	
	else if ((key_press [7:0] == 8'h52)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd11;
	
	else if ((key_press [7:0] == 8'h4a)&& (key_press [15:8] !== 8'hf0))
		c3tone = 4'd12;
		
	else
		c3tone = 16'b0;
end

hex_7seg displayc1(c1tone,HEX4);
hex_7seg displayc2(c2tone,HEX5);
hex_7seg displayc3(c3tone,HEX6);

endmodule