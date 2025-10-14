assign xC_STATE    = c_state == CS_INIT            ? "CS_INIT"          :
                     c_state == CS_IDLE            ? "CS_IDLE"          :
                     c_state == CS_FILL1           ? "CS_FILL1"         :
                     c_state == CS_FILL2           ? "CS_FILL2"         :
                     c_state == CS_FILL3           ? "CS_FILL3"         :
                     c_state == CS_FILL4           ? "CS_FILL4"         :
                     c_state == CS_FILL_COMPLETE   ? "CS_FILL_COMPLETE" :
                     c_state == CS_EX_DELETE       ? "CS_EX_DELETE"     :
                     c_state == CS_TURN_AROUND     ? "CS_TURN_AROUND"   :
                     c_state == CS_WRITE_HIT1      ? "CS_WRITE_HIT1"    :
                                                     "UNKNOWN"          ;