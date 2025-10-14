if (C_PORT_ENABLE[5] == 1'b1) begin: P5_cmd_field_mapping

   if (C_P5_PORT_MODE == "RD_MODE") begin: RD_P5_cmd_field_mapping
      if (C_PORT_ENABLE[0] == 1'b1) begin: RD_P5_equal_P0_cmd_field
         assign p5_mcb_cmd_en_sig          = p0_mcb_cmd_en; 
         assign p5_mcb_cmd_instr_sig       = p0_mcb_cmd_instr;
         assign p5_mcb_cmd_addr_sig        = p0_mcb_cmd_addr;
         assign p5_mcb_cmd_bl_sig          = p0_mcb_cmd_bl;
         assign p5_mcb_wr_en_sig           = p0_mcb_wr_en;
      end	 
      else if (C_PORT_ENABLE[1] == 1'b1) begin: RD_P5_equal_P1_cmd_field
         assign p5_mcb_cmd_en_sig          = p1_mcb_cmd_en; 
         assign p5_mcb_cmd_instr_sig       = p1_mcb_cmd_instr;
         assign p5_mcb_cmd_addr_sig        = p1_mcb_cmd_addr;
         assign p5_mcb_cmd_bl_sig          = p1_mcb_cmd_bl;
         assign p5_mcb_wr_en_sig           = p1_mcb_wr_en;
      end	 
        else if ((C_PORT_ENABLE[2] == 1'b1) && (C_P2_PORT_MODE == "WR_MODE"))  begin: RD_P5_equal_P2_cmd_field
         assign p5_mcb_cmd_en_sig          = p2_mcb_cmd_en; 
         assign p5_mcb_cmd_instr_sig       = p2_mcb_cmd_instr;
         assign p5_mcb_cmd_addr_sig        = p2_mcb_cmd_addr;
         assign p5_mcb_cmd_bl_sig          = p2_mcb_cmd_bl;
         assign p5_mcb_wr_en_sig           = p2_mcb_wr_en;
      end	 
        else if ((C_PORT_ENABLE[3] == 1'b1) && (C_P3_PORT_MODE == "WR_MODE")) begin: RD_P5_equal_P3_cmd_field
         assign p5_mcb_cmd_en_sig          = p3_mcb_cmd_en; 
         assign p5_mcb_cmd_instr_sig       = p3_mcb_cmd_instr;
         assign p5_mcb_cmd_addr_sig        = p3_mcb_cmd_addr;
         assign p5_mcb_cmd_bl_sig          = p3_mcb_cmd_bl;
         assign p5_mcb_wr_en_sig           = p3_mcb_wr_en;
      end	 
        else if ((C_PORT_ENABLE[4] == 1'b1) && (C_P4_PORT_MODE == "WR_MODE")) begin: RD_P5_equal_P4_cmd_field
         assign p5_mcb_cmd_en_sig          = p4_mcb_cmd_en; 
         assign p5_mcb_cmd_instr_sig       = p4_mcb_cmd_instr;
         assign p5_mcb_cmd_addr_sig        = p4_mcb_cmd_addr;
         assign p5_mcb_cmd_bl_sig          = p4_mcb_cmd_bl;
         assign p5_mcb_wr_en_sig           = p4_mcb_wr_en;
      end
        else begin: RD_P5_equal_P5_cmd_field
         assign p5_mcb_cmd_en_sig          = p5_mcb_cmd_en; 
         assign p5_mcb_cmd_instr_sig       = p5_mcb_cmd_instr;
         assign p5_mcb_cmd_addr_sig        = p5_mcb_cmd_addr;
         assign p5_mcb_cmd_bl_sig          = p5_mcb_cmd_bl;
         assign p5_mcb_wr_en_sig           = p5_mcb_wr_en;
      end
   end   
   else begin: WR_P5_cmd_field_mapping
      assign p5_mcb_cmd_en_sig          = p5_mcb_cmd_en; 
      assign p5_mcb_cmd_instr_sig       = p5_mcb_cmd_instr;
      assign p5_mcb_cmd_addr_sig        = p5_mcb_cmd_addr;
      assign p5_mcb_cmd_bl_sig          = p5_mcb_cmd_bl;
      assign p5_mcb_wr_en_sig           = p5_mcb_wr_en;
   end
end 