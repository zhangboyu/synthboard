//This code has beed adapted from John Loomis' source code for outputting audio on the DE2.  His code can be found here: http://www.johnloomis.org/digitallab/audio/audio2/audio2.html
//The various frequences we used were based upon information from Wikipeida regarding piano notes and frequencies.  This information can be found here: http://en.wikipedia.org/wiki/Piano_key_frequencies
//Aaron Pittenger and Rachel Grady have made the modifications to this code.

module audio2(
  // Clock Input (50 MHz)
  input CLOCK_50, // 50 MHz //PIN
  input CLOCK_27, // 27 MHz //PIN
  //  Push Buttons
  input  [3:0]  KEY, //PIN
  //  DPDT Switches 
  input  [17:0]  SW,
    //  LEDs
  output  [8:0]  LEDG,  //  LED Green[8:0]
  output  [17:0]  LEDR, //  LED Red[17:0]

  // I2C
  inout  I2C_SDAT, // I2C Data
  
  output I2C_SCLK, // I2C Clock
  // Audio CODEC
  output/*inout*/ AUD_ADCLRCK, // Audio CODEC ADC LR Clock
  input	 AUD_ADCDAT,  // Audio CODEC ADC Data
  output /*inout*/  AUD_DACLRCK, // Audio CODEC DAC LR Clock
  output AUD_DACDAT,  // Audio CODEC DAC Data
  inout	 AUD_BCLK,    // Audio CODEC Bit-Stream Clock
  output AUD_XCK,     // Audio CODEC Chip Clock
  //  GPIO Connections
  inout  [35:0]  GPIO_0, GPIO_1,
  output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,
  input PS2_CLK,PS2_DAT,
    output VGA_CLK,   						//	VGA Clock
  output VGA_HS,							//	VGA H_SYNC
  output VGA_VS,							//	VGA V_SYNC
  output VGA_BLANK,						//	VGA BLANK
  output VGA_SYNC,						//	VGA SYNC
  output [9:0] VGA_R,   						//	VGA Red[9:0]
  output [9:0] VGA_G,	 						//	VGA Green[9:0]
  output [9:0] VGA_B,								//	VGA Blue[9:0]
    output TD_RESET	//	TV Decoder Reset
);


wire [15:0]c1;
wire [15:0]csdf1;
wire [15:0]d1;
wire [15:0]dsef1;
wire [15:0]e1;
wire [15:0]f1;
wire [15:0]fsgf1;
wire [15:0]g1;
wire [15:0]gsaf1;
wire [15:0]a1;
wire [15:0]asbf1;
wire [15:0]b1;

wire [15:0]c2;
wire [15:0]csdf2;
wire [15:0]d2;
wire [15:0]dsef2;
wire [15:0]e2;
wire [15:0]f2;
wire [15:0]fsgf2;
wire [15:0]g2;
wire [15:0]gsaf2;
wire [15:0]a2;
wire [15:0]asbf2;
wire [15:0]b2;

wire [15:0]c3;
wire [15:0]csdf3;
wire [15:0]d3;
wire [15:0]dsef3;
wire [15:0]e3;
wire [15:0]f3;
wire [15:0]fsgf3;
wire [15:0]g3;
wire [15:0]gsaf3;
wire [15:0]a3;
wire [15:0]asbf3;
wire [15:0]b3;
wire		VGA_CTRL_CLK;
wire		AUD_CTRL_CLK;
wire [9:0]	mVGA_R;
wire [9:0]	mVGA_G;
wire [9:0]	mVGA_B;
wire [9:0]	mCoord_X;
wire [9:0]	mCoord_Y;
wire RST;
assign RST = ~SW[0];
assign	TD_RESET = 1'b1; // Enable 27 MHz

// reset delay gives some time for peripherals to initialize
wire DLY_RST;
Reset_Delay r0(	.iCLK(CLOCK_50),.oRESET(DLY_RST) );



assign	TD_RESET = 1'b1;  // Enable 27 MHz

VGA_Audio_PLL 	p1 (	
	.areset(~DLY_RST),
	.inclk0(CLOCK_27),
	.c0(VGA_CTRL_CLK),
	.c1(AUD_CTRL_CLK),
	.c2(VGA_CLK)
);

I2C_AV_Config u3(	
//	Host Side
  .iCLK(CLOCK_50),
  .iRST_N(KEY[0]),
//	I2C Side
  .I2C_SCLK(I2C_SCLK),
  .I2C_SDAT(I2C_SDAT)	
);

assign	AUD_ADCLRCK	=	AUD_DACLRCK;
assign	AUD_XCK		=	AUD_CTRL_CLK;

audio_clock u4(	
//	Audio Side
   .oAUD_BCK(AUD_BCLK),
   .oAUD_LRCK(AUD_DACLRCK),
//	Control Signals
  .iCLK_18_4(AUD_CTRL_CLK),
   .iRST_N(DLY_RST)	
);

audio_converter u5(
	// Audio side
	.AUD_BCK(AUD_BCLK),       // Audio bit clock
	.AUD_LRCK(AUD_DACLRCK), // left-right clock
	.AUD_ADCDAT(AUD_ADCDAT),
	.AUD_DATA(AUD_DACDAT),
	// Controller side
	.iRST_N(DLY_RST),  // reset
	.AUD_outL(audio_outL),
	.AUD_outR(audio_outR),
	.AUD_inL(audio_inL),
	.AUD_inR(audio_inR)
);

wire [15:0] audio_inL, audio_inR;
wire [15:0] audio_outL, audio_outR;
wire [15:0] signal;

reg [7:0] index;

parameter PERIOD = 48;
 
//sine_table sig1(
//	.index(index),
//	.signal(audio_outR)
//);



notegen notes(CLOCK_50, RST, SW[1], 
//notegen notes(CLOCK_50, RST,
c1, 
csdf1,
d1,
dsef1,
e1,
f1,
fsgf1,
g1,
gsaf1,
a1,
asbf1,
b1,

c2,
csdf2,
d2,
dsef2,
e2,
f2,
fsgf2,
g2,
gsaf2,
a2,
asbf2,
b2,

c3,
csdf3,
d3,
dsef3,
e3,
f3,
fsgf3,
g3,
gsaf3,
a3,
asbf3,
b3);
//audio_outR);

//SONG LISTING

//Bad Romance
wire [15:0] leftbadrom, rightbadrom;

badromr badromr(
CLOCK_50,
RST,
rightbadrom,

c1,
csdf1,
d1,
dsef1,
e1,
f1,
fsgf1,
g1,
gsaf1,
a1,
asbf1,
b1,

c2,
csdf2,
d2,
dsef2,
e2,
f2,
fsgf2,
g2,
gsaf2,
a2,
asbf2,
b2,

c3,
csdf3,
d3,
dsef3,
e3,
f3,
fsgf3,
g3,
gsaf3,
a3,
asbf3,
b3);

badroml badroml(
CLOCK_50,
RST,
leftbadrom,

c1,
csdf1,
d1,
dsef1,
e1,
f1,
fsgf1,
g1,
gsaf1,
a1,
asbf1,
b1,

c2,
csdf2,
d2,
dsef2,
e2,
f2,
fsgf2,
g2,
gsaf2,
a2,
asbf2,
b2,

c3,
csdf3,
d3,
dsef3,
e3,
f3,
fsgf3,
g3,
gsaf3,
a3,
asbf3,
b3);

//End Bad Romance

//Charlie charlie
wire [15:0] leftcharlie, rightcharlie;
charlier charlier(
CLOCK_50,
RST,
rightcharlie,

c1,
csdf1,
d1,
dsef1,
e1,
f1,
fsgf1,
g1,
gsaf1,
a1,
asbf1,
b1,

c2,
csdf2,
d2,
dsef2,
e2,
f2,
fsgf2,
g2,
gsaf2,
a2,
asbf2,
b2,

c3,
csdf3,
d3,
dsef3,
e3,
f3,
fsgf3,
g3,
gsaf3,
a3,
asbf3,
b3);

charliel charliel(
CLOCK_50,
RST,
leftcharlie,

c1,
csdf1,
d1,
dsef1,
e1,
f1,
fsgf1,
g1,
gsaf1,
a1,
asbf1,
b1,

c2,
csdf2,
d2,
dsef2,
e2,
f2,
fsgf2,
g2,
gsaf2,
a2,
asbf2,
b2,

c3,
csdf3,
d3,
dsef3,
e3,
f3,
fsgf3,
g3,
gsaf3,
a3,
asbf3,
b3);
//End Charlie charlie

wire [15:0] key_press;

testkeyboard keyboard_input(
CLOCK_50,
PS2_CLK,
PS2_DAT,
key_press);

/*hexDisplay disp0(key_press[3:0], HEX0);
hexDisplay disp1(key_press[7:4], HEX1);
hexDisplay disp2(key_press[11:8], HEX2);
hexDisplay disp3(key_press[15:12], HEX3);
blankHexDisplay disp4(HEX4);
blankHexDisplay disp5(HEX5);
blankHexDisplay disp6(HEX6);
blankHexDisplay disp7(HEX7);
*/

modedisplay mddis(SW[17:16], HEX3,HEX2,HEX1,HEX0);
tonedisplay tonedis(key_press,HEX4,HEX5,HEX6);
volumedisplay voldis(SW[1], HEX7);

wire [15:0] squaresound;
square_wave_synthesizer squaresnd(
key_press,
squaresound,

c1,
csdf1,
d1,
dsef1,
e1,
f1,
fsgf1,
g1,
gsaf1,
a1,
asbf1,
b1,

c2,
csdf2,
d2,
dsef2,
e2,
f2,
fsgf2,
g2,
gsaf2,
a2,
asbf2,
b2,

c3,
csdf3,
d3,
dsef3,
e3,
f3,
fsgf3,
g3,
gsaf3,
a3,
asbf3,
b3);

wire [15:0] sinesound;

sine_wave_synthesizer sinsnd(
SW[1],
key_press,
sinesound,
CLOCK_50
);

reg [15:0] leftout, rightout;

wire [1:0]songsel=SW[17:16];
assign audio_outL=leftout;
assign audio_outR=rightout;

always @(*)

case (songsel)
2'b00:
begin
leftout=squaresound;
rightout=squaresound;
end

2'b01:
begin
leftout=leftcharlie;
rightout=rightcharlie;
end

2'b10:
begin
leftout=leftbadrom;
rightout=rightbadrom;
end

2'b11:
begin
leftout=sinesound;
rightout=sinesound;
end

default:
begin
leftout=16'b0;
rightout=16'b0;
end
endcase




vga_sync u1(
   .iCLK(VGA_CTRL_CLK),
   .iRST_N(DLY_RST&KEY[0]),	
   .iRed(mVGA_R),
   .iGreen(mVGA_G),
   .iBlue(mVGA_B),
   // pixel coordinates
   .px(mCoord_X),
   .py(mCoord_Y),
   // VGA Side
   .VGA_R(VGA_R),
   .VGA_G(VGA_G),
   .VGA_B(VGA_B),
   .VGA_H_SYNC(VGA_HS),
   .VGA_V_SYNC(VGA_VS),
   .VGA_SYNC(VGA_SYNC),
   .VGA_BLANK(VGA_BLANK)
);


bars pianodisplay(mCoord_X, mCoord_Y, key_press, mVGA_R, mVGA_G, mVGA_B);




//song_brleft brmel(CLOCK_50, a2, b2, c2, d2, e2, f2, g2, audio_outL, LEDR[6:0], RST);
//song_brright bracc(CLOCK_50, a1, b1, c1, d1, e1, f1, g1, audio_outR, LEDG[6:0], RST);

//always @(negedge AUD_DACLRCK)
//		if (index<PERIOD-1) index <= index + 1'b1;
//		else index <= 8'h00;

//	audio_outR <= audio_inR;

//always @(posedge AUD_DACLRCK)
//assign audio_outL = 15'h0000;
//assign audio_outL = audio_outR;


endmodule