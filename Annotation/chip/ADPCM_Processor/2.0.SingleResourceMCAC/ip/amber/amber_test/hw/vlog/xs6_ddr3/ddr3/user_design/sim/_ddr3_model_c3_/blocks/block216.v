    task reset_task;
        integer i;
        begin
            
            dq_in_valid         = 0;
            dqs_in_valid       <= 0;
            wdqs_cntr           = 0;
            wdq_cntr            = 0;
            for (i=0; i<31; i=i+1) begin
                wdqs_pos_cntr[i]    <= 0;
            end
            b2b_write           <= 0;
            
            out_en              = 0;
            dq_out_en           = 0;
            rdq_cntr            = 0;
            dqs_out_en          = 0;
            rdqs_cntr           = 0;
            
            odt_en              = 0;
            dyn_odt_en          = 0;
            odt_state           = 0;
            dyn_odt_state       = 0;
            
            active_bank         = 0;
            auto_precharge_bank = 0;
            read_precharge_bank  = 0;
	        write_precharge_bank = 0;
            

            init_done            = 0;
		    mpr_en              = 0;
            init_step           = 0;
            init_mode_reg       = 0;
            init_dll_reset      = 0;
            zq_set              = 0;
            
            dll_en              = 0;
            dll_reset           = 0;
            dll_locked          = 0;
            
            prev_cke            = 1'bx;
            in_power_down       = 0;
            in_self_refresh     = 0;
            
            al_pipeline         = 0;
            wr_pipeline         = 0;
            rd_pipeline         = 0;
            odt_pipeline        = 0;
            dyn_odt_pipeline    = 0;
        end
    endtask