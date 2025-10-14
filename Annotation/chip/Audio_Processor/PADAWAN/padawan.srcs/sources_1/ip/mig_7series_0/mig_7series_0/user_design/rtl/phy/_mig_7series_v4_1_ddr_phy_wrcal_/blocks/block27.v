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