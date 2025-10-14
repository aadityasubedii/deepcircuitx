always@(posedge mdc_i)
    begin
    case (md_state_r)
    
        MD_IDLE:
            begin
            md_count_r <= 'd0;
            if (md_io == 1'd0)
                md_state_r   <= MD_START0;
            end
            
            
        MD_START0:
            begin
            if (md_io == 1'd1)
                md_state_r   <= MD_START1;
            else
                md_state_r   <= MD_IDLE;
            end
            
            
        MD_START1:
            begin
            if (md_io == 1'd1)
                md_state_r  <= MD_READ0;
            else
                md_state_r  <= MD_WRITE0;
            end
            
            
       MD_READ0:
            begin
            if (md_io == 1'd0)
                begin
                md_state_r  <= MD_PHYADDR;
                md_op_r     <= MDREAD;
                end
            else
                md_state_r  <= MD_IDLE;
            end 
            
            
       MD_WRITE0:
            begin
            if (md_io == 1'd1)
                begin
                md_state_r  <= MD_PHYADDR;
                md_op_r     <= MDWRITE;
                end
            else
                md_state_r  <= MD_IDLE;
            end 
            
        MD_PHYADDR:
            begin
            md_count_r      <= md_count_r + 1'd1;
            md_phy_addr_r   <= {md_phy_addr_r[3:0], md_io};
            
            if (md_count_r == 5'd4)
                begin
                md_state_r  <= MD_REGADDR;
                md_count_r  <= 'd0;                
                end
            end
            
        MD_REGADDR:
            begin
            md_count_r      <= md_count_r + 1'd1;
            md_reg_addr_r   <= {md_reg_addr_r[3:0], md_io};
            
            if (md_count_r == 5'd4)
                begin
                md_count_r  <= 'd0;                
                md_state_r  <= MD_TURN0;
                end
            end


        MD_TURN0:
            md_state_r  <= MD_TURN1;

        MD_TURN1:
            begin
            if (md_op_r == MDREAD)
                md_state_r  <= MD_RDATA;
            else    
                md_state_r  <= MD_WDATA;
                
            case (md_reg_addr_r)
                MII_BMCR        : md_rdata_r <= md_bmcr_r;
                MII_BMSR        : md_rdata_r <= 16'hfe04;
                MII_CTRL1000    : md_rdata_r <= md_ctrl1000_r;
                default         : md_rdata_r <= 'd0;   
            endcase
            end
            
            
        MD_RDATA:
            begin
            md_count_r  <= md_count_r + 1'd1;
            md_rdata_r  <= {md_rdata_r[14:0], 1'd0};
            
            if (md_count_r == 5'd15)
                md_state_r  <= MD_IDLE;
            
            end


        MD_WDATA:
            begin
            md_count_r  <= md_count_r + 1'd1;
            md_wdata_r  <= {md_wdata_r[14:0], md_io};
            
            if (md_count_r == 5'd15)
                begin
                md_state_r  <= MD_WXFR;
                md_count_r  <= 'd0;                
                end
            end


        MD_WXFR:
            begin
            case (md_reg_addr_r)
                MII_BMCR        : md_bmcr_r     <= md_wdata_r;
                MII_CTRL1000    : md_ctrl1000_r <= md_wdata_r;
            endcase
            md_state_r  <= MD_IDLE;
            end
            
            
    endcase
    end