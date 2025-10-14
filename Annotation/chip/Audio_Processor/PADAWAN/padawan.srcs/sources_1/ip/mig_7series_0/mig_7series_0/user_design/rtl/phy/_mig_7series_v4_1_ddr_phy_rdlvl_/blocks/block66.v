  generate
    if (nCK_PER_CLK == 4) begin: gen_pat_div4
      

      
      assign {idel_pat0_rise0[3], idel_pat0_rise0[2],
              idel_pat0_rise0[1], idel_pat0_rise0[0]} = 4'h1;
      assign {idel_pat0_fall0[3], idel_pat0_fall0[2],
              idel_pat0_fall0[1], idel_pat0_fall0[0]} = 4'h7;
      assign {idel_pat0_rise1[3], idel_pat0_rise1[2],
              idel_pat0_rise1[1], idel_pat0_rise1[0]} = 4'hE;
      assign {idel_pat0_fall1[3], idel_pat0_fall1[2],
              idel_pat0_fall1[1], idel_pat0_fall1[0]} = 4'hC;
      assign {idel_pat0_rise2[3], idel_pat0_rise2[2],
              idel_pat0_rise2[1], idel_pat0_rise2[0]} = 4'h9;
      assign {idel_pat0_fall2[3], idel_pat0_fall2[2],
              idel_pat0_fall2[1], idel_pat0_fall2[0]} = 4'h2;
      assign {idel_pat0_rise3[3], idel_pat0_rise3[2],
              idel_pat0_rise3[1], idel_pat0_rise3[0]} = 4'h4;
      assign {idel_pat0_fall3[3], idel_pat0_fall3[2],
              idel_pat0_fall3[1], idel_pat0_fall3[0]} = 4'hB;

      
      assign {idel_pat1_rise0[3], idel_pat1_rise0[2],
              idel_pat1_rise0[1], idel_pat1_rise0[0]} = 4'h4;
      assign {idel_pat1_fall0[3], idel_pat1_fall0[2],
              idel_pat1_fall0[1], idel_pat1_fall0[0]} = 4'h9;
      assign {idel_pat1_rise1[3], idel_pat1_rise1[2],
              idel_pat1_rise1[1], idel_pat1_rise1[0]} = 4'h3;
      assign {idel_pat1_fall1[3], idel_pat1_fall1[2],
              idel_pat1_fall1[1], idel_pat1_fall1[0]} = 4'h7;
      assign {idel_pat1_rise2[3], idel_pat1_rise2[2],
              idel_pat1_rise2[1], idel_pat1_rise2[0]} = 4'hE;
      assign {idel_pat1_fall2[3], idel_pat1_fall2[2],
              idel_pat1_fall2[1], idel_pat1_fall2[0]} = 4'hC;
      assign {idel_pat1_rise3[3], idel_pat1_rise3[2],
              idel_pat1_rise3[1], idel_pat1_rise3[0]} = 4'h9;
      assign {idel_pat1_fall3[3], idel_pat1_fall3[2],
              idel_pat1_fall3[1], idel_pat1_fall3[0]} = 4'h2;


      
      assign {pat0_rise0[3], pat0_rise0[2],
              pat0_rise0[1], pat0_rise0[0]} = 4'h7;
      assign {pat0_fall0[3], pat0_fall0[2],
              pat0_fall0[1], pat0_fall0[0]} = 4'hE;
      assign {pat0_rise1[3], pat0_rise1[2],
              pat0_rise1[1], pat0_rise1[0]} = 4'hC;
      assign {pat0_fall1[3], pat0_fall1[2],
              pat0_fall1[1], pat0_fall1[0]} = 4'h9;
      assign {pat0_rise2[3], pat0_rise2[2],
              pat0_rise2[1], pat0_rise2[0]} = 4'h2;
      assign {pat0_fall2[3], pat0_fall2[2],
              pat0_fall2[1], pat0_fall2[0]} = 4'h4;
      assign {pat0_rise3[3], pat0_rise3[2],
              pat0_rise3[1], pat0_rise3[0]} = 4'hB;
      assign {pat0_fall3[3], pat0_fall3[2],
              pat0_fall3[1], pat0_fall3[0]} = 4'h1;

      
      assign {pat1_rise0[3], pat1_rise0[2],
              pat1_rise0[1], pat1_rise0[0]} = 4'h9;
      assign {pat1_fall0[3], pat1_fall0[2],
              pat1_fall0[1], pat1_fall0[0]} = 4'h3;
      assign {pat1_rise1[3], pat1_rise1[2],
              pat1_rise1[1], pat1_rise1[0]} = 4'h7;
      assign {pat1_fall1[3], pat1_fall1[2],
              pat1_fall1[1], pat1_fall1[0]} = 4'hE;
      assign {pat1_rise2[3], pat1_rise2[2],
              pat1_rise2[1], pat1_rise2[0]} = 4'hC;
      assign {pat1_fall2[3], pat1_fall2[2],
              pat1_fall2[1], pat1_fall2[0]} = 4'h9;
      assign {pat1_rise3[3], pat1_rise3[2],
              pat1_rise3[1], pat1_rise3[0]} = 4'h2;
      assign {pat1_fall3[3], pat1_fall3[2],
              pat1_fall3[1], pat1_fall3[0]} = 4'h4;

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
  endgenerate