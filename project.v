module project(CLOCK_50, SW, HEX0, HEX1, HEX2, HEX4, HEX5, HEX6, HEX7, KEY);

// This is the top-level module with all the inputs and outputs
// It is used to called all the submodule below and connected to the DE2board
input CLOCK_50;
input [17:0] SW;
input [3:0] KEY;
output [6:0] HEX0, HEX1, HEX2, HEX4, HEX5, HEX6, HEX7;

wire [27:0] rateCount;
wire [7:0] timeLeft;
wire reset, start;
wire go;
wire [7:0] counter;

wire [11:0] q;


assign reset = ~SW[13];
assign start = SW[12];
assign go = ~KEY[3];

RateDivider rd0 (28'h2faf080, reset, start, 1'b1, CLOCK_50, rateCount);
DisplayCounter dc0 (timeLeft, reset, start, rateCount == 1'b0, CLOCK_50);
hex_decoder hd5 (.hex_digit(timeLeft[7:4]), .segments(HEX5));
hex_decoder hd4 (.hex_digit(timeLeft[3:0]), .segments(HEX4));


control ctr(CLOCK_50, reset, go, start, SW[11:0], counter, q);

hex_decoder hd6 (.hex_digit(counter[3:0]), .segments(HEX6));
hex_decoder hd7 (.hex_digit(counter[7:4]), .segments(HEX7));
hex_decoder hd0 (.hex_digit(q[3:0]), .segments(HEX0));
hex_decoder hd1 (.hex_digit(q[7:4]), .segments(HEX1));
hex_decoder hd2 (.hex_digit(q[11:8]), .segments(HEX2));

endmodule



// First build nine questions for players to answer
// Divided it into nine different levels
// Created the right answer
// Use SW switch to answer the giving question
// If your answer is the same as the correct answer,
// output shows win
module level_1(start, sw, level_1_win, answer);
input start;
input [11:0] sw;
output reg level_1_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b000000000010;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_1_win = 1'b1;
		  else
			  level_1_win = 1'b0;
	 end
	 else
	     level_1_win = 1'b0;
end
endmodule


module level_2(start, sw, level_2_win, answer);
input start;
input [11:0] sw;
output reg level_2_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b000000000101;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_2_win = 1'b1;
		  else
			  level_2_win = 1'b0;
	 end
	 else
	     level_2_win = 1'b0;
end
endmodule

module level_3(start, sw, level_3_win, answer);
input start;
input [11:0] sw;
output reg level_3_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b000000100111;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_3_win = 1'b1;
		  else
			  level_3_win = 1'b0;
	 end
	 else
	     level_3_win = 1'b0;
end
endmodule



module level_4(start, sw, level_4_win, answer);
input start;
input [11:0] sw;
output reg level_4_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b000010001000;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_4_win = 1'b1;
		  else
			  level_4_win = 1'b0;
	 end
	 else
	     level_4_win = 1'b0;
end
endmodule

module level_5(start, sw, level_5_win, answer);
input start;
input [11:0] sw;
output reg level_5_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b000100010001;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_5_win = 1'b1;
		  else
			  level_5_win = 1'b0;
	 end
	 else
	     level_5_win = 1'b0;
end
endmodule


module level_6(start, sw, level_6_win, answer);
input start;
input [11:0] sw;
output reg level_6_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b000101000100;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_6_win = 1'b1;
		  else
			  level_6_win = 1'b0;
	 end
	 else
	     level_6_win = 1'b0;
end
endmodule


module level_7(start, sw, level_7_win, answer);
input start;
input [11:0] sw;
output reg level_7_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b000101101001;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_7_win = 1'b1;
		  else
			  level_7_win = 1'b0;
	 end
	 else
	     level_7_win = 1'b0;
end
endmodule


module level_8(start, sw, level_8_win, answer);
input start;
input [11:0] sw;
output reg level_8_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b001000000000;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_8_win = 1'b1;
		  else
			  level_8_win = 1'b0;
	 end
	 else
	     level_8_win = 1'b0;
end
endmodule


module level_9(start, sw, level_9_win, answer);
input start;
input [11:0] sw;
output reg level_9_win;
output [11:0] answer;

reg [11:0] code;


assign answer = 12'b001000110110;


always @(*)
begin
    if (start)
	 begin
		  code <= sw[11:0];
		  if (code == answer)
			  level_9_win = 1'b1;
		  else
			  level_9_win = 1'b0;
	 end
	 else
	     level_9_win = 1'b0;
end
endmodule



// Create a state table use control module
// Each level module will be called into this part
// Add a counter to calculate the number of player's correct answers
// No matter what your answer is, jump to the next level
// If the answer is correct, counter +1
module control(
    input clk,
    input resetn,
    input go,
	 input start,
	 input [11:0] sw,
	 output reg [7:0] counter,
	 output [11:0] q 
    );
    
	 wire [11:0] answer;
	 wire lv1_win;
	 wire lv2_win;
	 wire lv3_win;
	 wire lv4_win;
	 wire lv5_wn;
	 wire lv7_win;
	 wire lv8_win;
	 wire lv6_wiin;
	 wire lv9_win;

    level_1 lv1(.start(start), .sw(sw), .level_1_win(lv1_win), .answer(answer));
    assign answer = q;
	 level_2 lv2(.start(start), .sw(sw), .level_2_win(lv2_win), .answer(answer));
	 assign answer = q;
    level_3 lv3(.start(start), .sw(sw), .level_3_win(lv3_win), .answer(answer));
	 assign answer = q;
	 level_4 lv4(.start(start), .sw(sw), .level_4_win(lv4_win), .answer(answer));
	 assign answer = q;
    level_5 lv5(.start(start), .sw(sw), .level_5_win(lv5_win), .answer(answer));
	 assign answer = q;
    level_6 lv6(.start(start), .sw(sw), .level_6_win(lv6_win), .answer(answer));
	 assign answer = q;
    level_7 lv7(.start(start), .sw(sw), .level_7_win(lv7_win), .answer(answer));
	 assign answer = q;
    level_8 lv8(.start(start), .sw(sw), .level_8_win(lv8_win), .answer(answer));
	 assign answer = q;
    level_9 lv9(.start(start), .sw(sw), .level_9_win(lv9_win), .answer(answer));
	 assign answer = q;


    initial begin
	     counter = 8'b00000000;
    end

	 reg [5:0] current_state, next_state;
	 
    localparam  STANDBY        = 5'd0,
                STANDBY_WAIT   = 5'd1,
                LEVEL_1        = 5'd2,
                LEVEL_1_WAIT   = 5'd3,
                LEVEL_2        = 5'd4,
                LEVEL_2_WAIT   = 5'd5,
                LEVEL_3        = 5'd6,
                LEVEL_3_WAIT   = 5'd7,
                LEVEL_4        = 5'd8,
                LEVEL_4_WAIT   = 5'd9,
                LEVEL_5        = 5'd10,
		          LEVEL_5_WAIT   = 5'd11,
		          LEVEL_6        = 5'd12,
                LEVEL_6_WAIT   = 5'd13,
                LEVEL_7        = 5'd14,
                LEVEL_7_WAIT   = 5'd15,
                LEVEL_8        = 5'd16,
                LEVEL_8_WAIT   = 5'd17,
                LEVEL_9        = 5'd18,
                GAME_END       = 5'd19;
    
    // Next state logic aka our state table
    always@(*)
    begin: state_table 
            case (current_state)
                STANDBY: next_state = go ? STANDBY_WAIT : STANDBY; // Loop in current state until value is input
                STANDBY_WAIT: next_state = go ? STANDBY_WAIT : LEVEL_1; // Loop in current state until go signal goes low
                
					 LEVEL_1: if(lv1_win == 1'b1) begin
					              next_state = LEVEL_1_WAIT;
									  counter <= counter + 1'b1;
								 end
							    else if(lv1_win == 1'b0) begin
								     next_state = LEVEL_1_WAIT;
								 end
								 else
								     next_state = LEVEL_1;
					
					 LEVEL_1_WAIT: next_state = go ? LEVEL_2 : LEVEL_1_WAIT;
					 
					 LEVEL_2: if(lv2_win == 1'b1) begin
					              next_state = LEVEL_2_WAIT;
									  counter <= counter + 1'b1;
								 end
							    else if(lv2_win == 1'b0) begin
								     next_state = LEVEL_2_WAIT;
								 end
								 else
								     next_state = LEVEL_2;
					
					 LEVEL_2_WAIT: next_state = go ? LEVEL_3 : LEVEL_2_WAIT;
					 
					 LEVEL_3: if(lv3_win == 1'b1) begin
					              next_state = LEVEL_3_WAIT;
									  counter <= counter + 1'b1;
								 end
							    else if(lv3_win == 1'b0) begin
								     next_state = LEVEL_3_WAIT;
								 end
								 else
								     next_state = LEVEL_3;
					
					 LEVEL_3_WAIT: next_state = go ? LEVEL_4 : LEVEL_3_WAIT;
					 
					 LEVEL_4: if(lv4_win == 1'b1) begin
					              next_state = LEVEL_4_WAIT;
									  counter <= counter + 1'b1;
								 end
							    else if(lv4_win == 1'b0) begin
								     next_state = LEVEL_4_WAIT;
								 end
								 else
								     next_state = LEVEL_4;
					
					 LEVEL_4_WAIT: next_state = go ? LEVEL_5 : LEVEL_4_WAIT;
					 
					 LEVEL_5: if(lv5_win == 1'b1) begin
					              next_state = LEVEL_5_WAIT;
									  counter <= counter + 1'b1;
								 end
							    else if(lv5_win == 1'b0) begin
								     next_state = LEVEL_5_WAIT;
								 end
								 else
								     next_state = LEVEL_5;
					
					 LEVEL_5_WAIT: next_state = go ? LEVEL_6 : LEVEL_5_WAIT;
                
					 LEVEL_6: if(lv6_win == 1'b1) begin
					              next_state = LEVEL_6_WAIT;
									  counter <= counter + 1'b1;
								 end
							    else if(lv6_win == 1'b0) begin
								     next_state = LEVEL_6_WAIT;
								 end
								 else
								     next_state = LEVEL_6;
					
					 LEVEL_6_WAIT: next_state = go ? LEVEL_7 : LEVEL_6_WAIT;
					 
					 LEVEL_7: if(lv7_win == 1'b1) begin
					              next_state = LEVEL_7_WAIT;
									  counter <= counter + 1'b1;
								 end
							    else if(lv7_win == 1'b0) begin
								     next_state = LEVEL_7_WAIT;
								 end
								 else
								     next_state = LEVEL_7;
					
					 LEVEL_7_WAIT: next_state = go ? LEVEL_8 : LEVEL_7_WAIT;
					 
					 LEVEL_8: if(lv8_win == 1'b1) begin
					              next_state = LEVEL_8_WAIT;
									  counter <= counter + 1'b1;
								 end
							    else if(lv8_win == 1'b0) begin
								     next_state = LEVEL_8_WAIT;
								 end
								 else
								     next_state = LEVEL_8;
					
					 LEVEL_8_WAIT: next_state = go ? LEVEL_9 : LEVEL_8_WAIT;
					 
					 LEVEL_9: if(lv9_win == 1'b1) begin
					              next_state = GAME_END;
									  counter <= counter + 1'b1;
								 end
							    else if(lv9_win == 1'b0) begin
								     next_state = GAME_END;
								 end
								 else
								     next_state = LEVEL_9;
					
					 GAME_END: next_state = go ? STANDBY : GAME_END;
					 
            default:     next_state = STANDBY;
            endcase
    end // state_table
endmodule



// https://github.com/LeiSurrre/CSCB58Proj/blob/master/the_hamster/main.v
// This is the module for the count-down timer to run
// from 60 to 0
module DisplayCounter (q, reset, start, Enable, clock);
    wire [7:0] d;
    assign d = 8'b01100000;
    output reg [7:0] q;
    input reset, start;
    input Enable;
    input clock;
   
    always @ (posedge clock)
    begin
            if (!reset || start)
                q <= d; //q is set to 60
            else if (Enable) begin
                if (q == 8'b00000000) begin
                    q <= 8'b00000000;
                end
                else if (q[3:0] > 4'b1001) begin
                    q[3:0] <= 4'b1001;
                end
                else if (q[3:0] == 4'b0000) begin
                    q <= q - 1'b1;
                    q[3:0] <= 4'b1001;
                end
                else if (q[3:0] < 4'b1010) begin
                    q <= q - 1'b1;
                end
            end
    end
endmodule





module RateDivider (d, reset, start, Enable, clock, q);
    output reg [27:0] q;
    input wire [27:0] d;
    input reset, start;
    input Enable;
    input clock;
   
    always @ (posedge clock)
    begin
            if (!reset || start) 
                q <= 28'h2faf080; //q is set to 0
            else if (q == 28'b0) 
                q <= d; //q reset to default
            else if (Enable)
                q <= q - 1;
    end
endmodule
 

// Final output part will use this decoder
// to show on the DE2board
module hex_decoder(hex_digit, segments);
    input [3:0] hex_digit;
    output reg [6:0] segments;
   
    always @(*)
        case (hex_digit)
            4'h0: segments = 7'b100_0000;
            4'h1: segments = 7'b111_1001;
            4'h2: segments = 7'b010_0100;
            4'h3: segments = 7'b011_0000;
            4'h4: segments = 7'b001_1001;
            4'h5: segments = 7'b001_0010;
            4'h6: segments = 7'b000_0010;
            4'h7: segments = 7'b111_1000;
            4'h8: segments = 7'b000_0000;
            4'h9: segments = 7'b001_1000;
            4'hA: segments = 7'b000_1000;
            4'hB: segments = 7'b000_0011;
            4'hC: segments = 7'b100_0110;
            4'hD: segments = 7'b010_0001;
            4'hE: segments = 7'b000_0110;
            4'hF: segments = 7'b000_1110;
            default: segments = 7'h7f;
        endcase
endmodule





