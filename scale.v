module scale(
input clk50,
input reset,
output [15:0] songout,

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


parameter rst=6'd0;
parameter c1st=6'd1;
parameter csdf1st=6'd2;
parameter d1st=6'd3;
parameter dsef1st=6'd4;
parameter e1st=6'd5;
parameter f1st=6'd6;
parameter fsgf1st=6'd7;
parameter g1st=6'd8;
parameter gsaf1st=6'd9;
parameter a1st=6'd10;
parameter asbf1st=6'd11;
parameter b1st=6'd12;

parameter c2st=6'd13;
parameter csdf2st=6'd14;
parameter d2st=6'd15;
parameter dsef2st=6'd16;
parameter e2st=6'd17;
parameter f2st=6'd18;
parameter fsgf2st=6'd19;
parameter g2st=6'd20;
parameter gsaf2st=6'd21;
parameter a2st=6'd22;
parameter asbf2st=6'd23;
parameter b2st=6'd24;

parameter c3st=6'd25;
parameter csdf3st=6'd26;
parameter d3st=6'd27;
parameter dsef3st=6'd28;
parameter e3st=6'd29;
parameter f3st=6'd30;
parameter fsgf3st=6'd31;
parameter g3st=6'd32;
parameter gsaf3st=6'd33;
parameter a3st=6'd34;
parameter asbf3st=6'd35;
parameter b3st=6'd36;


reg [8:0] notecount=7'b0;//increments 1x per slow clock in order to keep track current note number
reg [9:0] ns;
reg [15:0] out;
reg [23:0]clkslowcount=24'd0; //counter for slow clock
reg clkslow; //slow clock for bpm (double time to represent 8th note)

assign songout=out;
//assign ledout=led;

parameter OFF=1'b0;
parameter ON=1'b1;

parameter NUMNOTES=10'd70;
//parameter BPM=32'd3000000000/8'd480; //BPM=3000000000/bpm_in_song (use 2x bpm for quarter note and 4x bpm for 8th note)

always @ (posedge clk50 or negedge reset) //50mhz Clock Divide
	if (reset==1'b0)
		begin
			clkslowcount=24'd0;
		end
		else
		begin

		if (clkslowcount < 24'd3000000)
			begin
				clkslowcount <= clkslowcount+1'b1;
			end
	
			else 
			begin
				clkslowcount <= 24'b0;
				clkslow <= (clkslow==OFF) ? ON:OFF;
			end
		end

always @ (posedge clkslow or negedge reset) //note number counter
begin
	if (reset==1'b0)
		begin
			notecount<=7'd0;
			
		end
	else
		begin
			if (notecount==NUMNOTES)
			begin
				notecount<=7'd1;
			end
			else
			begin
			notecount<=notecount+1'b1;
			end
		end
end

always @ (notecount) //notes in song
begin	
	case (notecount)
7'd0: ns=rst;	
7'd1: ns=c1st;
7'd2: ns=csdf1st;
7'd3: ns=d1st;
7'd4: ns=dsef1st;
7'd5: ns=e1st;
7'd6: ns=f1st;
7'd7: ns=fsgf1st;
7'd8: ns=g1st;
7'd9: ns=gsaf1st;
7'd10: ns=a1st;
7'd11: ns=asbf1st;
7'd12: ns=b1st;

7'd13: ns=c2st;
7'd14: ns=csdf2st;
7'd15: ns=d2st;
7'd16: ns=dsef2st;
7'd17: ns=e2st;
7'd18: ns=f2st;
7'd19: ns=fsgf2st;
7'd20: ns=g2st;
7'd21: ns=gsaf2st;
7'd22: ns=a2st;
7'd23: ns=asbf2st;
7'd24: ns=b2st;

7'd25: ns=c3st;
7'd26: ns=csdf3st;
7'd27: ns=d3st;
7'd28: ns=dsef3st;
7'd29: ns=e3st;
7'd30: ns=f3st;
7'd31: ns=fsgf3st;
7'd32: ns=g3st;
7'd33: ns=gsaf3st;
7'd34: ns=a3st;
7'd35: ns=asbf3st;
7'd36: ns=b3st;

7'd37: ns=asbf3st;
7'd38: ns=a3st;
7'd39: ns=gsaf3st;
7'd40: ns=g3st;
7'd41: ns=fsgf3st;
7'd42: ns=f3st;
7'd43: ns=e3st;
7'd44: ns=dsef3st;
7'd45: ns=d3st;
7'd46: ns=csdf3st;
7'd47: ns=c3st;

7'd48: ns=b2st;
7'd49: ns=asbf2st;
7'd50: ns=a2st;
7'd51: ns=gsaf2st;
7'd52: ns=g2st;
7'd53: ns=fsgf2st;
7'd54: ns=f2st;
7'd55: ns=e2st;
7'd56: ns=dsef2st;
7'd57: ns=d2st;
7'd58: ns=csdf2st;
7'd59: ns=c2st;

7'd60: ns=b1st;
7'd61: ns=asbf1st;
7'd62: ns=a1st;
7'd63: ns=gsaf1st;
7'd64: ns=g1st;
7'd65: ns=fsgf1st;
7'd66: ns=f1st;
7'd67: ns=e1st;
7'd68: ns=dsef1st;
7'd69: ns=d1st;
7'd70: ns=csdf1st;
default: ns=rst;
	endcase
end

always @(c1 or csdf1 or d1 or dsef1 or e1 or f1 or fsgf1 or g1 or gsaf1 or a1 
or asbf1 or b1 or c2 or csdf2 or d2 or dsef2 or e2 or f2 or fsgf2 or g2 or gsaf2 or 
a2 or asbf2 or b2 or c3 or csdf3 or d3 or dsef3 or e3 or f3 or fsgf3 or g3 or gsaf3 
or a3 or asbf3 or b3 or ns) //output assignments
begin
	case(ns)
c1st: out=c1;
csdf1st: out=csdf1;
d1st: out=d1;
dsef1st: out=dsef1;
e1st: out=e1;
f1st: out=f1;
fsgf1st: out=fsgf1;
g1st: out=g1;
gsaf1st: out=gsaf1;
a1st: out=a1;
asbf1st: out=asbf1;
b1st: out=b1;

c2st: out=c2;
csdf2st: out=csdf2;
d2st: out= d2;
dsef2st: out= dsef2;
e2st: out= e2;
f2st: out= f2;
fsgf2st: out= fsgf2;
g2st: out=g2;
gsaf2st: out=gsaf2;
a2st: out=a2;
asbf2st: out=asbf2;
b2st: out=b2;

c3st: out=c3;
csdf3st: out=csdf3;
d3st: out= d3;
dsef3st: out= dsef3;
e3st: out= e3;
f3st: out= f3;
fsgf3st: out= fsgf3;
g3st: out=g3;
gsaf3st: out=gsaf3;
a3st: out=a3;
asbf3st: out=asbf3;
b3st: out=b3;
default: out=16'd0;
	endcase
end
endmodule