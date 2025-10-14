      always @(grant_pre_r or req_bank_r or req_cas or req_rank_r or req_ras
               or row_addr or pre_cmd_r or row_cmd_wr or rst)
        begin
          pre_cmd_ns = rst
                         ? {RANK_WIDTH{1'b0}}
                         : pre_cmd_r;
          for (i=0; i<nBANK_MACHS; i=i+1)
            if (grant_pre_r[i])
               pre_cmd_ns = {req_rank_r[(RANK_WIDTH*i)+:RANK_WIDTH],
                             req_bank_r[(BANK_WIDTH*i)+:BANK_WIDTH],
                             row_addr[(ROW_WIDTH*i)+:ROW_WIDTH],
                             req_ras[i],
                             req_cas[i],
                             row_cmd_wr[i]};
        end