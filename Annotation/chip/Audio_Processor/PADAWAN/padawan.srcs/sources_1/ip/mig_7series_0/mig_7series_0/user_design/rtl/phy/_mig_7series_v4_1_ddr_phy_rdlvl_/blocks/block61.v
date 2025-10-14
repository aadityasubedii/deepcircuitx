    end else if (nCK_PER_CLK == 2) begin: gen_pat_div2

            

      
      assign idel_pat0_rise0[3] = 2'b01;
      assign idel_pat0_fall0[3] = 2'b00;
      assign idel_pat0_rise1[3] = 2'b10;
      assign idel_pat0_fall1[3] = 2'b11;

      assign idel_pat0_rise0[2] = 2'b00;
      assign idel_pat0_fall0[2] = 2'b10;
      assign idel_pat0_rise1[2] = 2'b11;
      assign idel_pat0_fall1[2] = 2'b10;

      assign idel_pat0_rise0[1] = 2'b00;
      assign idel_pat0_fall0[1] = 2'b11;
      assign idel_pat0_rise1[1] = 2'b10;
      assign idel_pat0_fall1[1] = 2'b01;

      assign idel_pat0_rise0[0] = 2'b11;
      assign idel_pat0_fall0[0] = 2'b10;
      assign idel_pat0_rise1[0] = 2'b00;
      assign idel_pat0_fall1[0] = 2'b01;


      
      assign idel_pat1_rise0[3] = 2'b01;
      assign idel_pat1_fall0[3] = 2'b11;
      assign idel_pat1_rise1[3] = 2'b01;
      assign idel_pat1_fall1[3] = 2'b00;

      assign idel_pat1_rise0[2] = 2'b11;
      assign idel_pat1_fall0[2] = 2'b01;
      assign idel_pat1_rise1[2] = 2'b00;
      assign idel_pat1_fall1[2] = 2'b10;

      assign idel_pat1_rise0[1] = 2'b01;
      assign idel_pat1_fall0[1] = 2'b00;
      assign idel_pat1_rise1[1] = 2'b10;
      assign idel_pat1_fall1[1] = 2'b11;

      assign idel_pat1_rise0[0] = 2'b00;
      assign idel_pat1_fall0[0] = 2'b10;
      assign idel_pat1_rise1[0] = 2'b11;
      assign idel_pat1_fall1[0] = 2'b10;


      
      assign pat0_rise0[3] = 2'b00;
      assign pat0_fall0[3] = 2'b10;
      assign pat0_rise1[3] = 2'b11;
      assign pat0_fall1[3] = 2'b10;

      assign pat0_rise0[2] = 2'b10;
      assign pat0_fall0[2] = 2'b11;
      assign pat0_rise1[2] = 2'b10;
      assign pat0_fall1[2] = 2'b00;

      assign pat0_rise0[1] = 2'b11;
      assign pat0_fall0[1] = 2'b10;
      assign pat0_rise1[1] = 2'b01;
      assign pat0_fall1[1] = 2'b00;

      assign pat0_rise0[0] = 2'b10;
      assign pat0_fall0[0] = 2'b00;
      assign pat0_rise1[0] = 2'b01;
      assign pat0_fall1[0] = 2'b11;

      
      assign pat1_rise0[3] = 2'b11;
      assign pat1_fall0[3] = 2'b01;
      assign pat1_rise1[3] = 2'b00;
      assign pat1_fall1[3] = 2'b10;

      assign pat1_rise0[2] = 2'b01;
      assign pat1_fall0[2] = 2'b00;
      assign pat1_rise1[2] = 2'b10;
      assign pat1_fall1[2] = 2'b11;

      assign pat1_rise0[1] = 2'b00;
      assign pat1_fall0[1] = 2'b10;
      assign pat1_rise1[1] = 2'b11;
      assign pat1_fall1[1] = 2'b10;

      assign pat1_rise0[0] = 2'b10;
      assign pat1_fall0[0] = 2'b11;
      assign pat1_rise1[0] = 2'b10;
      assign pat1_fall1[0] = 2'b00;
    end