// This is sort of a copy of the "testkeytolcd.v" file.
// The .v files that need to be included in the "helper
// modules" folder are "oneshot.v" and "keyboard.v"
// Keyboard input is a modified version of from John
// Loomis's "ps2lab1" project

module testkeyboard(
		clock50,keyboard_clk, keyboard_data,
		keydata
);

	// Inputs/outputs
			// System inputs
			input clock50;

			// System outputs
			//output[8:0] ledg;

			// Hex display outputs
			/*output[6:0] hex0;
			output[6:0] hex1;
			output[6:0] hex2;
			output[6:0] hex3;
			output[6:0] HEX4;
			output[6:0] HEX5;
			output[6:0] HEX6;
			output[6:0] HEX7;*/
			output [15:0] keydata;
			
			// Keyboard inputs
			input keyboard_clk;
			input keyboard_data;
			
			wire reset = 1'b0;
			wire read, scan_ready;
			wire [7:0] scan_code;
			reg [7:0] keyhistory1;
			reg [7:0] keyhistory2;
			reg [15:0] scanhistory;
			reg [15:0] keydata;
	
	// beginning of keyboard code ------------------------------------------
	// copy everything below. keydata[15:0] is the key data (ex: 16'hF032)
	oneshot pulser(
		.pulse_out(read),
		.trigger_in(scan_ready),
		.clk(clock50)
	);

	keyboard kbd(
	  .keyboard_clk(keyboard_clk),
	  .keyboard_data(keyboard_data),
	  .clock50(clock50),
	  .reset(reset),
	  .read(read),
	  .scan_ready(scan_ready),
	  .scan_code(scan_code)
	);
	
	always @(posedge scan_ready)
	begin
		keyhistory2 <= keyhistory1;
		keyhistory1 <= scan_code;
	end
	
	always @(*)
	begin
		keydata[15:8] = keyhistory2;
		keydata[7:0] = keyhistory1;
	end
	// end of keyboard code ------------------------------------------------
	
/* hexDisplay disp0(keydata[3:0], HEX4);
	hexDisplay disp1(keydata[7:4], HEX5);
	hexDisplay disp2(keydata[11:8], HEX6);
	hexDisplay disp3(keydata[15:12], HEX7);
	blankHexDisplay disp4(hex4);
	blankHexDisplay disp5(hex5);
	blankHexDisplay disp6(hex6);
	blankHexDisplay disp7(hex7);*/

endmodule