always @ (posedge clk_del) 
begin : simulation
case (instruction[17:12])
	6'b000000	: kcpsm6_opcode <= {"LOAD ", sx_decode, ", ", sy_decode, "        "} ;
	6'b000001	: kcpsm6_opcode <= {"LOAD ", sx_decode, ", ", kk_decode, "        "} ;
	6'b010110	: kcpsm6_opcode <= {"STAR ", sx_decode, ", ", sy_decode, "        "} ;
	6'b010111	: kcpsm6_opcode <= {"STAR ", sx_decode, ", ", kk_decode, "        "} ;
	6'b000010	: kcpsm6_opcode <= {"AND ", sx_decode, ", ", sy_decode, "         "} ;
	6'b000011	: kcpsm6_opcode <= {"AND ", sx_decode, ", ", kk_decode, "         "} ;
	6'b000100	: kcpsm6_opcode <= {"OR ", sx_decode, ", ", sy_decode, "          "} ;
	6'b000101	: kcpsm6_opcode <= {"OR ", sx_decode, ", ", kk_decode, "          "} ;
	6'b000110	: kcpsm6_opcode <= {"XOR ", sx_decode, ", ", sy_decode, "         "} ;
	6'b000111	: kcpsm6_opcode <= {"XOR ", sx_decode, ", ", kk_decode, "         "} ;
	6'b001100	: kcpsm6_opcode <= {"TEST ", sx_decode, ", ", sy_decode, "        "} ;
	6'b001101	: kcpsm6_opcode <= {"TEST ", sx_decode, ", ", kk_decode, "        "} ;
	6'b001110	: kcpsm6_opcode <= {"TESTCY ", sx_decode, ", ", sy_decode, "      "} ;
	6'b001111	: kcpsm6_opcode <= {"TESTCY ", sx_decode, ", ", kk_decode, "      "} ;
	6'b010000	: kcpsm6_opcode <= {"ADD ", sx_decode, ", ", sy_decode, "         "} ;
	6'b010001	: kcpsm6_opcode <= {"ADD ", sx_decode, ", ", kk_decode, "         "} ;
	6'b010010	: kcpsm6_opcode <= {"ADDCY ", sx_decode, ", ", sy_decode, "       "} ;
	6'b010011	: kcpsm6_opcode <= {"ADDCY ", sx_decode, ", ", kk_decode, "       "} ;
	6'b011000	: kcpsm6_opcode <= {"SUB ", sx_decode, ", ", sy_decode, "         "} ;
	6'b011001	: kcpsm6_opcode <= {"SUB ", sx_decode, ", ", kk_decode, "         "} ;
	6'b011010	: kcpsm6_opcode <= {"SUBCY ", sx_decode, ", ", sy_decode, "       "} ;
	6'b011011	: kcpsm6_opcode <= {"SUBCY ", sx_decode, ", ", kk_decode, "       "} ;
	6'b011100	: kcpsm6_opcode <= {"COMPARE ", sx_decode, ", ", sy_decode, "     "} ;
	6'b011101	: kcpsm6_opcode <= {"COMPARE ", sx_decode, ", ", kk_decode, "     "} ;
	6'b011110	: kcpsm6_opcode <= {"COMPARECY ", sx_decode, ", ", sy_decode, "   "} ;
	6'b011111	: kcpsm6_opcode <= {"COMPARECY ", sx_decode, ", ", kk_decode, "   "} ;
	6'b010100	: begin
				if (instruction[7] == 1'b1) 
				  	kcpsm6_opcode <= {"HWBUILD ", sx_decode, "         "} ;
				else
				  	case (instruction[3:0])
				    		4'b0110	: kcpsm6_opcode <= {"SL0 ", sx_decode, "             "} ;
				    		4'b0111	: kcpsm6_opcode <= {"SL1 ", sx_decode, "             "} ;
				    		4'b0100	: kcpsm6_opcode <= {"SLX ", sx_decode, "             "} ;
				    		4'b0000	: kcpsm6_opcode <= {"SLA ", sx_decode, "             "} ;
				    		4'b0010	: kcpsm6_opcode <= {"RL ", sx_decode, "              "} ;
				    		4'b1110	: kcpsm6_opcode <= {"SR0 ", sx_decode, "             "} ;
				    		4'b1111	: kcpsm6_opcode <= {"SR1 ", sx_decode, "             "} ;
				    		4'b1010	: kcpsm6_opcode <= {"SRX ", sx_decode, "             "} ;
				    		4'b1000	: kcpsm6_opcode <= {"SRA ", sx_decode, "             "} ;
				    		4'b1100	: kcpsm6_opcode <= {"RR ", sx_decode, "              "} ;
				    		default	: kcpsm6_opcode <= "Invalid Instruction";
				  	endcase
			end
	6'b101100 	: kcpsm6_opcode <= {"OUTPUT ", sx_decode, ", (", sy_decode, ")    "} ;
	6'b101101 	: kcpsm6_opcode <= {"OUTPUT ", sx_decode, ", ", kk_decode, "      "} ;
	6'b101011 	: kcpsm6_opcode <= {"OUTPUTK ", aaa_decode[1:16], ", ", aaa_decode[17:24], "      " };
	6'b001000 	: kcpsm6_opcode <= {"INPUT ", sx_decode, ", (", sy_decode, ")     "} ;
	6'b001001 	: kcpsm6_opcode <= {"INPUT ", sx_decode, ", ", kk_decode, "       "} ;
	6'b101110 	: kcpsm6_opcode <= {"STORE ", sx_decode, ", (", sy_decode, ")     "} ;
	6'b101111 	: kcpsm6_opcode <= {"STORE ", sx_decode, ", ", kk_decode, "       "} ;
	6'b001010 	: kcpsm6_opcode <= {"FETCH ", sx_decode, ", (", sy_decode, ")     "} ;
	6'b001011 	: kcpsm6_opcode <= {"FETCH ", sx_decode, ", ", kk_decode, "       "} ;
	6'b100010 	: kcpsm6_opcode <= {"JUMP ", aaa_decode, "           "} ;
	6'b110010 	: kcpsm6_opcode <= {"JUMP Z, ", aaa_decode, "        "} ;
	6'b110110 	: kcpsm6_opcode <= {"JUMP NZ, ", aaa_decode, "       "} ;
	6'b111010 	: kcpsm6_opcode <= {"JUMP C, ", aaa_decode, "        "} ;
	6'b111110 	: kcpsm6_opcode <= {"JUMP NC, ", aaa_decode, "       "} ;
	6'b100110 	: kcpsm6_opcode <= {"JUMP@ (", sx_decode, ", ", sy_decode, ")     "} ;
	6'b100000 	: kcpsm6_opcode <= {"CALL ", aaa_decode, "           "} ;
	6'b110000 	: kcpsm6_opcode <= {"CALL Z, ", aaa_decode, "        "} ;
	6'b110100 	: kcpsm6_opcode <= {"CALL NZ, ", aaa_decode, "       "} ;
	6'b111000 	: kcpsm6_opcode <= {"CALL C, ", aaa_decode, "        "} ;
	6'b111100 	: kcpsm6_opcode <= {"CALL NC, ", aaa_decode, "       "} ;
	6'b100100 	: kcpsm6_opcode <= {"CALL@ (", sx_decode, ", ", sy_decode, ")     "} ;
	6'b100101 	: kcpsm6_opcode <= {"RETURN             "} ;
	6'b110001 	: kcpsm6_opcode <= {"RETURN Z           "} ;
	6'b110101 	: kcpsm6_opcode <= {"RETURN NZ          "} ;
	6'b111001 	: kcpsm6_opcode <= {"RETURN C           "} ;
	6'b111101 	: kcpsm6_opcode <= {"RETURN NC          "} ;
	6'b100001 	: kcpsm6_opcode <= {"LOAD&RETURN ", sx_decode, ", ", kk_decode, " "} ;
	6'b101001	: begin
				case (instruction[0])
				  1'b0    : kcpsm6_opcode <= "RETURNI DISABLE    ";
				  1'b1    : kcpsm6_opcode <= "RETURNI ENABLE     ";
				  default : kcpsm6_opcode <= "Invalid Instruction";
				endcase
			end
	6'b101000	: begin
				case (instruction[0])
				  1'b0    : kcpsm6_opcode <= "DISABLE INTERRUPT  ";
				  1'b1    : kcpsm6_opcode <= "ENABLE INTERRUPT   ";
				  default : kcpsm6_opcode <= "Invalid Instruction";
				endcase
			end
	6'b110111	: begin
				case (instruction[0])
				  1'b0 	  : kcpsm6_opcode <= "REGBANK A          ";
				  1'b1 	  : kcpsm6_opcode <= "REGBANK B          ";
				  default : kcpsm6_opcode <= "Invalid Instruction";
				endcase
			end
	default 	: kcpsm6_opcode <= "Invalid Instruction";
endcase





if (zero_flag == 1'b0) 
  	kcpsm6_status[17:40] <= "NZ,";
else
  	kcpsm6_status[17:40] <= " Z,";


if (carry_flag == 1'b0) 
  	kcpsm6_status[41:64] <= "NC,";
else
  	kcpsm6_status[41:64] <= " C,";


if (interrupt_enable == 1'b0) 
   	kcpsm6_status[65:80] <= "ID";
else
  	kcpsm6_status[65:80] <= "IE";




if (clk) begin
if (internal_reset == 1'b1)
    	kcpsm6_status[81 : 128] <= ",Reset";
else
    	if (sync_sleep == 1'b1 && t_state == 2'b00) 
      		kcpsm6_status[81 : 128] <= ",Sleep";
     	else
      		kcpsm6_status[81 : 128] <= "      ";
end



if (clk) begin
	if (register_enable == 1'b1) begin
		case (sx_addr)
			5'b00000	: bank_a_s0 <= alu_result ;
			5'b00001	: bank_a_s1 <= alu_result ;
			5'b00010	: bank_a_s2 <= alu_result ;
			5'b00011	: bank_a_s3 <= alu_result ;
			5'b00100	: bank_a_s4 <= alu_result ;
			5'b00101	: bank_a_s5 <= alu_result ;
			5'b00110	: bank_a_s6 <= alu_result ;
			5'b00111	: bank_a_s7 <= alu_result ;
			5'b01000	: bank_a_s8 <= alu_result ;
			5'b01001	: bank_a_s9 <= alu_result ;
			5'b01010	: bank_a_sa <= alu_result ;
			5'b01011	: bank_a_sb <= alu_result ;
			5'b01100	: bank_a_sc <= alu_result ;
			5'b01101	: bank_a_sd <= alu_result ;
			5'b01110	: bank_a_se <= alu_result ;
			5'b01111	: bank_a_sf <= alu_result ;
			5'b10000	: bank_b_s0 <= alu_result ;
			5'b10001	: bank_b_s1 <= alu_result ;
			5'b10010	: bank_b_s2 <= alu_result ;
			5'b10011	: bank_b_s3 <= alu_result ;
			5'b10100	: bank_b_s4 <= alu_result ;
			5'b10101	: bank_b_s5 <= alu_result ;
			5'b10110	: bank_b_s6 <= alu_result ;
			5'b10111	: bank_b_s7 <= alu_result ;
			5'b11000	: bank_b_s8 <= alu_result ;
			5'b11001	: bank_b_s9 <= alu_result ;
			5'b11010	: bank_b_sa <= alu_result ;
			5'b11011	: bank_b_sb <= alu_result ;
			5'b11100	: bank_b_sc <= alu_result ;
			5'b11101	: bank_b_sd <= alu_result ;
			5'b11110	: bank_b_se <= alu_result ;
			5'b11111	: bank_b_sf <= alu_result ;
		endcase
	end


if (spm_enable == 1'b1) begin
	case (sy_or_kk)
		8'b00000000	: sim_spm00 <= sx;
		8'b00000001	: sim_spm01 <= sx;
		8'b00000010	: sim_spm02 <= sx;
		8'b00000011	: sim_spm03 <= sx;
		8'b00000100	: sim_spm04 <= sx;
		8'b00000101	: sim_spm05 <= sx;
		8'b00000110	: sim_spm06 <= sx;
		8'b00000111	: sim_spm07 <= sx;
		8'b00001000	: sim_spm08 <= sx;
		8'b00001001	: sim_spm09 <= sx;
		8'b00001010	: sim_spm0A <= sx;
		8'b00001011	: sim_spm0B <= sx;
		8'b00001100	: sim_spm0C <= sx;
		8'b00001101	: sim_spm0D <= sx;
		8'b00001110	: sim_spm0E <= sx;
		8'b00001111	: sim_spm0F <= sx;
		8'b00010000	: sim_spm10 <= sx;
		8'b00010001	: sim_spm11 <= sx;
		8'b00010010	: sim_spm12 <= sx;
		8'b00010011	: sim_spm13 <= sx;
		8'b00010100	: sim_spm14 <= sx;
		8'b00010101	: sim_spm15 <= sx;
		8'b00010110	: sim_spm16 <= sx;
		8'b00010111	: sim_spm17 <= sx;
		8'b00011000	: sim_spm18 <= sx;
		8'b00011001	: sim_spm19 <= sx;
		8'b00011010	: sim_spm1A <= sx;
		8'b00011011	: sim_spm1B <= sx;
		8'b00011100	: sim_spm1C <= sx;
		8'b00011101	: sim_spm1D <= sx;
		8'b00011110	: sim_spm1E <= sx;
		8'b00011111	: sim_spm1F <= sx;
		8'b00100000	: sim_spm20 <= sx;
		8'b00100001	: sim_spm21 <= sx;
		8'b00100010	: sim_spm22 <= sx;
		8'b00100011	: sim_spm23 <= sx;
		8'b00100100	: sim_spm24 <= sx;
		8'b00100101	: sim_spm25 <= sx;
		8'b00100110	: sim_spm26 <= sx;
		8'b00100111	: sim_spm27 <= sx;
		8'b00101000	: sim_spm28 <= sx;
		8'b00101001	: sim_spm29 <= sx;
		8'b00101010	: sim_spm2A <= sx;
		8'b00101011	: sim_spm2B <= sx;
		8'b00101100	: sim_spm2C <= sx;
		8'b00101101	: sim_spm2D <= sx;
		8'b00101110	: sim_spm2E <= sx;
		8'b00101111	: sim_spm2F <= sx;
		8'b00110000	: sim_spm30 <= sx;
		8'b00110001	: sim_spm31 <= sx;
		8'b00110010	: sim_spm32 <= sx;
		8'b00110011	: sim_spm33 <= sx;
		8'b00110100	: sim_spm34 <= sx;
		8'b00110101	: sim_spm35 <= sx;
		8'b00110110	: sim_spm36 <= sx;
		8'b00110111	: sim_spm37 <= sx;
		8'b00111000	: sim_spm38 <= sx;
		8'b00111001	: sim_spm39 <= sx;
		8'b00111010	: sim_spm3A <= sx;
		8'b00111011	: sim_spm3B <= sx;
		8'b00111100	: sim_spm3C <= sx;
		8'b00111101	: sim_spm3D <= sx;
		8'b00111110	: sim_spm3E <= sx;
		8'b00111111	: sim_spm3F <= sx;
		8'b01000000	: sim_spm40 <= sx;
		8'b01000001	: sim_spm41 <= sx;
		8'b01000010	: sim_spm42 <= sx;
		8'b01000011	: sim_spm43 <= sx;
		8'b01000100	: sim_spm44 <= sx;
		8'b01000101	: sim_spm45 <= sx;
		8'b01000110	: sim_spm46 <= sx;
		8'b01000111	: sim_spm47 <= sx;
		8'b01001000	: sim_spm48 <= sx;
		8'b01001001	: sim_spm49 <= sx;
		8'b01001010	: sim_spm4A <= sx;
		8'b01001011	: sim_spm4B <= sx;
		8'b01001100	: sim_spm4C <= sx;
		8'b01001101	: sim_spm4D <= sx;
		8'b01001110	: sim_spm4E <= sx;
		8'b01001111	: sim_spm4F <= sx;
		8'b01010000	: sim_spm50 <= sx;
		8'b01010001	: sim_spm51 <= sx;
		8'b01010010	: sim_spm52 <= sx;
		8'b01010011	: sim_spm53 <= sx;
		8'b01010100	: sim_spm54 <= sx;
		8'b01010101	: sim_spm55 <= sx;
		8'b01010110	: sim_spm56 <= sx;
		8'b01010111	: sim_spm57 <= sx;
		8'b01011000	: sim_spm58 <= sx;
		8'b01011001	: sim_spm59 <= sx;
		8'b01011010	: sim_spm5A <= sx;
		8'b01011011	: sim_spm5B <= sx;
		8'b01011100	: sim_spm5C <= sx;
		8'b01011101	: sim_spm5D <= sx;
		8'b01011110	: sim_spm5E <= sx;
		8'b01011111	: sim_spm5F <= sx;
		8'b01100000	: sim_spm60 <= sx;
		8'b01100001	: sim_spm61 <= sx;
		8'b01100010	: sim_spm62 <= sx;
		8'b01100011	: sim_spm63 <= sx;
		8'b01100100	: sim_spm64 <= sx;
		8'b01100101	: sim_spm65 <= sx;
		8'b01100110	: sim_spm66 <= sx;
		8'b01100111	: sim_spm67 <= sx;
		8'b01101000	: sim_spm68 <= sx;
		8'b01101001	: sim_spm69 <= sx;
		8'b01101010	: sim_spm6A <= sx;
		8'b01101011	: sim_spm6B <= sx;
		8'b01101100	: sim_spm6C <= sx;
		8'b01101101	: sim_spm6D <= sx;
		8'b01101110	: sim_spm6E <= sx;
		8'b01101111	: sim_spm6F <= sx;
		8'b01110000	: sim_spm70 <= sx;
		8'b01110001	: sim_spm71 <= sx;
		8'b01110010	: sim_spm72 <= sx;
		8'b01110011	: sim_spm73 <= sx;
		8'b01110100	: sim_spm74 <= sx;
		8'b01110101	: sim_spm75 <= sx;
		8'b01110110	: sim_spm76 <= sx;
		8'b01110111	: sim_spm77 <= sx;
		8'b01111000	: sim_spm78 <= sx;
		8'b01111001	: sim_spm79 <= sx;
		8'b01111010	: sim_spm7A <= sx;
		8'b01111011	: sim_spm7B <= sx;
		8'b01111100	: sim_spm7C <= sx;
		8'b01111101	: sim_spm7D <= sx;
		8'b01111110	: sim_spm7E <= sx;
		8'b01111111	: sim_spm7F <= sx;
		8'b10000000	: sim_spm80 <= sx;
		8'b10000001	: sim_spm81 <= sx;
		8'b10000010	: sim_spm82 <= sx;
		8'b10000011	: sim_spm83 <= sx;
		8'b10000100	: sim_spm84 <= sx;
		8'b10000101	: sim_spm85 <= sx;
		8'b10000110	: sim_spm86 <= sx;
		8'b10000111	: sim_spm87 <= sx;
		8'b10001000	: sim_spm88 <= sx;
		8'b10001001	: sim_spm89 <= sx;
		8'b10001010	: sim_spm8A <= sx;
		8'b10001011	: sim_spm8B <= sx;
		8'b10001100	: sim_spm8C <= sx;
		8'b10001101	: sim_spm8D <= sx;
		8'b10001110	: sim_spm8E <= sx;
		8'b10001111	: sim_spm8F <= sx;
		8'b10010000	: sim_spm90 <= sx;
		8'b10010001	: sim_spm91 <= sx;
		8'b10010010	: sim_spm92 <= sx;
		8'b10010011	: sim_spm93 <= sx;
		8'b10010100	: sim_spm94 <= sx;
		8'b10010101	: sim_spm95 <= sx;
		8'b10010110	: sim_spm96 <= sx;
		8'b10010111	: sim_spm97 <= sx;
		8'b10011000	: sim_spm98 <= sx;
		8'b10011001	: sim_spm99 <= sx;
		8'b10011010	: sim_spm9A <= sx;
		8'b10011011	: sim_spm9B <= sx;
		8'b10011100	: sim_spm9C <= sx;
		8'b10011101	: sim_spm9D <= sx;
		8'b10011110	: sim_spm9E <= sx;
		8'b10011111	: sim_spm9F <= sx;
		8'b10100000	: sim_spmA0 <= sx;
		8'b10100001	: sim_spmA1 <= sx;
		8'b10100010	: sim_spmA2 <= sx;
		8'b10100011	: sim_spmA3 <= sx;
		8'b10100100	: sim_spmA4 <= sx;
		8'b10100101	: sim_spmA5 <= sx;
		8'b10100110	: sim_spmA6 <= sx;
		8'b10100111	: sim_spmA7 <= sx;
		8'b10101000	: sim_spmA8 <= sx;
		8'b10101001	: sim_spmA9 <= sx;
		8'b10101010	: sim_spmAA <= sx;
		8'b10101011	: sim_spmAB <= sx;
		8'b10101100	: sim_spmAC <= sx;
		8'b10101101	: sim_spmAD <= sx;
		8'b10101110	: sim_spmAE <= sx;
		8'b10101111	: sim_spmAF <= sx;
		8'b10110000	: sim_spmB0 <= sx;
		8'b10110001	: sim_spmB1 <= sx;
		8'b10110010	: sim_spmB2 <= sx;
		8'b10110011	: sim_spmB3 <= sx;
		8'b10110100	: sim_spmB4 <= sx;
		8'b10110101	: sim_spmB5 <= sx;
		8'b10110110	: sim_spmB6 <= sx;
		8'b10110111	: sim_spmB7 <= sx;
		8'b10111000	: sim_spmB8 <= sx;
		8'b10111001	: sim_spmB9 <= sx;
		8'b10111010	: sim_spmBA <= sx;
		8'b10111011	: sim_spmBB <= sx;
		8'b10111100	: sim_spmBC <= sx;
		8'b10111101	: sim_spmBD <= sx;
		8'b10111110	: sim_spmBE <= sx;
		8'b10111111	: sim_spmBF <= sx;
		8'b11000000	: sim_spmC0 <= sx;
		8'b11000001	: sim_spmC1 <= sx;
		8'b11000010	: sim_spmC2 <= sx;
		8'b11000011	: sim_spmC3 <= sx;
		8'b11000100	: sim_spmC4 <= sx;
		8'b11000101	: sim_spmC5 <= sx;
		8'b11000110	: sim_spmC6 <= sx;
		8'b11000111	: sim_spmC7 <= sx;
		8'b11001000	: sim_spmC8 <= sx;
		8'b11001001	: sim_spmC9 <= sx;
		8'b11001010	: sim_spmCA <= sx;
		8'b11001011	: sim_spmCB <= sx;
		8'b11001100	: sim_spmCC <= sx;
		8'b11001101	: sim_spmCD <= sx;
		8'b11001110	: sim_spmCE <= sx;
		8'b11001111	: sim_spmCF <= sx;
		8'b11010000	: sim_spmD0 <= sx;
		8'b11010001	: sim_spmD1 <= sx;
		8'b11010010	: sim_spmD2 <= sx;
		8'b11010011	: sim_spmD3 <= sx;
		8'b11010100	: sim_spmD4 <= sx;
		8'b11010101	: sim_spmD5 <= sx;
		8'b11010110	: sim_spmD6 <= sx;
		8'b11010111	: sim_spmD7 <= sx;
		8'b11011000	: sim_spmD8 <= sx;
		8'b11011001	: sim_spmD9 <= sx;
		8'b11011010	: sim_spmDA <= sx;
		8'b11011011	: sim_spmDB <= sx;
		8'b11011100	: sim_spmDC <= sx;
		8'b11011101	: sim_spmDD <= sx;
		8'b11011110	: sim_spmDE <= sx;
		8'b11011111	: sim_spmDF <= sx;
		8'b11100000	: sim_spmE0 <= sx;
		8'b11100001	: sim_spmE1 <= sx;
		8'b11100010	: sim_spmE2 <= sx;
		8'b11100011	: sim_spmE3 <= sx;
		8'b11100100	: sim_spmE4 <= sx;
		8'b11100101	: sim_spmE5 <= sx;
		8'b11100110	: sim_spmE6 <= sx;
		8'b11100111	: sim_spmE7 <= sx;
		8'b11101000	: sim_spmE8 <= sx;
		8'b11101001	: sim_spmE9 <= sx;
		8'b11101010	: sim_spmEA <= sx;
		8'b11101011	: sim_spmEB <= sx;
		8'b11101100	: sim_spmEC <= sx;
		8'b11101101	: sim_spmED <= sx;
		8'b11101110	: sim_spmEE <= sx;
		8'b11101111	: sim_spmEF <= sx;
		8'b11110000	: sim_spmF0 <= sx;
		8'b11110001	: sim_spmF1 <= sx;
		8'b11110010	: sim_spmF2 <= sx;
		8'b11110011	: sim_spmF3 <= sx;
		8'b11110100	: sim_spmF4 <= sx;
		8'b11110101	: sim_spmF5 <= sx;
		8'b11110110	: sim_spmF6 <= sx;
		8'b11110111	: sim_spmF7 <= sx;
		8'b11111000	: sim_spmF8 <= sx;
		8'b11111001	: sim_spmF9 <= sx;
		8'b11111010	: sim_spmFA <= sx;
		8'b11111011	: sim_spmFB <= sx;
		8'b11111100	: sim_spmFC <= sx;
		8'b11111101	: sim_spmFD <= sx;
		8'b11111110	: sim_spmFE <= sx;
		8'b11111111	: sim_spmFF <= sx;
    endcase
end

end




if (bank == 1'b0) begin
	kcpsm6_status[1:16] <= "A,";
	sim_s0 <= bank_a_s0 ;
	sim_s1 <= bank_a_s1 ;
	sim_s2 <= bank_a_s2 ;
	sim_s3 <= bank_a_s3 ;
	sim_s4 <= bank_a_s4 ;
	sim_s5 <= bank_a_s5 ;
	sim_s6 <= bank_a_s6 ;
	sim_s7 <= bank_a_s7 ;
	sim_s8 <= bank_a_s8 ;
	sim_s9 <= bank_a_s9 ;
	sim_sA <= bank_a_sa ;
	sim_sB <= bank_a_sb ;
	sim_sC <= bank_a_sc ;
	sim_sD <= bank_a_sd ;
	sim_sE <= bank_a_se ;
	sim_sF <= bank_a_sf ;
end
else begin
	kcpsm6_status[1:16] <= "B,";
	sim_s0 <= bank_b_s0 ;
	sim_s1 <= bank_b_s1 ;
	sim_s2 <= bank_b_s2 ;
	sim_s3 <= bank_b_s3 ;
	sim_s4 <= bank_b_s4 ;
	sim_s5 <= bank_b_s5 ;
	sim_s6 <= bank_b_s6 ;
	sim_s7 <= bank_b_s7 ;
	sim_s8 <= bank_b_s8 ;
	sim_s9 <= bank_b_s9 ;
	sim_sA <= bank_b_sa ;
	sim_sB <= bank_b_sb ;
	sim_sC <= bank_b_sc ;
	sim_sD <= bank_b_sd ;
	sim_sE <= bank_b_se ;
	sim_sF <= bank_b_sf ;
end


end 
  