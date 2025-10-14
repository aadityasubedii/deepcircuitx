assign xCONTROL_STATE        =
                               control_state == RST_WAIT1      ? "RST_WAIT1"      :
                               control_state == RST_WAIT2      ? "RST_WAIT2"      :


                               control_state == INT_WAIT1      ? "INT_WAIT1"      :
                               control_state == INT_WAIT2      ? "INT_WAIT2"      :
                               control_state == EXECUTE        ? "EXECUTE"        :
                               control_state == PRE_FETCH_EXEC ? "PRE_FETCH_EXEC" :
                               control_state == MEM_WAIT1      ? "MEM_WAIT1"      :
                               control_state == MEM_WAIT2      ? "MEM_WAIT2"      :
                               control_state == PC_STALL1      ? "PC_STALL1"      :
                               control_state == PC_STALL2      ? "PC_STALL2"      :
                               control_state == MTRANS_EXEC1   ? "MTRANS_EXEC1"   :
                               control_state == MTRANS_EXEC2   ? "MTRANS_EXEC2"   :
                               control_state == MTRANS_EXEC3   ? "MTRANS_EXEC3"   :
                               control_state == MTRANS_EXEC3B  ? "MTRANS_EXEC3B"  :
                               control_state == MTRANS_EXEC4   ? "MTRANS_EXEC4"   :
                               control_state == MTRANS5_ABORT  ? "MTRANS5_ABORT"  :
                               control_state == MULT_PROC1     ? "MULT_PROC1"     :
                               control_state == MULT_PROC2     ? "MULT_PROC2"     :
                               control_state == MULT_STORE     ? "MULT_STORE"     :
                               control_state == MULT_ACCUMU    ? "MULT_ACCUMU"    :
                               control_state == SWAP_WRITE     ? "SWAP_WRITE"     :
                               control_state == SWAP_WAIT1     ? "SWAP_WAIT1"     :
                               control_state == SWAP_WAIT2     ? "SWAP_WAIT2"     :
                               control_state == COPRO_WAIT     ? "COPRO_WAIT"     :
                                                                 "UNKNOWN "       ;