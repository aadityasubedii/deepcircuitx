      always @(grant_row_r or insert_maint_r1 or maint_cmd
               or req_bank_r or req_cas or req_rank_r or req_ras
               or row_addr or row_cmd_r or row_cmd_wr or rst)
        begin
          row_cmd_ns = rst
                         ? {RANK_WIDTH{1'b0}}
                         : insert_maint_r1
                            ? maint_cmd
                            : row_cmd_r;
          for (i=0; i<nBANK_MACHS; i=i+1)
            if (grant_row_r[i])
               row_cmd_ns = {req_rank_r[(RANK_WIDTH*i)+:RANK_WIDTH],
                             req_bank_r[(BANK_WIDTH*i)+:BANK_WIDTH],
                             row_addr[(ROW_WIDTH*i)+:ROW_WIDTH],
                             req_ras[i],
                             req_cas[i],
                             row_cmd_wr[i]};
        end