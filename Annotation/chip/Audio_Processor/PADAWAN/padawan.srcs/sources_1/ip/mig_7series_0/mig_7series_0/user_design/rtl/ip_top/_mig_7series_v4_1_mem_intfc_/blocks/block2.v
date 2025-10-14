        always @ (slot_0_present[0] or slot_0_present[1]
                or slot_1_present[0] or slot_1_present[1]) begin
        case ({slot_0_present[0],slot_0_present[1],
               slot_1_present[0],slot_1_present[1]})
          
          4'b1000: begin
             slot_0_present_mc = 8'b0000_0001;
             slot_1_present_mc = 8'b0000_0000;
          end
          4'b0010: begin
            slot_0_present_mc = 8'b0000_0000;
            slot_1_present_mc = 8'b0000_0010;
          end
          
          4'b1100: begin
            slot_0_present_mc = 8'b0000_0101;
            slot_1_present_mc = 8'b0000_0000;
          end
          4'b0011: begin
            slot_0_present_mc = 8'b0000_0000;
            slot_1_present_mc = 8'b0000_1010;
          end
          
          4'b1010: begin
            slot_0_present_mc = 8'b0000_0001;
            slot_1_present_mc = 8'b0000_0010;
          end
          
          4'b1011: begin
            slot_0_present_mc = 8'b0000_0001;
            slot_1_present_mc = 8'b0000_1010;
          end
          4'b1110: begin
            slot_0_present_mc = 8'b0000_0101;
            slot_1_present_mc = 8'b0000_0010;
          end
          
          4'b1111: begin
            slot_0_present_mc = 8'b0000_0101;
            slot_1_present_mc = 8'b0000_1010;
          end
        endcase
      end