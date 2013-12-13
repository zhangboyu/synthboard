module square_wave_synthesizer(
input [15:0] key_press,
output reg [15:0] songout,

input [15:0] c1,
input [15:0] csdf1,
input [15:0] d1,
input [15:0] dsef1,
input [15:0] e1,
input [15:0] f1,
input [15:0] fsgf1,
input [15:0] g1,
input [15:0] gsaf1,
input [15:0] a1,
input [15:0] asbf1,
input [15:0] b1,

input [15:0] c2,
input [15:0] csdf2,
input [15:0] d2,
input [15:0] dsef2,
input [15:0] e2,
input [15:0] f2,
input [15:0] fsgf2,
input [15:0] g2,
input [15:0] gsaf2,
input [15:0] a2,
input [15:0] asbf2,
input [15:0] b2,

input [15:0] c3,
input [15:0] csdf3,
input [15:0] d3,
input [15:0] dsef3,
input [15:0] e3,
input [15:0] f3,
input [15:0] fsgf3,
input [15:0] g3,
input [15:0] gsaf3,
input [15:0] a3,
input [15:0] asbf3,
input [15:0] b3
);

always @(*)
begin
	if ((key_press [7:0] == 8'h16) && (key_press [15:8] !== 8'hf0))
		songout = c1;
	
	else if ((key_press [7:0] == 8'h1e)&& (key_press [15:8] !== 8'hf0))
		songout = csdf1;
	
	else if ((key_press [7:0] == 8'h26)&& (key_press [15:8] !== 8'hf0))
		songout = d1;
	
	else if ((key_press [7:0] == 8'h25)&& (key_press [15:8] !== 8'hf0))
		songout = dsef1;
	
	else if ((key_press [7:0] == 8'h2e)&& (key_press [15:8] !== 8'hf0))
		songout = e1;
	
	else if ((key_press [7:0] == 8'h36)&& (key_press [15:8] !== 8'hf0))
		songout = f1;
	
	else if ((key_press [7:0] == 8'h3d)&& (key_press [15:8] !== 8'hf0))
		songout = fsgf1;
	
	else if ((key_press [7:0] == 8'h3e)&& (key_press [15:8] !== 8'hf0))
		songout = g1;
	
	else if ((key_press [7:0] == 8'h46)&& (key_press [15:8] !== 8'hf0))
		songout = gsaf1;
	
	else if ((key_press [7:0] == 8'h45)&& (key_press [15:8] !== 8'hf0))
		songout = a1;
	
	else if ((key_press [7:0] == 8'h4e)&& (key_press [15:8] !== 8'hf0))
		songout = asbf1;
	
	else if ((key_press [7:0] == 8'h55)&& (key_press [15:8] !== 8'hf0))
		songout = b1;
	
	
	else if ((key_press [7:0] == 8'h15)&& (key_press [15:8] !== 8'hf0))
		songout = c2;
	
	else if ((key_press [7:0] == 8'h1d)&& (key_press [15:8] !== 8'hf0))
		songout = csdf2;
	
	else if ((key_press [7:0] == 8'h24)&& (key_press [15:8] !== 8'hf0))
		songout = d2;
	
	else if ((key_press [7:0] == 8'h2d)&& (key_press [15:8] !== 8'hf0))
		songout = dsef2;
	
	else if ((key_press [7:0] == 8'h2c)&& (key_press [15:8] !== 8'hf0))
		songout = e2;
	
	else if ((key_press [7:0] == 8'h35)&& (key_press [15:8] !== 8'hf0))
		songout = f2;
	
	else if ((key_press [7:0] == 8'h3c)&& (key_press [15:8] !== 8'hf0))
		songout = fsgf2;
	
	else if ((key_press [7:0] == 8'h43)&& (key_press [15:8] !== 8'hf0))
		songout = g2;
	
	else if ((key_press [7:0] == 8'h44)&& (key_press [15:8] !== 8'hf0))
		songout = gsaf2;
	
	else if ((key_press [7:0] == 8'h4d)&& (key_press [15:8] !== 8'hf0))
		songout = a2;
	
	else if ((key_press [7:0] == 8'h54)&& (key_press [15:8] !== 8'hf0))
		songout = asbf2;
	
	else if ((key_press [7:0] == 8'h5b)&& (key_press [15:8] !== 8'hf0))
		songout = b2;

		
	else if ((key_press [7:0] == 8'h1c)&& (key_press [15:8] !== 8'hf0))
		songout = c3;
	
	else if ((key_press [7:0] == 8'h1b)&& (key_press [15:8] !== 8'hf0))
		songout = csdf3;
	
	else if ((key_press [7:0] == 8'h23)&& (key_press [15:8] !== 8'hf0))
		songout = d3;
	
	else if ((key_press [7:0] == 8'h2b)&& (key_press [15:8] !== 8'hf0))
		songout = dsef3;
	
	else if ((key_press [7:0] == 8'h34)&& (key_press [15:8] !== 8'hf0))
		songout = e3;
	
	else if ((key_press [7:0] == 8'h33)&& (key_press [15:8] !== 8'hf0))
		songout = f3;
	
	else if ((key_press [7:0] == 8'h3b)&& (key_press [15:8] !== 8'hf0))
		songout = fsgf3;
	
	else if ((key_press [7:0] == 8'h42)&& (key_press [15:8] !== 8'hf0))
		songout = g3;
	
	else if ((key_press [7:0] == 8'h4b)&& (key_press [15:8] !== 8'hf0))
		songout = gsaf3;
	
	else if ((key_press [7:0] == 8'h4c)&& (key_press [15:8] !== 8'hf0))
		songout = a3;
	
	else if ((key_press [7:0] == 8'h52)&& (key_press [15:8] !== 8'hf0))
		songout = asbf3;
	
	else if ((key_press [7:0] == 8'h4a)&& (key_press [15:8] !== 8'hf0))
		songout = b3;

	
	else
		songout = 16'b0;
end

endmodule