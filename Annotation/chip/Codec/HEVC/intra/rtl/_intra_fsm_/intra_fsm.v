`timescale 1ns/1ps
module intra_fsm(
  clk
  ,arst_n
  ,rst_n
  ,tuSize // i
  ,mode   // i
  ,X      // out
  ,Y      // out
  ,preStage  //out
  ,order
  ,bStop
  ,cIdx
  ,isInter
);

parameter				isChroma = 0;

input 				clk,rst_n,arst_n;
input [5:0] 		mode;
input [2:0] 		tuSize;     //2 -- 4,    3--8,  4-- 16,  5--32,  6--64  
input 				bStop;
input				isInter;
output reg	[1:0]	cIdx;


reg	[1:0]			r_cIdx;

output reg [2:0] 	X,Y;   
reg [8:0] 			currentState;
reg [8:0] 			nextState;
output reg [3:0] 	preStage;
output 	reg [2:0]	order;

		 

parameter state0 = 9'd0, state1 = 9'd1, state2 = 9'd2, state3 = 9'd3, state4 = 9'd4, state5 = 9'd5, state6 = 9'd6, state7 = 9'd7, 
state8 = 9'd8, state9 = 9'd9, state10 = 9'd10, state11 = 9'd11, state12 = 9'd12, state13 = 9'd13, state14 = 9'd14, state15 = 9'd15, 
state16 = 9'd16, state17 = 9'd17, state18 = 9'd18, state19 = 9'd19, state20 = 9'd20, state21 = 9'd21, state22 = 9'd22, state23 = 9'd23, 
state24 = 9'd24, state25 = 9'd25, state26 = 9'd26, state27 = 9'd27, state28 = 9'd28, state29 = 9'd29, state30 = 9'd30, state31 = 9'd31, 
state32 = 9'd32, state33 = 9'd33, state34 = 9'd34, state35 = 9'd35, state36 = 9'd36, state37 = 9'd37, state38 = 9'd38, state39 = 9'd39, 
state40 = 9'd40, state41 = 9'd41, state42 = 9'd42, state43 = 9'd43, state44 = 9'd44, state45 = 9'd45, state46 = 9'd46, state47 = 9'd47, 
state48 = 9'd48, state49 = 9'd49, state50 = 9'd50, state51 = 9'd51, state52 = 9'd52, state53 = 9'd53, state54 = 9'd54, state55 = 9'd55, 
state56 = 9'd56, state57 = 9'd57, state58 = 9'd58, state59 = 9'd59, state60 = 9'd60, state61 = 9'd61, state62 = 9'd62, state63 = 9'd63, 
state64 = 9'd64, state65 = 9'd65, state66 = 9'd66, state67 = 9'd67;
parameter starState = 9'd68;


 always @(posedge clk or negedge arst_n) 
			if(~arst_n)	begin
				   currentState<= starState;
				   r_cIdx <= 1;
				end
			else if(!rst_n) begin
				   currentState<= starState;
				   r_cIdx <= 1;
				end
			else	begin
				if(!bStop)	begin
					currentState<= nextState;
					
					if(order==7 && tuSize!=2)
						r_cIdx <= ~r_cIdx;
					else if(tuSize==2 && order!=0)
						r_cIdx <= order==1? 2:1;
				end
				
			end
  
  always @(*) begin
		if(!isChroma)
			cIdx=0;
		else
			cIdx = r_cIdx;
			
    preStage = 0;	  X=0;   Y=0;  order =0;
  
    if(tuSize == 3'd2) begin
		case(currentState)
		starState: begin 
			X=0; Y=0; preStage=4'd8; order = 0;	 
			if(!isChroma)
				nextState = state1; 
			else
				nextState = cIdx==1? state1:state2; 
			end
		state1: begin nextState = starState; X=0; Y=0;  preStage=4'd0; order = 1; end
	//	state2: begin nextState = starState; X=0; Y=0;  preStage=4'd1; order = 2; end
		default: begin nextState = starState; X=0; Y=0;  preStage=4'd1; order = 2; end
        endcase
    end

    else  
      if(tuSize==3'd3) begin  
			
        case(currentState)
		starState: begin nextState = state1; X=1; Y=1; preStage=4'd8; order = 0;	  end
		state1: begin nextState = state2; X=0; Y=1;  preStage=4'd8; order = 1; end
		state2: begin nextState = state3; X=1; Y=0;  preStage=4'd8; order = 2; end
		//state3: begin nextState = starState; X=0; Y=0;  preStage=4'd8; order = 7; end 
		default: begin nextState = starState; X=0; Y=0;  preStage=4'd8; order = 7; end 
        endcase
       end
    else if(tuSize==3'd4)
        begin
	
           case(currentState)
		starState:  
			if(isInter)	begin
				nextState = state1; X=3; Y=3; preStage=4'd8;	order = 1; 	  	
			end
			else begin
				nextState = state0; X=3; Y=3; preStage=4'd0;	order = 0; 	  
			end
		
		state0: begin nextState = state1; X=3; Y=3; preStage=4'd8;      order = 1;		end
		state1: begin nextState = state2; X=2; Y=3; preStage=4'd8;		order = 2;   	end
		state2: begin nextState = state3; X=1; Y=3; preStage=4'd8;  	order = 2; 		end
		state3: begin nextState = state4; X=0; Y=3; preStage=4'd8;  	order = 2; 		end
		state4: begin nextState = state5; X=3; Y=2; preStage=4'd8;  	order = 2; 		end
		state5: begin nextState = state6; X=2; Y=2; preStage=4'd8;  	order = 2; 		end
		state6: begin nextState = state7; X=1; Y=2; preStage=4'd8;  	order = 2; 		end
		state7: begin nextState = state8; X=0; Y=2; preStage=4'd8;  	order = 2; 		end
		state8: begin nextState = state9; X=3; Y=1; preStage=4'd8;  	order = 2; 		end
		state9: begin nextState = state10; X=2; Y=1; preStage=4'd8;  	order = 2; 		end
		state10: begin nextState = state11; X=1; Y=1; preStage=4'd8;  	order = 2; 		end
		state11: begin nextState = state12; X=0; Y=1; preStage=4'd8;  	order = 2; 		end
		state12: begin nextState = state13; X=3; Y=0; preStage=4'd8;  	order = 2; 		end
		state13: begin nextState = state14; X=2; Y=0; preStage=4'd8;   	order = 5; 		end
		state14: begin nextState = state15; X=1; Y=0; preStage=4'd8;	order = 6;		end
//		state15: begin nextState = starState; X=0; Y=0; preStage=4'd8;	order = 7;		end
		default: begin nextState = starState; X=0; Y=0; preStage=4'd8;	order = 7;		end
        endcase
        end
    else if (tuSize==3'd5 ) begin 
	
       case(currentState)
		starState: 
		if(isInter)
			begin nextState = state1; X=7; Y=7; preStage=4'd8; 	order = 2;  end
		else
			begin nextState = state65; X=7; Y=7; preStage=4'd0; order = 0;  end
		state65: begin nextState = state66; X=7; Y=7; preStage=4'd1;	order = 1; 	end
		state66: begin nextState = state67; X=7; Y=7; preStage=4'd2;	order = 2; 	end
		state67: begin nextState = state0; X=7; Y=7; preStage=4'd3; 	order = 2; 	end
		state0: begin nextState = state1; X=7; Y=7;  preStage=4'd8; 	order = 2; 	end
		state1: begin nextState = state2; X=6; Y=7; preStage=4'd8; 		order = 2; 	end
		state2: begin nextState = state3; X=5; Y=7; preStage=4'd8; 		order = 2; 	end
		state3: begin nextState = state4; X=4; Y=7; preStage=4'd8; 		order = 2; 	end
		state4: begin nextState = state5; X=3; Y=7; preStage=4'd8;		order = 2; 	end
		state5: begin nextState = state6; X=2; Y=7; preStage=4'd8;		order = 2; 	end
		state6: begin nextState = state7; X=1; Y=7; preStage=4'd8;		order = 2; 	end
		state7: begin nextState = state8; X=0; Y=7; preStage=4'd8;		order = 2; 	end
		state8: begin nextState = state9; X=7; Y=6; preStage=4'd8;		order = 2; 	end
		state9: begin nextState = state10; X=6; Y=6; preStage=4'd8;		order = 2; 	end
		state10: begin nextState = state11; X=5; Y=6; preStage=4'd8;	order = 2; 	end
		state11: begin nextState = state12; X=4; Y=6; preStage=4'd8;	order = 2; 	end
		state12: begin nextState = state13; X=3; Y=6; preStage=4'd8;	order = 2; 	end
		state13: begin nextState = state14; X=2; Y=6; preStage=4'd8;	order = 2; 	end
		state14: begin nextState = state15; X=1; Y=6; preStage=4'd8;	order = 2; 	end
		state15: begin nextState = state16; X=0; Y=6; preStage=4'd8;	order = 2; 	end
		state16: begin nextState = state17; X=7; Y=5; preStage=4'd8;	order = 2; 	end
		state17: begin nextState = state18; X=6; Y=5; preStage=4'd8;	order = 2; 	end
		state18: begin nextState = state19; X=5; Y=5; preStage=4'd8;	order = 2; 	end
		state19: begin nextState = state20; X=4; Y=5; preStage=4'd8;	order = 2; 	end
		state20: begin nextState = state21; X=3; Y=5; preStage=4'd8;	order = 2; 	end
		state21: begin nextState = state22; X=2; Y=5; preStage=4'd8;	order = 2; 	end
		state22: begin nextState = state23; X=1; Y=5; preStage=4'd8;	order = 2; 	end
		state23: begin nextState = state24; X=0; Y=5; preStage=4'd8;	order = 2; 	end
		state24: begin nextState = state25; X=7; Y=4; preStage=4'd8;	order = 2; 	end
		state25: begin nextState = state26; X=6; Y=4; preStage=4'd8;	order = 2; 	end
		state26: begin nextState = state27; X=5; Y=4; preStage=4'd8;	order = 2; 	end
		state27: begin nextState = state28; X=4; Y=4; preStage=4'd8;	order = 2; 	end
		state28: begin nextState = state29; X=3; Y=4; preStage=4'd8;	order = 2; 	end
		state29: begin nextState = state30; X=2; Y=4; preStage=4'd8;	order = 2; 	end
		state30: begin nextState = state31; X=1; Y=4; preStage=4'd8;	order = 2; 	end
		state31: begin nextState = state32; X=0; Y=4; preStage=4'd8;	order = 2; 	end
		state32: begin nextState = state33; X=7; Y=3; preStage=4'd8;	order = 2; 	end
		state33: begin nextState = state34; X=6; Y=3; preStage=4'd8;	order = 2; 	end
		state34: begin nextState = state35; X=5; Y=3; preStage=4'd8;	order = 2; 	end
		state35: begin nextState = state36; X=4; Y=3; preStage=4'd8;	order = 2; 	end
		state36: begin nextState = state37; X=3; Y=3; preStage=4'd8;	order = 2; 	end
		state37: begin nextState = state38; X=2; Y=3; preStage=4'd8;	order = 2; 	end
		state38: begin nextState = state39; X=1; Y=3; preStage=4'd8;	order = 2; 	end
		state39: begin nextState = state40; X=0; Y=3; preStage=4'd8;	order = 2; 	end
		state40: begin nextState = state41; X=7; Y=2; preStage=4'd8;	order = 2; 	end
		state41: begin nextState = state42; X=6; Y=2; preStage=4'd8;	order = 2; 	end
		state42: begin nextState = state43; X=5; Y=2; preStage=4'd8;	order = 2; 	end
		state43: begin nextState = state44; X=4; Y=2; preStage=4'd8;	order = 2; 	end
		state44: begin nextState = state45; X=3; Y=2; preStage=4'd8;	order = 2; 	end
		state45: begin nextState = state46; X=2; Y=2; preStage=4'd8;	order = 2; 	end
		state46: begin nextState = state47; X=1; Y=2; preStage=4'd8;	order = 2; 	end
		state47: begin nextState = state48; X=0; Y=2; preStage=4'd8;	order = 2; 	end
		state48: begin nextState = state49; X=7; Y=1; preStage=4'd8;	order = 2; 	end
		state49: begin nextState = state50; X=6; Y=1; preStage=4'd8;	order = 2; 	end
		state50: begin nextState = state51; X=5; Y=1; preStage=4'd8;	order = 2; 	end
		state51: begin nextState = state52; X=4; Y=1; preStage=4'd8;	order = 2; 	end
		state52: begin nextState = state53; X=3; Y=1; preStage=4'd8;	order = 2; 	end
		state53: begin nextState = state54; X=2; Y=1; preStage=4'd8;	order = 2; 	end
		state54: begin nextState = state55; X=1; Y=1; preStage=4'd8;	order = 2; 	end
		state55: begin nextState = state56; X=0; Y=1; preStage=4'd8;	order = 2; 	end
		state56: begin nextState = state57; X=7; Y=0; preStage=4'd8;	order = 2; 	end
		state57: begin nextState = state58; X=6; Y=0; preStage=4'd8;	order = 2; 	end
		state58: begin nextState = state59; X=5; Y=0; preStage=4'd8;	order = 2; 	end
		state59: begin nextState = state60; X=4; Y=0; preStage=4'd8;	order = 2; 	end
		state60: begin nextState = state61; X=3; Y=0; preStage=4'd8;	order = 2;	end		
		state61: begin nextState = state62; X=2; Y=0; preStage=4'd8;	order = 5;	end	
		state62: begin nextState = state63; X=1; Y=0; preStage=4'd8;	order = 6;	end
	//	state63: begin nextState = starState; X=0; Y=0; preStage=4'd8;	order = 7;	end         
		default: begin nextState = starState; X=0; Y=0; preStage=4'd8;	order = 7;	end         
        endcase
    end
    
    else
		nextState = currentState;   //X=0; Y=0;   order=0;  
	end


  
endmodule
