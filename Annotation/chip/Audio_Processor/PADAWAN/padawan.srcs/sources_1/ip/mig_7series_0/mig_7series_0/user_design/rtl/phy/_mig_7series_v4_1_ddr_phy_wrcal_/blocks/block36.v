  generate
    if (nCK_PER_CLK == 4) begin: gen_pat_div4
    
      assign pat_rise0[3] = 1'b1;
      assign pat_fall0[3] = 1'b0;
      assign pat_rise1[3] = 1'b1;
      assign pat_fall1[3] = 1'b0;
      assign pat_rise2[3] = 1'b0;
      assign pat_fall2[3] = 1'b1;
      assign pat_rise3[3] = 1'b1;
      assign pat_fall3[3] = 1'b0;

      assign pat_rise0[2] = 1'b1;
      assign pat_fall0[2] = 1'b0;
      assign pat_rise1[2] = 1'b0;
      assign pat_fall1[2] = 1'b1;
      assign pat_rise2[2] = 1'b1;
      assign pat_fall2[2] = 1'b0;
      assign pat_rise3[2] = 1'b0;
      assign pat_fall3[2] = 1'b1;

      assign pat_rise0[1] = 1'b1;
      assign pat_fall0[1] = 1'b0;
      assign pat_rise1[1] = 1'b1;
      assign pat_fall1[1] = 1'b0;
      assign pat_rise2[1] = 1'b0;
      assign pat_fall2[1] = 1'b1;
      assign pat_rise3[1] = 1'b0;
      assign pat_fall3[1] = 1'b1;

      assign pat_rise0[0] = 1'b1;
      assign pat_fall0[0] = 1'b0;
      assign pat_rise1[0] = 1'b0;
      assign pat_fall1[0] = 1'b1;
      assign pat_rise2[0] = 1'b1;
      assign pat_fall2[0] = 1'b0;
      assign pat_rise3[0] = 1'b1;
      assign pat_fall3[0] = 1'b0;

      
      
      assign early_rise0[3] = 1'b1;
      assign early_fall0[3] = 1'b0;
      assign early_rise1[3] = 1'b1;
      assign early_fall1[3] = 1'b0;
      assign early_rise2[3] = 1'b0;
      assign early_fall2[3] = 1'b1;
      assign early_rise3[3] = 1'b1;
      assign early_fall3[3] = 1'b1;

      assign early_rise0[2] = 1'b0;
      assign early_fall0[2] = 1'b0;
      assign early_rise1[2] = 1'b1;
      assign early_fall1[2] = 1'b1;
      assign early_rise2[2] = 1'b1;
      assign early_fall2[2] = 1'b1;
      assign early_rise3[2] = 1'b1;
      assign early_fall3[2] = 1'b0;

      assign early_rise0[1] = 1'b1;
      assign early_fall0[1] = 1'b0;
      assign early_rise1[1] = 1'b1;
      assign early_fall1[1] = 1'b0;
      assign early_rise2[1] = 1'b0;
      assign early_fall2[1] = 1'b1;
      assign early_rise3[1] = 1'b0;
      assign early_fall3[1] = 1'b0;

      assign early_rise0[0] = 1'b1;
      assign early_fall0[0] = 1'b1;
      assign early_rise1[0] = 1'b0;
      assign early_fall1[0] = 1'b0;
      assign early_rise2[0] = 1'b0;
      assign early_fall2[0] = 1'b0;
      assign early_rise3[0] = 1'b1;
      assign early_fall3[0] = 1'b0;

    end else if (nCK_PER_CLK == 2) begin: gen_pat_div2
      
      assign pat1_rise0[3] = 1'b1;
      assign pat1_fall0[3] = 1'b0;
      assign pat1_rise1[3] = 1'b1;
      assign pat1_fall1[3] = 1'b0;

      assign pat1_rise0[2] = 1'b1;
      assign pat1_fall0[2] = 1'b0;
      assign pat1_rise1[2] = 1'b0;
      assign pat1_fall1[2] = 1'b1;

      assign pat1_rise0[1] = 1'b1;
      assign pat1_fall0[1] = 1'b0;
      assign pat1_rise1[1] = 1'b1;
      assign pat1_fall1[1] = 1'b0;

      assign pat1_rise0[0] = 1'b1;
      assign pat1_fall0[0] = 1'b0;
      assign pat1_rise1[0] = 1'b0;
      assign pat1_fall1[0] = 1'b1;

      
      assign pat2_rise0[3] = 1'b0;
      assign pat2_fall0[3] = 1'b1;
      assign pat2_rise1[3] = 1'b1;
      assign pat2_fall1[3] = 1'b0;

      assign pat2_rise0[2] = 1'b1;
      assign pat2_fall0[2] = 1'b0;
      assign pat2_rise1[2] = 1'b0;
      assign pat2_fall1[2] = 1'b1;

      assign pat2_rise0[1] = 1'b0;
      assign pat2_fall0[1] = 1'b1;
      assign pat2_rise1[1] = 1'b0;
      assign pat2_fall1[1] = 1'b1;

      assign pat2_rise0[0] = 1'b1;
      assign pat2_fall0[0] = 1'b0;
      assign pat2_rise1[0] = 1'b1;
      assign pat2_fall1[0] = 1'b0;

      
      
      assign early1_rise0[3] = 2'b1;
      assign early1_fall0[3] = 2'b0;
      assign early1_rise1[3] = 2'b0;
      assign early1_fall1[3] = 2'b1;

      assign early1_rise0[2] = 2'b0;
      assign early1_fall0[2] = 2'b1;
      assign early1_rise1[2] = 2'b1;
      assign early1_fall1[2] = 2'b0;

      assign early1_rise0[1] = 2'b1;
      assign early1_fall0[1] = 2'b0;
      assign early1_rise1[1] = 2'b0;
      assign early1_fall1[1] = 2'b1;

      assign early1_rise0[0] = 2'b0;
      assign early1_fall0[0] = 2'b1;
      assign early1_rise1[0] = 2'b1;
      assign early1_fall1[0] = 2'b0;

      
      assign early2_rise0[3] = 2'b1;
      assign early2_fall0[3] = 2'b0;
      assign early2_rise1[3] = 2'b1;
      assign early2_fall1[3] = 2'b0;

      assign early2_rise0[2] = 2'b0;
      assign early2_fall0[2] = 2'b1;
      assign early2_rise1[2] = 2'b0;
      assign early2_fall1[2] = 2'b0;

      assign early2_rise0[1] = 2'b0;
      assign early2_fall0[1] = 2'b1;
      assign early2_rise1[1] = 2'b1;
      assign early2_fall1[1] = 2'b0;

      assign early2_rise0[0] = 2'b1;
      assign early2_fall0[0] = 2'b0;
      assign early2_rise1[0] = 2'b1;
      assign early2_fall1[0] = 2'b1;
    end
  endgenerate