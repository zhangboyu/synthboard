module bars(input [9:0] x, input [9:0] y, input [15:0] key_press,
	output reg [9:0] red, output reg [9:0] green, output reg [9:0] blue);

always @(*)
begin
	if (y < 140 || y > 340 )
		begin
			red = 10'b1100010100;
			green  = 10'b1100010100;
			blue = 10'b1111111011;
		end
	else if (x < 5 || x > 635)
		begin
			red = 10'b1000010100;
			green  = 10'b0100010100;
			blue = 10'b1110101011;
		end	
		
//press for CSDF1
	else if ((y<274)&&(x>=25&&x<=44))
	begin
		if ((key_press [7:0] == 8'h1e)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	
//press for DSEF1
	else if ((y<274)&&(x>=55&&x<=74))
	begin
		if ((key_press [7:0] == 8'h25)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	else if ((y<274)&&(x>=115&&x<=134))
	begin
		if ((key_press [7:0] == 8'h3d)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	else if ((y<274)&&(x>=145&&x<=164))
	begin
		if ((key_press [7:0] == 8'h46)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	else if ((y<274)&&(x>=175&&x<=194))
	begin
		if ((key_press [7:0] == 8'h4e)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	
	
	
	
//C2
	else if ((y<274)&&((x>=235&&x<=254)))
	begin
		if ((key_press [7:0] == 8'h1d)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	else if ((y<274)&&(x>=265&&x<=284))
	begin
		if ((key_press [7:0] == 8'h2d)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end	
	else if ((y<274)&&(x>=325&&x<=344))
	begin
		if ((key_press [7:0] == 8'h3c)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	else if ((y<274)&&(x>=355&&x<=374))
	begin
		if ((key_press [7:0] == 8'h44)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end	
	else if ((y<274)&&(x>=385&&x<=404))
	begin
		if ((key_press [7:0] == 8'h54)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	
	
//C3
	else if ((y<274)&&((x>=445&&x<=464)))
	begin
		if ((key_press [7:0] == 8'h1b)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	else if ((y<274)&&(x>=475&&x<=494))
	begin
		if ((key_press [7:0] == 8'h2b)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end	
	else if ((y<274)&&(x>=535&&x<=554))
	begin
		if ((key_press [7:0] == 8'h3b)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	else if ((y<274)&&(x>=565&&x<=584))
	begin
		if ((key_press [7:0] == 8'h4b)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end	
	else if ((y<274)&&(x>=595&&x<=614))
	begin
		if ((key_press [7:0] == 8'h52)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'b0;
				green = 10'b0;
				blue = 10'b0;
			end
	end
	

	else if ((((x-3)%30)==2)||(((x-3)%30)==1))
		begin
			red = 10'b0;
			green = 10'b0;
			blue = 10'b0;
		end
		
//press C1
	else if ((x>=5&&x<=34&&y>=274&&y<=340))
		begin
			if ((key_press [7:0] == 8'h16) && (key_press [15:8] !== 8'hf0))
				begin
					red = 10'h0;
					green = 10'h3ff;
					blue = 10'h0;
				end
			else
				begin
					red = 10'h3ff;
					green = 10'h3ff;
					blue = 10'h3ff;
				end
		end
		
		else if ((x>=36&&x<=63&&y>=274&&y<=340))
		begin
			if ((key_press [7:0] == 8'h26)&& (key_press [15:8] !== 8'hf0))
				begin
					red = 10'h0;
					green = 10'h3ff;
					blue = 10'h0;
				end
			else
				begin
					red = 10'h3ff;
					green = 10'h3ff;
					blue = 10'h3ff;
				end
		end

		else if ((x>=66&&x<=93&&y>=274&&y<=340))
		begin
			if ((key_press [7:0] == 8'h2e)&& (key_press [15:8] !== 8'hf0))
				begin
					red = 10'h0;
					green = 10'h3ff;
					blue = 10'h0;
				end
			else
				begin
					red = 10'h3ff;
					green = 10'h3ff;
					blue = 10'h3ff;
				end
		end

		else if ((x>=96&&x<=123&&y>=274&&y<=340))
		begin
			if ((key_press [7:0] == 8'h36)&& (key_press [15:8] !== 8'hf0))
				begin
					red = 10'h0;
					green = 10'h3ff;
					blue = 10'h0;
				end
			else
				begin
					red = 10'h3ff;
					green = 10'h3ff;
					blue = 10'h3ff;
				end
		end
		
		else if ((x>=126&&x<=153&&y>=274&&y<=340))
		begin
			if ((key_press [7:0] == 8'h3e)&& (key_press [15:8] !== 8'hf0))
				begin
					red = 10'h0;
					green = 10'h3ff;
					blue = 10'h0;
				end
			else
				begin
					red = 10'h3ff;
					green = 10'h3ff;
					blue = 10'h3ff;
				end
		end
		
		else if ((x>=156&&x<=183&&y>=274&&y<=340))
		begin
			if ((key_press [7:0] == 8'h45)&& (key_press [15:8] !== 8'hf0))
				begin
					red = 10'h0;
					green = 10'h3ff;
					blue = 10'h0;
				end
			else
				begin
					red = 10'h3ff;
					green = 10'h3ff;
					blue = 10'h3ff;
				end
		end
		
		else if ((x>=186&&x<=213&&y>=274&&y<=340))
		begin
			if ((key_press [7:0] == 8'h55)&& (key_press [15:8] !== 8'hf0))
				begin
					red = 10'h0;
					green = 10'h3ff;
					blue = 10'h0;
				end
			else
				begin
					red = 10'h3ff;
					green = 10'h3ff;
					blue = 10'h3ff;
				end
		end
		
//C2
else if ((x>=215&&x<=244&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h15)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
	else if ((x>=246&&x<=273&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h24)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end

	else if ((x>=276&&x<=303&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h2c)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end

	else if ((x>=306&&x<=333&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h35)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
	else if ((x>=336&&x<=363&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h43)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
	else if ((x>=366&&x<=393&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h4d)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
	else if ((x>=396&&x<=423&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h5b)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
//C3
else if ((x>=425&&x<=454&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h1c)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
	else if ((x>=456&&x<=483&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h23)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end

	else if ((x>=486&&x<=513&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h34)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end

	else if ((x>=516&&x<=543&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h33)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
	else if ((x>=546&&x<=573&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h42)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
	else if ((x>=576&&x<=603&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h4c)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end
	
	else if ((x>=606&&x<=633&&y>=274&&y<=340))
	begin
		if ((key_press [7:0] == 8'h4a)&& (key_press [15:8] !== 8'hf0))
			begin
				red = 10'h0;
				green = 10'h3ff;
				blue = 10'h0;
			end
		else
			begin
				red = 10'h3ff;
				green = 10'h3ff;
				blue = 10'h3ff;
			end
	end	
	
	
	else
		begin
			red = 10'h3ff;
			green = 10'h3ff;
			blue = 10'h3ff;
		end
end

endmodule
