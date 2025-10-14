    task chk_err;
        input [1:0] relationship;
        input [BA_BITS-1:0] bank;
        input [3:0] fromcmd;
        input [3:0] cmd;
        reg err;
    begin

        casex ({truebl4, relationship, fromcmd, cmd})
            
            {1'bx, DIFF_BANK , LOAD_MODE, LOAD_MODE} : begin if (ck_cntr - ck_load_mode < TMRD)                                                                                $display ("%m: at time %t ERROR:  tMRD violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , LOAD_MODE, READ     } : begin if (($time - tm_load_mode < TMOD) || (ck_cntr - ck_load_mode < TMOD_TCK))                                         $display ("%m: at time %t ERROR:  tMOD violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , LOAD_MODE, REFRESH  } ,
            {1'bx, DIFF_BANK , LOAD_MODE, PRECHARGE} ,
            {1'bx, DIFF_BANK , LOAD_MODE, ACTIVATE } ,
            {1'bx, DIFF_BANK , LOAD_MODE, ZQ       } ,
            {1'bx, DIFF_BANK , LOAD_MODE, PWR_DOWN } ,
            {1'bx, DIFF_BANK , LOAD_MODE, SELF_REF } : begin if (($time - tm_load_mode < TMOD) || (ck_cntr - ck_load_mode < TMOD_TCK))                                         $display ("%m: at time %t ERROR:  tMOD violation during %s", $time, cmd_string[cmd]);                         end

            
            {1'bx, DIFF_BANK , REFRESH  , LOAD_MODE} ,
            {1'bx, DIFF_BANK , REFRESH  , REFRESH  } ,
            {1'bx, DIFF_BANK , REFRESH  , PRECHARGE} ,
            {1'bx, DIFF_BANK , REFRESH  , ACTIVATE } ,
            {1'bx, DIFF_BANK , REFRESH  , ZQ       } ,
            {1'bx, DIFF_BANK , REFRESH  , SELF_REF } : begin if ($time - tm_refresh < TRFC_MIN)                                                                                $display ("%m: at time %t ERROR:  tRFC violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , REFRESH  , PWR_DOWN } : begin if (ck_cntr - ck_refresh < TREFPDEN)                                                                              $display ("%m: at time %t ERROR:  tREFPDEN violation during %s", $time, cmd_string[cmd]);                     end

            
            {1'bx, SAME_BANK , PRECHARGE, ACTIVATE } : begin if ($time - tm_bank_precharge[bank] < TRP)                                                                        $display ("%m: at time %t ERROR:   tRP violation during %s to bank %d", $time, cmd_string[cmd], bank);        end 
            {1'bx, DIFF_BANK , PRECHARGE, LOAD_MODE} ,
            {1'bx, DIFF_BANK , PRECHARGE, REFRESH  } ,
            {1'bx, DIFF_BANK , PRECHARGE, ZQ       } ,
            {1'bx, DIFF_BANK , PRECHARGE, SELF_REF } : begin if ($time - tm_precharge < TRP)                                                                                   $display ("%m: at time %t ERROR:   tRP violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , PRECHARGE, PWR_DOWN } : ; 

            
            {1'bx, SAME_BANK , ACTIVATE , PRECHARGE} : begin if ($time - tm_bank_activate[bank] > TRAS_MAX)                                                                    $display ("%m: at time %t ERROR:  tRAS maximum violation during %s to bank %d", $time, cmd_string[cmd], bank);
                                                             if ($time - tm_bank_activate[bank] < TRAS_MIN)                                                                    $display ("%m: at time %t ERROR:  tRAS minimum violation during %s to bank %d", $time, cmd_string[cmd], bank);end
            {1'bx, SAME_BANK , ACTIVATE , ACTIVATE } : begin if ($time - tm_bank_activate[bank] < TRC)                                                                         $display ("%m: at time %t ERROR:   tRC violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'bx, SAME_BANK , ACTIVATE , WRITE    } ,
            {1'bx, SAME_BANK , ACTIVATE , READ     } : ; 
            {1'b0, DIFF_BANK , ACTIVATE , ACTIVATE } : begin if (($time - tm_activate < TRRD) || (ck_cntr - ck_activate < TRRD_TCK))                                           $display ("%m: at time %t ERROR:  tRRD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_BANK , ACTIVATE , ACTIVATE } : begin if (($time - tm_group_activate[bank[1]] < TRRD) || (ck_cntr - ck_group_activate[bank[1]] < TRRD_TCK))             $display ("%m: at time %t ERROR:  tRRD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_GROUP, ACTIVATE , ACTIVATE } : begin if (($time - tm_activate < TRRD_DG) || (ck_cntr - ck_activate < TRRD_DG_TCK))                                     $display ("%m: at time %t ERROR:  tRRD_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);     end
            {1'bx, DIFF_BANK , ACTIVATE , REFRESH  } : begin if ($time - tm_activate < TRC)                                                                                    $display ("%m: at time %t ERROR:   tRC violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , ACTIVATE , PWR_DOWN } : begin if (ck_cntr - ck_activate < TACTPDEN)                                                                             $display ("%m: at time %t ERROR:  tACTPDEN violation during %s", $time, cmd_string[cmd]);                     end

            
            {1'bx, SAME_BANK , WRITE    , PRECHARGE} : begin if (($time - tm_bank_write_end[bank] < TWR) || (ck_cntr - ck_bank_write[bank] <= write_latency + burst_length/2)) $display ("%m: at time %t ERROR:   tWR violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b0, DIFF_BANK , WRITE    , WRITE    } : begin if (ck_cntr - ck_write < TCCD)                                                                                    $display ("%m: at time %t ERROR:  tCCD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_BANK , WRITE    , WRITE    } : begin if (ck_cntr - ck_group_write[bank[1]] < TCCD)                                                                     $display ("%m: at time %t ERROR:  tCCD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b0, DIFF_BANK , WRITE    , READ     } : begin if (ck_cntr - ck_write < write_latency + burst_length/2 + TWTR_TCK - additive_latency)                            $display ("%m: at time %t ERROR:  tWTR violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_BANK , WRITE    , READ     } : begin if (ck_cntr - ck_group_write[bank[1]] < write_latency + burst_length/2 + TWTR_TCK - additive_latency)             $display ("%m: at time %t ERROR:  tWTR violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_GROUP, WRITE    , WRITE    } : begin if (ck_cntr - ck_write < TCCD_DG)                                                                                 $display ("%m: at time %t ERROR:  tCCD_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);     end
            {1'b1, DIFF_GROUP, WRITE    , READ     } : begin if (ck_cntr - ck_write < write_latency + burst_length/2 + TWTR_DG_TCK - additive_latency)                         $display ("%m: at time %t ERROR:  tWTR_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);     end
            {1'bx, DIFF_BANK , WRITE    , PWR_DOWN } : begin if (($time - tm_write_end < TWR) || (ck_cntr - ck_write < write_latency + burst_length/2))                        $display ("%m: at time %t ERROR:  tWRPDEN violation during %s", $time, cmd_string[cmd]);                      end

            
            {1'bx, SAME_BANK , READ     , PRECHARGE} : begin if (($time - tm_bank_read_end[bank] < TRTP) || (ck_cntr - ck_bank_read[bank] < additive_latency + TRTP_TCK))      $display ("%m: at time %t ERROR:  tRTP violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b0, DIFF_BANK , READ     , WRITE    } : ; 
            {1'b1, DIFF_BANK , READ     , WRITE    } : ; 
            {1'b0, DIFF_BANK , READ     , READ     } : begin if (ck_cntr - ck_read < TCCD)                                                                                     $display ("%m: at time %t ERROR:  tCCD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_BANK , READ     , READ     } : begin if (ck_cntr - ck_group_read[bank[1]] < TCCD)                                                                      $display ("%m: at time %t ERROR:  tCCD violation during %s to bank %d", $time, cmd_string[cmd], bank);        end
            {1'b1, DIFF_GROUP, READ     , WRITE    } : ; 
            {1'b1, DIFF_GROUP, READ     , READ     } : begin if (ck_cntr - ck_read < TCCD_DG)                                                                                  $display ("%m: at time %t ERROR:  tCCD_DG violation during %s to bank %d", $time, cmd_string[cmd], bank);     end
            {1'bx, DIFF_BANK , READ     , PWR_DOWN } : begin if (ck_cntr - ck_read < read_latency + 5)                                                                         $display ("%m: at time %t ERROR:  tRDPDEN violation during %s", $time, cmd_string[cmd]);                      end

            
            {1'bx, DIFF_BANK , ZQ       , LOAD_MODE} : ; 
            {1'bx, DIFF_BANK , ZQ       , REFRESH  } ,
            {1'bx, DIFF_BANK , ZQ       , PRECHARGE} ,
            {1'bx, DIFF_BANK , ZQ       , ACTIVATE } ,
            {1'bx, DIFF_BANK , ZQ       , ZQ       } ,
            {1'bx, DIFF_BANK , ZQ       , PWR_DOWN } ,
            {1'bx, DIFF_BANK , ZQ       , SELF_REF } : begin if (ck_cntr - ck_zqinit < TZQINIT)                                                                                $display ("%m: at time %t ERROR:  tZQinit violation during %s", $time, cmd_string[cmd]);
                                                             if (ck_cntr - ck_zqoper < TZQOPER)                                                                                $display ("%m: at time %t ERROR:  tZQoper violation during %s", $time, cmd_string[cmd]);
                                                             if (ck_cntr - ck_zqcs < TZQCS)                                                                                    $display ("%m: at time %t ERROR:  tZQCS violation during %s", $time, cmd_string[cmd]);                        end

            
            {1'bx, DIFF_BANK , PWR_DOWN , LOAD_MODE} ,
            {1'bx, DIFF_BANK , PWR_DOWN , REFRESH  } ,
            {1'bx, DIFF_BANK , PWR_DOWN , PRECHARGE} ,
            {1'bx, DIFF_BANK , PWR_DOWN , ACTIVATE } ,
            {1'bx, DIFF_BANK , PWR_DOWN , WRITE    } ,
            {1'bx, DIFF_BANK , PWR_DOWN , ZQ       } : begin if (($time - tm_power_down < TXP) || (ck_cntr - ck_power_down < TXP_TCK))                                         $display ("%m: at time %t ERROR:   tXP violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , PWR_DOWN , READ     } : begin if (($time - tm_power_down < TXP) || (ck_cntr - ck_power_down < TXP_TCK))                                         $display ("%m: at time %t ERROR:   tXP violation during %s", $time, cmd_string[cmd]);                            
                                                        else if (($time - tm_slow_exit_pd < TXPDLL) || (ck_cntr - ck_slow_exit_pd < TXPDLL_TCK))                               $display ("%m: at time %t ERROR:  tXPDLL violation during %s", $time, cmd_string[cmd]);                       end
            {1'bx, DIFF_BANK , PWR_DOWN , PWR_DOWN } ,
            {1'bx, DIFF_BANK , PWR_DOWN , SELF_REF } : begin if (($time - tm_power_down < TXP) || (ck_cntr - ck_power_down < TXP_TCK))                                         $display ("%m: at time %t ERROR:   tXP violation during %s", $time, cmd_string[cmd]);
                                                             if ((tm_power_down > tm_refresh) && ($time - tm_refresh < TRFC_MIN))                                              $display ("%m: at time %t ERROR:  tRFC violation during %s", $time, cmd_string[cmd]);
                                                             if ((tm_refresh > tm_power_down) && (($time - tm_power_down < TXPDLL) || (ck_cntr - ck_power_down < TXPDLL_TCK))) $display ("%m: at time %t ERROR:  tXPDLL violation during %s", $time, cmd_string[cmd]);
                                                             if (($time - tm_cke_cmd < TCKE) || (ck_cntr - ck_cke_cmd < TCKE_TCK))                                             $display ("%m: at time %t ERROR:  tCKE violation on CKE", $time);                                             end

            
            {1'bx, DIFF_BANK , SELF_REF , LOAD_MODE} ,
            {1'bx, DIFF_BANK , SELF_REF , REFRESH  } ,
            {1'bx, DIFF_BANK , SELF_REF , PRECHARGE} ,
            {1'bx, DIFF_BANK , SELF_REF , ACTIVATE } ,
            {1'bx, DIFF_BANK , SELF_REF , WRITE    } ,
            {1'bx, DIFF_BANK , SELF_REF , ZQ       } : begin if (($time - tm_self_refresh < TXS) || (ck_cntr - ck_self_refresh < TXS_TCK))                                     $display ("%m: at time %t ERROR:   tXS violation during %s", $time, cmd_string[cmd]);                         end
            {1'bx, DIFF_BANK , SELF_REF , READ     } : begin if (ck_cntr - ck_self_refresh < TXSDLL)                                                                           $display ("%m: at time %t ERROR:  tXSDLL violation during %s", $time, cmd_string[cmd]);                       end
            {1'bx, DIFF_BANK , SELF_REF , PWR_DOWN } ,
            {1'bx, DIFF_BANK , SELF_REF , SELF_REF } : begin if (($time - tm_self_refresh < TXS) || (ck_cntr - ck_self_refresh < TXS_TCK))                                     $display ("%m: at time %t ERROR:   tXS violation during %s", $time, cmd_string[cmd]);
                                                             if (($time - tm_cke_cmd < TCKE) || (ck_cntr - ck_cke_cmd < TCKE_TCK))                                             $display ("%m: at time %t ERROR:  tCKE violation on CKE", $time);                                             end
        endcase
    end
    endtask