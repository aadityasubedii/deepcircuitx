            P_Term_s <= Mult_Divide(P_Term, MULT_S, DIV_S);
            N_Term_w <= Mult_Divide(N_Term-1, MULT_W, DIV_W);
            P_Term_w <= Mult_Divide(P_Term, MULT_W, DIV_W);
            N_Term_s <= Mult_Divide(N_Term-1, MULT_S, DIV_S);
            P_Term   <= Mult_Divide(P_Term, MULT_S, DIV_S);
            N_Term   <= Mult_Divide(N_Term-1, MULT_W, DIV_W);
            STATE  <= WAIT_FOR_START_BROADCAST;
        end
        WAIT_FOR_START_BROADCAST: begin   