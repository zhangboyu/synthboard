module charlieleft(
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

parameter NUMNOTES=10'd352;
//parameter BPM=32'd3000000000/8'd480; //BPM=3000000000/bpm_in_song (use 2x bpm for quarter note and 4x bpm for 8th note)

always @ (posedge clk50 or negedge reset) //50mhz Clock Divide
	if (reset==1'b0)
		begin
			clkslowcount=24'd0;
		end
		else
		begin

		if (clkslowcount < 24'd6250000)
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
10'd0: ns=rst;

10'd1: ns=c1st;
10'd2: ns=g1st;
10'd3: ns=c2st;
10'd4: ns=c1st;
10'd5: ns=g1st;
10'd6: ns=c2st;
10'd7: ns=c2st;
10'd8: ns=c2st;

10'd9: ns=c1st;
10'd10: ns=g1st;
10'd11: ns=a1st;
10'd12: ns=c1st;
10'd13: ns=g1st;
10'd14: ns=a1st;
10'd15: ns=a1st;
10'd16: ns=a1st;

10'd17: ns=c1st;
10'd18: ns=g1st;
10'd19: ns=c2st;
10'd20: ns=c1st;
10'd21: ns=g1st;
10'd22: ns=c2st;
10'd23: ns=c2st;
10'd24: ns=c2st;

10'd25: ns=c1st;
10'd26: ns=g1st;
10'd27: ns=a1st;
10'd28: ns=c1st;
10'd29: ns=g1st;
10'd30: ns=a1st;
10'd31: ns=a1st;
10'd32: ns=a1st;

//repeat st;art

10'd33: ns=c1st;
10'd34: ns=g1st;
10'd35: ns=c2st;
10'd36: ns=c1st;
10'd37: ns=g1st;
10'd38: ns=c2st;
10'd39: ns=c2st;
10'd40: ns=c2st;

10'd41: ns=c1st;
10'd42: ns=g1st;
10'd43: ns=a1st;
10'd44: ns=c1st;
10'd45: ns=g1st;
10'd46: ns=a1st;
10'd47: ns=a1st;
10'd48: ns=a1st;

10'd49: ns=c1st;
10'd50: ns=g1st;
10'd51: ns=c2st;
10'd52: ns=c1st;
10'd53: ns=g1st;
10'd54: ns=c2st;
10'd55: ns=c2st;
10'd56: ns=c2st;

10'd57: ns=c1st;
10'd58: ns=g1st;
10'd59: ns=a1st;
10'd60: ns=c1st;
10'd61: ns=g1st;
10'd62: ns=a1st;
10'd63: ns=a1st;
10'd64: ns=a1st;

10'd65: ns=c1st;
10'd66: ns=g1st;
10'd67: ns=c2st;
10'd68: ns=c1st;
10'd69: ns=g1st;
10'd70: ns=c2st;
10'd71: ns=c2st;
10'd72: ns=c2st;

10'd73: ns=c1st;
10'd74: ns=g1st;
10'd75: ns=a1st;
10'd76: ns=c1st;
10'd77: ns=g1st;
10'd78: ns=a1st;
10'd79: ns=a1st;
10'd80: ns=a1st;

10'd81: ns=dsef1st;
10'd82: ns=asbf1st;
10'd83: ns=dsef2st;
10'd84: ns=dsef1st;
10'd85: ns=asbf1st;
10'd86: ns=dsef2st;
10'd87: ns=dsef2st;
10'd88: ns=dsef2st;

10'd89: ns=dsef1st;
10'd90: ns=asbf1st;
10'd91: ns=c2st;
10'd92: ns=dsef1st;
10'd93: ns=dsef1st;
10'd94: ns=c2st;
10'd95: ns=c2st;
10'd96: ns=c2st;

10'd97: ns=c1st;
10'd98: ns=c1st;
10'd99: ns=c2st;
10'd100: ns=c1st;
10'd101: ns=g1st;
10'd102: ns=c2st;
10'd103: ns=c2st;
10'd104: ns=c2st;

//ending 1
10'd105: ns=c1st;
10'd106: ns=g1st;
10'd107: ns=a1st;
10'd108: ns=c1st;
10'd109: ns=g1st;
10'd110: ns=a1st;
10'd111: ns=a1st;
10'd112: ns=a1st;

//repeat end - st;art again below
10'd113: ns=c1st;
10'd114: ns=g1st;
10'd115: ns=c2st;
10'd116: ns=c1st;
10'd117: ns=g1st;
10'd118: ns=c2st;
10'd119: ns=c2st;
10'd120: ns=c2st;

10'd121: ns=c1st;
10'd122: ns=g1st;
10'd123: ns=a1st;
10'd124: ns=c1st;
10'd125: ns=g1st;
10'd126: ns=a1st;
10'd127: ns=a1st;
10'd128: ns=a1st;

10'd129: ns=c1st;
10'd130: ns=g1st;
10'd131: ns=c2st;
10'd132: ns=c1st;
10'd133: ns=g1st;
10'd134: ns=c2st;
10'd135: ns=c2st;
10'd136: ns=c2st;

10'd137: ns=c1st;
10'd138: ns=g1st;
10'd139: ns=a1st;
10'd140: ns=c1st;
10'd141: ns=g1st;
10'd142: ns=a1st;
10'd143: ns=a1st;
10'd144: ns=a1st;

10'd145: ns=c1st;
10'd146: ns=g1st;
10'd147: ns=c2st;
10'd148: ns=c1st;
10'd149: ns=g1st;
10'd150: ns=c2st;
10'd151: ns=c2st;
10'd152: ns=c2st;

10'd153: ns=c1st;
10'd154: ns=g1st;
10'd155: ns=a1st;
10'd156: ns=c1st;
10'd157: ns=g1st;
10'd158: ns=a1st;
10'd159: ns=a1st;
10'd160: ns=a1st;

10'd161: ns=dsef1st;
10'd162: ns=asbf1st;
10'd163: ns=dsef1st;
10'd164: ns=dsef1st;
10'd165: ns=asbf1st;
10'd166: ns=dsef2st;
10'd167: ns=dsef2st;
10'd168: ns=dsef2st;

10'd169: ns=dsef1st;
10'd170: ns=asbf1st;
10'd171: ns=c2st;
10'd172: ns=dsef1st;
10'd173: ns=asbf1st;
10'd174: ns=c2st;
10'd175: ns=c2st;
10'd176: ns=c2st;

10'd177: ns=c1st;
10'd178: ns=g1st;
10'd179: ns=c2st;
10'd180: ns=c1st;
10'd181: ns=g1st;
10'd182: ns=c2st;
10'd183: ns=c2st;
10'd184: ns=c2st;
//ending 2

10'd185: ns=c1st;
10'd186: ns=g1st;
10'd187: ns=a1st;
10'd188: ns=c1st;
10'd189: ns=g1st;
10'd190: ns=a1st;
10'd191: ns=a1st;
10'd192: ns=c2st;

10'd193: ns=f1st;
10'd194: ns=f1st;
10'd195: ns=f1st;
10'd196: ns=g1st;
10'd197: ns=rst;
10'd198: ns=rst;
10'd199: ns=rst;
10'd2000: ns=rst;

10'd201: ns=rst;
10'd202: ns=rst;
10'd203: ns=rst;
10'd204: ns=rst;
10'd205: ns=rst;
10'd206: ns=rst;
10'd207: ns=rst;
10'd28: ns=c2st;

10'd209: ns=f2st;
10'd210: ns=f2st;
10'd211: ns=f2st;
10'd212: ns=g2st;
10'd213: ns=rst;
10'd214: ns=rst;
10'd215: ns=rst;
10'd216: ns=rst;

10'd217: ns=rst;
10'd218: ns=rst;
10'd219: ns=rst;
10'd220: ns=rst;
10'd221: ns=rst;
10'd222: ns=rst;
10'd223: ns=rst;
10'd224: ns=c2st;

10'd225: ns=f1st;
10'd226: ns=f1st;
10'd227: ns=f1st;
10'd228: ns=g1st;
10'd229: ns=rst;
10'd230: ns=rst;
10'd231: ns=rst;
10'd232: ns=rst;

10'd233: ns=rst;
10'd234: ns=rst;
10'd235: ns=rst;
10'd236: ns=rst;
10'd237: ns=rst;
10'd238: ns=rst;
10'd239: ns=rst;
10'd240: ns=rst;

10'd241: ns=c1st;
10'd242: ns=g1st;
10'd243: ns=c2st;
10'd244: ns=c1st;
10'd245: ns=g1st;
10'd246: ns=c2st;
10'd247: ns=c2st;
10'd248: ns=c2st;

10'd249: ns=c1st;
10'd250: ns=g1st;
10'd251: ns=a1st;
10'd252: ns=c1st;
10'd253: ns=g1st;
10'd254: ns=a1st;
10'd255: ns=a1st;
10'd256: ns=a1st;

//ds al coda - back to DS below
10'd257: ns=c1st;
10'd258: ns=g1st;
10'd259: ns=c2st;
10'd260: ns=c1st;
10'd261: ns=g1st;
10'd262: ns=c2st;
10'd263: ns=c2st;
10'd264: ns=c2st;

10'd265: ns=c1st;
10'd266: ns=g1st;
10'd267: ns=a1st;
10'd268: ns=c1st;
10'd269: ns=g1st;
10'd270: ns=a1st;
10'd271: ns=a1st;
10'd272: ns=a1st;

10'd273: ns=c1st;
10'd274: ns=g1st;
10'd275: ns=c2st;
10'd276: ns=c1st;
10'd277: ns=g1st;
10'd278: ns=c2st;
10'd279: ns=c2st;
10'd280: ns=c2st;

10'd281: ns=c1st;
10'd282: ns=g1st;
10'd283: ns=a1st;
10'd284: ns=c1st;
10'd285: ns=g1st;
10'd286: ns=a1st;
10'd287: ns=a1st;
10'd288: ns=a1st;

10'd289: ns=c1st;
10'd290: ns=g1st;
10'd291: ns=c2st;
10'd292: ns=c1st;
10'd293: ns=g1st;
10'd294: ns=c2st;
10'd295: ns=c2st;
10'd296: ns=c2st;

10'd297: ns=c1st;
10'd298: ns=g1st;
10'd299: ns=a1st;
10'd300: ns=c1st;
10'd301: ns=g1st;
10'd302: ns=a1st;
10'd303: ns=a1st;
10'd304: ns=a1st;

10'd305: ns=dsef1st;
10'd306: ns=asbf2st;
10'd307: ns=dsef2st;
10'd308: ns=dsef1st;
10'd309: ns=asbf1st;
10'd310: ns=dsef2st;
10'd311: ns=dsef2st;
10'd312: ns=dsef2st;

10'd313: ns=dsef1st;
10'd314: ns=asbf1st;
10'd315: ns=c2st;
10'd316: ns=dsef1st;
10'd317: ns=asbf1st;
10'd318: ns=c2st;
10'd319: ns=c2st;
10'd320: ns=c2st;

10'd321: ns=c1st;
10'd322: ns=g1st;
10'd323: ns=c2st;
10'd324: ns=c1st;
10'd325: ns=g1st;
10'd326: ns=c2st;
10'd327: ns=c2st;
10'd328: ns=c2st;
//to coda - coda below 
10'd329: ns=c1st;
10'd330: ns=g1st;
10'd331: ns=a1st;
10'd332: ns=c1st;
10'd333: ns=g1st;
10'd334: ns=a1st;
10'd335: ns=a1st;
10'd336: ns=a1st;

10'd337: ns=c1st;
10'd338: ns=c1st;
10'd339: ns=c1st;
10'd340: ns=c1st;
10'd341: ns=c1st;
10'd342: ns=c1st;
10'd343: ns=c1st;
10'd344: ns=c1st;

10'd345: ns=rst;
10'd346: ns=rst;
10'd347: ns=rst;
10'd348: ns=rst;
10'd349: ns=rst;
10'd350: ns=rst;
10'd351: ns=rst;
10'd352: ns=rst;
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