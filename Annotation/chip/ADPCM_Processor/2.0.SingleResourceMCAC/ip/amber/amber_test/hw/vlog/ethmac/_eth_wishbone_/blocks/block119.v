eth_fifo #(`ETH_TX_FIFO_DATA_WIDTH, `ETH_TX_FIFO_DEPTH, `ETH_TX_FIFO_CNT_WIDTH)
tx_fifo ( .data_in(m_wb_dat_i),                             .data_out(TxData_wb), 
          .clk(WB_CLK_I),                                   .reset(Reset), 
          .write(MasterWbTX & m_wb_ack_i),                  .read(ReadTxDataFromFifo_wb & ~TxBufferEmpty),
          .clear(TxFifoClear),                              .full(TxBufferFull), 
          .almost_full(TxBufferAlmostFull),                 .almost_empty(TxBufferAlmostEmpty), 
          .empty(TxBufferEmpty),                            .cnt(txfifo_cnt)
        );