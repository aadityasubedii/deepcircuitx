module I2Cstate(
    output		          		FPGA_I2C_SCLK,
	inout 		          		FPGA_I2C_SDAT,
    input                       clk,
    input                       reset_n
    
);



// Creating states
parameter Wait_For_Transmit = 4'b0000;
parameter Start_Condition = 4'b0001;
parameter Send_Address = 4'b0010;
parameter ACK_1 = 4'b0011;
parameter Send_Data_1 = 4'b0100;
parameter ACK_2 = 4'b0101;
parameter Send_Data_2 = 4'b0110;
parameter ACK_3 = 4'b0111;
parameter Stop_Condition = 4'b1000;



//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] next_state;
reg [3:0] current_state;
reg [15:0] mem;
reg [1:0] mem_counter;
reg [2:0] ACK_received;
reg ACK_cycle;
wire returned_ack_n;
reg SDAT;
wire mem_clk;
wire [7:0] Chip_Address;
wire [7:0] Data1;
wire [7:0] Data2;
reg clockHold;
reg [3:0] Q;
assign Chip_Address = 8'b0011_0100;
assign Data1 = 8'b0001_1110;
assign Data2 = 8'b0000_0000;
reg [1:0] offsetClk;
reg dataClk;
reg clkClk;

// assign SDAT = FPGA_I2C_SDAT;
assign returned_ack_n = FPGA_I2C_SDAT; // only read this during the ACK_cycle 
assign FPGA_I2C_SDAT = ACK_cycle ? 1'bZ : SDAT;


//offset clock counter for sda to change at low scl
always @ (posedge clk or negedge reset_n)
begin
    if (reset_n == 0)
        begin
            offsetClk = 0;
        end    
    else if(offsetClk == 3)
    begin
        offsetClk = 0;
    end
    else
    begin
        offsetClk = offsetClk + 1;
    end
end

always @ (posedge clk or negedge reset_n)
begin
    if (reset_n == 0)
        begin
            dataClk = 1;
            clkClk = 0;
        end
    
    else if(offsetClk == 0 || offsetClk == 2)
        begin
        clkClk = ~clkClk;
        end
    else if(offsetClk == 1 || offsetClk == 3)
        begin
        dataClk = ~dataClk;
        end


end



// Current State Logic
always @(negedge dataClk or negedge reset_n)
    if (reset_n == 0)
        current_state = Wait_For_Transmit;
    else
        current_state = next_state;





// Next State Logic
always @(*)
    begin
        case (current_state)
            Wait_For_Transmit: 
            begin
				next_state = Start_Condition;
            end
            Start_Condition:
            begin
				next_state = Send_Address;
            end
            Send_Address:
            begin
				if (Q == 0)
					next_state = ACK_1;
				else
					next_state = Send_Address;
            end
            ACK_1:
            begin
				if (ACK_received == 3'b001)
					next_state = Send_Data_1;
				else
					next_state = Wait_For_Transmit;
            end
            Send_Data_1:
            begin
				if (Q == 0)
					next_state = ACK_2;
				else
					next_state = Send_Data_1;
			end
            ACK_2:
            begin
				if (ACK_received == 3'b010)
					next_state = Send_Data_2;
				else
					next_state = Wait_For_Transmit;
            end
			Send_Data_2:
            begin
				if (Q == 0)
					next_state = ACK_3;
				else
					next_state = Send_Data_2;
			end
			ACK_3:
			begin
				if (ACK_received == 3'b100)
					next_state = Stop_Condition;
				else
					next_state = Wait_For_Transmit;
			end
			Stop_Condition:
			begin
				next_state = Wait_For_Transmit;
			end
        endcase
    end


always @(posedge clkClk)
begin
    if (current_state == Send_Address && Q == 0)
        Q <= 7;
	else if (current_state == Send_Data_1 && Q == 0)
		Q <= 7;
	else if (current_state == Send_Data_2 && Q == 0)
		Q <= 7;
    else if (Q != 0)
        Q <= Q - 1;
    else
        Q <= 0;
end
always @(posedge clk)
begin
	// Multiplexer for SCLK
	if (current_state == Wait_For_Transmit || current_state == Stop_Condition || current_state == Start_Condition)
		clockHold = 1;
	else
		clockHold = ~clkClk; //should be the divided clock
end
// Output Logic
always @(posedge dataClk or negedge reset_n)
    begin
        case (current_state)
            Wait_For_Transmit: 
            begin
				ACK_cycle = 0;
				SDAT = 1;
            end
            Start_Condition:
            begin
				ACK_cycle = 0;
                SDAT = 0;
            end
            Send_Address:
            begin
				ACK_cycle = 0;
                SDAT = Chip_Address[Q];
            end
            ACK_1:
            begin
				ACK_cycle = 1;
				if(returned_ack_n == 0)
					ACK_received = 3'b001;
				else
					ACK_received = 3'b000;
            end
            Send_Data_1:
            begin
				ACK_cycle = 0;
				SDAT = Data1[Q];
			end
            ACK_2:
            begin
				ACK_cycle = 1;
				if(returned_ack_n == 0)
					ACK_received = 3'b010;
				else
					ACK_received = 3'b000;
            end
			Send_Data_2:
            begin
			    ACK_cycle = 0;
				SDAT = Data2[Q];
			end
			ACK_3:
			begin
				ACK_cycle = 1;
				if(returned_ack_n == 0)
					ACK_received = 3'b100;
				else
					ACK_received = 3'b000;
			end
			Stop_Condition:
			begin
				ACK_cycle = 0;
				SDAT = 1;
			end
        endcase
    end
	assign FPGA_I2C_SCLK = clockHold;
endmodule 