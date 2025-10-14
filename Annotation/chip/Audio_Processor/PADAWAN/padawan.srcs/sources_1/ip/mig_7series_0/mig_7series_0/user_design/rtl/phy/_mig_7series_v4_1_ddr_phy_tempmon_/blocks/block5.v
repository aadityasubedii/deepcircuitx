  always @(*) begin

    tempmon_state_nxt = tempmon_state;
    tempmon_state_init = 1'b0;
    pi_f_inc_nxt = 1'b0;
    pi_f_dec_nxt = 1'b0;

    casez (tempmon_state)
      IDLE: begin
        if (calib_complete) tempmon_state_nxt = INIT;
      end
      INIT: begin
        tempmon_state_nxt = NEUTRAL;
        tempmon_state_init = 1'b1;
      end
      FOUR_INC: begin
        if (temp_gte_four_inc_max) begin
	  tempmon_state_nxt = THREE_INC;
          pi_f_dec_nxt = 1'b1;
        end
      end
      THREE_INC: begin
        if (temp_gte_three_inc_max) begin
	  tempmon_state_nxt = TWO_INC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_three_inc_min) begin
	  tempmon_state_nxt = FOUR_INC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      TWO_INC: begin
        if (temp_gte_two_inc_max) begin
	  tempmon_state_nxt = ONE_INC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_two_inc_min) begin
	  tempmon_state_nxt = THREE_INC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      ONE_INC: begin
        if (temp_gte_one_inc_max) begin
	  tempmon_state_nxt = NEUTRAL;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_one_inc_min) begin
	  tempmon_state_nxt = TWO_INC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      NEUTRAL: begin
        if (temp_gte_neutral_max) begin
	  tempmon_state_nxt = ONE_DEC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_neutral_min) begin
	  tempmon_state_nxt = ONE_INC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      ONE_DEC: begin
        if (temp_gte_one_dec_max) begin
	  tempmon_state_nxt = TWO_DEC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_one_dec_min) begin
	  tempmon_state_nxt = NEUTRAL;
          pi_f_inc_nxt = 1'b1;
        end
      end
      TWO_DEC: begin
        if (temp_gte_two_dec_max) begin
	  tempmon_state_nxt = THREE_DEC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_two_dec_min) begin
	  tempmon_state_nxt = ONE_DEC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      THREE_DEC: begin
        if (temp_gte_three_dec_max) begin
	  tempmon_state_nxt = FOUR_DEC;
          pi_f_dec_nxt = 1'b1;
        end
	else if (temp_lte_three_dec_min) begin
	  tempmon_state_nxt = TWO_DEC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      FOUR_DEC: begin
	if (temp_lte_four_dec_min) begin
	  tempmon_state_nxt = THREE_DEC;
          pi_f_inc_nxt = 1'b1;
        end
      end
      default: begin
	  tempmon_state_nxt = IDLE;
      end
    endcase

  end 