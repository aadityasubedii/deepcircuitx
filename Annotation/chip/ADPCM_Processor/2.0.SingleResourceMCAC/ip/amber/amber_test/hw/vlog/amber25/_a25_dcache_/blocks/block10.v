assign xC_STATE    = c_state == CS_INIT               ? "INIT"               :
                     c_state == CS_IDLE               ? "IDLE"               :
                     c_state == CS_FILL               ? "FILL"               :
                     c_state == CS_FILL_COMPLETE      ? "FILL_COMPLETE"      :
                     c_state == CS_EX_DELETE          ? "EX_DELETE"          :
                     c_state == CS_TURN_AROUND        ? "TURN_AROUND"        :
                     c_state == CS_WRITE_HIT          ? "WRITE_HIT"          :
                     c_state == CS_WRITE_HIT_WAIT_WB  ? "WRITE_HIT_WAIT_WB"  :
                     c_state == CS_WRITE_MISS_WAIT_WB ? "WRITE_MISS_WAIT_WB" :
                                                        "UNKNOWN"               ;