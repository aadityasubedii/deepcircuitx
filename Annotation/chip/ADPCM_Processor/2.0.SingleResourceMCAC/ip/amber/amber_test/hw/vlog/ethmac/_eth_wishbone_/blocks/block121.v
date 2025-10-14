always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      MasterWbTX <=#Tp 1'b0;
      MasterWbRX <=#Tp 1'b0;
      m_wb_adr_o <=#Tp 30'h0;
      m_wb_cyc_o <=#Tp 1'b0;
      m_wb_we_o  <=#Tp 1'b0;
      m_wb_sel_o <=#Tp 4'h0;
      cyc_cleared<=#Tp 1'b0;
      tx_burst_cnt<=#Tp 0;
      rx_burst_cnt<=#Tp 0;
      IncrTxPointer<=#Tp 1'b0;
      tx_burst_en<=#Tp 1'b1;
      rx_burst_en<=#Tp 1'b0;
      `ifdef ETH_WISHBONE_B3
        m_wb_cti_o <=#Tp 3'b0;
      `endif
    end
  else
    begin
      
      casex ({MasterWbTX, MasterWbRX, ReadTxDataFromMemory_2, WriteRxDataToMemory, MasterAccessFinished, cyc_cleared, tx_burst, rx_burst})  
        8'b00_10_00_10,             
        8'b10_1x_10_1x,             
        8'b10_10_01_10,             
        8'b01_1x_01_1x :            
          begin
            MasterWbTX <=#Tp 1'b1;  
            MasterWbRX <=#Tp 1'b0;
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b0;
            m_wb_sel_o <=#Tp 4'hf;
            cyc_cleared<=#Tp 1'b0;
            IncrTxPointer<=#Tp 1'b1;
            tx_burst_cnt <=#Tp tx_burst_cnt+3'h1;
            if(tx_burst_cnt==0)
              m_wb_adr_o <=#Tp TxPointerMSB;
            else
              m_wb_adr_o <=#Tp m_wb_adr_o+1'b1;

            if(tx_burst_cnt==(`ETH_BURST_LENGTH-1))
              begin
                tx_burst_en<=#Tp 1'b0;
              `ifdef ETH_WISHBONE_B3
                m_wb_cti_o <=#Tp 3'b111;
              `endif
              end
            else
              begin
              `ifdef ETH_WISHBONE_B3
                m_wb_cti_o <=#Tp 3'b010;
              `endif
              end
          end
        8'b00_x1_00_x1,             
        8'b01_x1_10_x1,             
        8'b01_01_01_01,             
        8'b10_x1_01_x1 :            
          begin
            MasterWbTX <=#Tp 1'b0;  
            MasterWbRX <=#Tp 1'b1;
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b1;
            m_wb_sel_o <=#Tp RxByteSel;
            IncrTxPointer<=#Tp 1'b0;
            cyc_cleared<=#Tp 1'b0;
            rx_burst_cnt <=#Tp rx_burst_cnt+3'h1;

            if(rx_burst_cnt==0)
              m_wb_adr_o <=#Tp RxPointerMSB;
            else
              m_wb_adr_o <=#Tp m_wb_adr_o+1'b1;

            if(rx_burst_cnt==(`ETH_BURST_LENGTH-1))
              begin
                rx_burst_en<=#Tp 1'b0;
              `ifdef ETH_WISHBONE_B3
                m_wb_cti_o <=#Tp 3'b111;
              `endif
              end
            else
              begin
              `ifdef ETH_WISHBONE_B3
                m_wb_cti_o <=#Tp 3'b010;
              `endif
              end
          end
        8'b00_x1_00_x0 :            
          begin
            MasterWbTX <=#Tp 1'b0;
            MasterWbRX <=#Tp 1'b1;
            m_wb_adr_o <=#Tp RxPointerMSB;
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b1;
            m_wb_sel_o <=#Tp RxByteSel;
            IncrTxPointer<=#Tp 1'b0;
          end
        8'b00_10_00_00 :            
          begin
            MasterWbTX <=#Tp 1'b1;
            MasterWbRX <=#Tp 1'b0;
            m_wb_adr_o <=#Tp TxPointerMSB;
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b0;
            m_wb_sel_o <=#Tp 4'hf;
            IncrTxPointer<=#Tp 1'b1;
          end
        8'b10_10_01_00,             
        8'b01_1x_01_0x  :           
          begin
            MasterWbTX <=#Tp 1'b1;
            MasterWbRX <=#Tp 1'b0;
            m_wb_adr_o <=#Tp TxPointerMSB;
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b0;
            m_wb_sel_o <=#Tp 4'hf;
            cyc_cleared<=#Tp 1'b0;
            IncrTxPointer<=#Tp 1'b1;
          end
        8'b01_01_01_00,             
        8'b10_x1_01_x0  :           
          begin
            MasterWbTX <=#Tp 1'b0;
            MasterWbRX <=#Tp 1'b1;
            m_wb_adr_o <=#Tp RxPointerMSB;
            m_wb_cyc_o <=#Tp 1'b1;
            m_wb_we_o  <=#Tp 1'b1;
            m_wb_sel_o <=#Tp RxByteSel;
            cyc_cleared<=#Tp 1'b0;
            IncrTxPointer<=#Tp 1'b0;
          end
        8'b01_01_10_00,             
        8'b01_1x_10_x0,             
        8'b10_10_10_00,             
        8'b10_x1_10_0x :            
          begin
            m_wb_cyc_o <=#Tp 1'b0;  
            cyc_cleared<=#Tp 1'b1;
            IncrTxPointer<=#Tp 1'b0;
            tx_burst_cnt<=#Tp 0;
            tx_burst_en<=#Tp txfifo_cnt<(`ETH_TX_FIFO_DEPTH-`ETH_BURST_LENGTH) & (TxLength>(`ETH_BURST_LENGTH*4+4));
            rx_burst_cnt<=#Tp 0;
            rx_burst_en<=#Tp MasterWbRX ? enough_data_in_rxfifo_for_burst_plus1 : enough_data_in_rxfifo_for_burst;  
            `ifdef ETH_WISHBONE_B3
              m_wb_cti_o <=#Tp 3'b0;
            `endif
          end
        8'bxx_00_10_00,             
        8'bxx_00_01_00 :            
          begin
            MasterWbTX <=#Tp 1'b0;
            MasterWbRX <=#Tp 1'b0;
            m_wb_cyc_o <=#Tp 1'b0;
            cyc_cleared<=#Tp 1'b0;
            IncrTxPointer<=#Tp 1'b0;
            rx_burst_cnt<=#Tp 0;
            rx_burst_en<=#Tp MasterWbRX ? enough_data_in_rxfifo_for_burst_plus1 : enough_data_in_rxfifo_for_burst;  
            `ifdef ETH_WISHBONE_B3
              m_wb_cti_o <=#Tp 3'b0;
            `endif
          end
        8'b00_00_00_00:             
          begin
            tx_burst_cnt<=#Tp 0;
            tx_burst_en<=#Tp txfifo_cnt<(`ETH_TX_FIFO_DEPTH-`ETH_BURST_LENGTH) & (TxLength>(`ETH_BURST_LENGTH*4+4));
          end
        default:                    
          begin
            MasterWbTX <=#Tp MasterWbTX;
            MasterWbRX <=#Tp MasterWbRX;
            m_wb_cyc_o <=#Tp m_wb_cyc_o;
            m_wb_sel_o <=#Tp m_wb_sel_o;
            IncrTxPointer<=#Tp IncrTxPointer;
          end
      endcase
    end
end