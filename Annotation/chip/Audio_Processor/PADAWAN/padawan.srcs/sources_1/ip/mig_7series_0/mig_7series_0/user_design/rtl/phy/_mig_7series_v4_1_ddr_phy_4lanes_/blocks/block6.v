always @(*) begin
        A_pi_fine_enable          = 0;
        A_pi_fine_inc             = 0;
        A_pi_counter_load_en      = 0;
        A_pi_counter_read_en      = 0;
        A_pi_counter_load_val     = 0;
        A_pi_rst_dqs_find         = 0;


        A_po_fine_enable          = 0;
        A_po_coarse_enable        = 0;
        A_po_fine_inc             = 0;
        A_po_coarse_inc           = 0;
        A_po_counter_load_en      = 0;
        A_po_counter_read_en      = 0;
        A_po_counter_load_val     = 0;
        A_po_sel_fine_oclk_delay  = 0;

        A_idelay_ce               = 0;
        A_idelay_ld               = 0;
        A_fine_delay              = 0;
        A_fine_delay_sel          = 0;

        B_pi_fine_enable          = 0;
        B_pi_fine_inc   = 0;
        B_pi_counter_load_en      = 0;
        B_pi_counter_read_en      = 0;
        B_pi_counter_load_val     = 0;
        B_pi_rst_dqs_find         = 0;


        B_po_fine_enable          = 0;
        B_po_coarse_enable        = 0;
        B_po_fine_inc             = 0;
        B_po_coarse_inc           = 0;
        B_po_counter_load_en      = 0;
        B_po_counter_read_en      = 0;
        B_po_counter_load_val     = 0;
        B_po_sel_fine_oclk_delay  = 0;

        B_idelay_ce               = 0;
        B_idelay_ld               = 0;
        B_fine_delay              = 0;
        B_fine_delay_sel          = 0;

        C_pi_fine_enable    = 0;
        C_pi_fine_inc   = 0;
        C_pi_counter_load_en      = 0;
        C_pi_counter_read_en      = 0;
        C_pi_counter_load_val     = 0;
        C_pi_rst_dqs_find         = 0;


        C_po_fine_enable          = 0;
        C_po_coarse_enable        = 0;
        C_po_fine_inc             = 0;
        C_po_coarse_inc           = 0;
        C_po_counter_load_en      = 0;
        C_po_counter_read_en      = 0;
        C_po_counter_load_val     = 0;
        C_po_sel_fine_oclk_delay  = 0;

        C_idelay_ce               = 0;
        C_idelay_ld               = 0;
        C_fine_delay              = 0;
        C_fine_delay_sel          = 0;

        D_pi_fine_enable          = 0;
        D_pi_fine_inc             = 0;
        D_pi_counter_load_en      = 0;
        D_pi_counter_read_en      = 0;
        D_pi_counter_load_val     = 0;
        D_pi_rst_dqs_find         = 0;


        D_po_fine_enable          = 0;
        D_po_coarse_enable        = 0;
        D_po_fine_inc             = 0;
        D_po_coarse_inc           = 0;
        D_po_counter_load_en      = 0;
        D_po_counter_read_en      = 0;
        D_po_counter_load_val     = 0;
        D_po_sel_fine_oclk_delay  = 0;

        D_idelay_ce               = 0;
        D_idelay_ld               = 0;
        D_fine_delay              = 0;
        D_fine_delay_sel          = 0;

    if ( calib_sel[2]) begin
    
        A_pi_fine_enable          = 0;
        A_pi_fine_inc             = 0;
        A_pi_counter_load_en      = 0;
        A_pi_counter_read_en      = 0;
        A_pi_counter_load_val     = 0;
    A_pi_rst_dqs_find         = 0;


        A_po_fine_enable          = 0;
        A_po_coarse_enable        = 0;
        A_po_fine_inc             = 0;
        A_po_coarse_inc           = 0;
        A_po_counter_load_en      = 0;
        A_po_counter_read_en      = 0;
        A_po_counter_load_val     = 0;
    A_po_sel_fine_oclk_delay  = 0;

        A_idelay_ce               = 0;
        A_idelay_ld               = 0;
        A_fine_delay              = 0;
        A_fine_delay_sel          = 0;

        B_pi_fine_enable          = 0;
        B_pi_fine_inc             = 0;
        B_pi_counter_load_en      = 0;
        B_pi_counter_read_en      = 0;
        B_pi_counter_load_val     = 0;
    B_pi_rst_dqs_find         = 0;


        B_po_fine_enable          = 0;
        B_po_coarse_enable        = 0;
        B_po_fine_inc             = 0;
        B_po_coarse_inc           = 0;
        B_po_counter_load_en      = 0;
        B_po_counter_read_en      = 0;
        B_po_counter_load_val     = 0;
    B_po_sel_fine_oclk_delay  = 0;

        B_idelay_ce               = 0;
        B_idelay_ld               = 0;
        B_fine_delay              = 0;
        B_fine_delay_sel          = 0;


        C_pi_fine_enable          = 0;
        C_pi_fine_inc             = 0;
        C_pi_counter_load_en      = 0;
        C_pi_counter_read_en      = 0;
        C_pi_counter_load_val     = 0;
    C_pi_rst_dqs_find         = 0;


        C_po_fine_enable          = 0;
        C_po_coarse_enable        = 0;
        C_po_fine_inc             = 0;
        C_po_coarse_inc           = 0;
        C_po_counter_load_en      = 0;
        C_po_counter_read_en      = 0;
        C_po_counter_load_val     = 0;
    C_po_sel_fine_oclk_delay  = 0;

        C_idelay_ce               = 0;
        C_idelay_ld               = 0;
        C_fine_delay              = 0;
        C_fine_delay_sel          = 0;


        D_pi_fine_enable          = 0;
        D_pi_fine_inc             = 0;
        D_pi_counter_load_en      = 0;
        D_pi_counter_read_en      = 0;
        D_pi_counter_load_val     = 0;
    D_pi_rst_dqs_find         = 0;


        D_po_fine_enable          = 0;
        D_po_coarse_enable        = 0;
        D_po_fine_inc             = 0;
        D_po_coarse_inc           = 0;
        D_po_counter_load_en      = 0;
        D_po_counter_read_en      = 0;
        D_po_counter_load_val     = 0;
    D_po_sel_fine_oclk_delay  = 0;

        D_idelay_ce               = 0;
        D_idelay_ld               = 0;
        D_fine_delay              = 0;
        D_fine_delay_sel          = 0;

    end else
    if (calib_in_common) begin
       
       
        if ( !calib_zero_lanes[0] && (! calib_zero_ctrl || DATA_CTL_N[0])) begin
            A_pi_fine_enable          = pi_fine_enable;
            A_pi_fine_inc             = pi_fine_inc;
            A_pi_counter_load_en      = pi_counter_load_en;
            A_pi_counter_read_en      = pi_counter_read_en;
            A_pi_counter_load_val     = pi_counter_load_val;
        A_pi_rst_dqs_find         = pi_rst_dqs_find;


            A_po_fine_enable          = po_fine_enable;
            A_po_coarse_enable        = po_coarse_enable;
            A_po_fine_inc             = po_fine_inc;
            A_po_coarse_inc           = po_coarse_inc;
            A_po_counter_load_en      = po_counter_load_en;
            A_po_counter_read_en      = po_counter_read_en;
            A_po_counter_load_val     = po_counter_load_val;
            A_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;

            A_idelay_ce               = idelay_ce;
            A_idelay_ld               = idelay_ld;
            A_fine_delay              = fine_delay ;
            A_fine_delay_sel          = fine_delay_sel;
        end

        if ( B_mux_ctrl) begin
            B_pi_fine_enable          = pi_fine_enable;
            B_pi_fine_inc             = pi_fine_inc;
            B_pi_counter_load_en      = pi_counter_load_en;
            B_pi_counter_read_en      = pi_counter_read_en;
            B_pi_counter_load_val     = pi_counter_load_val;
        B_pi_rst_dqs_find         = pi_rst_dqs_find;


            B_po_fine_enable          = po_fine_enable;
            B_po_coarse_enable        = po_coarse_enable;
            B_po_fine_inc             = po_fine_inc;
            B_po_coarse_inc           = po_coarse_inc;
            B_po_counter_load_en      = po_counter_load_en;
            B_po_counter_read_en      = po_counter_read_en;
            B_po_counter_load_val     = po_counter_load_val;
            B_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;

            B_idelay_ce               = idelay_ce;
            B_idelay_ld               = idelay_ld;
            B_fine_delay              = fine_delay ;
            B_fine_delay_sel          = fine_delay_sel;
         end

        if ( C_mux_ctrl) begin
            C_pi_fine_enable          = pi_fine_enable;
            C_pi_fine_inc             = pi_fine_inc;
            C_pi_counter_load_en      = pi_counter_load_en;
            C_pi_counter_read_en      = pi_counter_read_en;
            C_pi_counter_load_val     = pi_counter_load_val;
        C_pi_rst_dqs_find         = pi_rst_dqs_find;


            C_po_fine_enable          = po_fine_enable;
            C_po_coarse_enable        = po_coarse_enable;
            C_po_fine_inc             = po_fine_inc;
            C_po_coarse_inc           = po_coarse_inc;
            C_po_counter_load_en      = po_counter_load_en;
            C_po_counter_read_en      = po_counter_read_en;
            C_po_counter_load_val     = po_counter_load_val;
            C_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;

            C_idelay_ce               = idelay_ce;
            C_idelay_ld               = idelay_ld;
            C_fine_delay              = fine_delay ;
            C_fine_delay_sel          = fine_delay_sel;
        end

        if ( D_mux_ctrl) begin
            D_pi_fine_enable          = pi_fine_enable;
            D_pi_fine_inc             = pi_fine_inc;
            D_pi_counter_load_en      = pi_counter_load_en;
            D_pi_counter_read_en      = pi_counter_read_en;
            D_pi_counter_load_val     = pi_counter_load_val;
        D_pi_rst_dqs_find         = pi_rst_dqs_find;


            D_po_fine_enable          = po_fine_enable;
            D_po_coarse_enable        = po_coarse_enable;
            D_po_fine_inc             = po_fine_inc;
            D_po_coarse_inc           = po_coarse_inc;
            D_po_counter_load_en      = po_counter_load_en;
            D_po_counter_read_en      = po_counter_read_en;
            D_po_counter_load_val     = po_counter_load_val;
            D_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;

            D_idelay_ce               = idelay_ce;
            D_idelay_ld               = idelay_ld;
            D_fine_delay              = fine_delay ;
            D_fine_delay_sel          = fine_delay_sel;
        end
    end
    else begin
    


    case (calib_sel[1:0])
    0:  begin
        A_pi_fine_enable          = pi_fine_enable;
        A_pi_fine_inc             = pi_fine_inc;
        A_pi_counter_load_en      = pi_counter_load_en;
        A_pi_counter_read_en      = pi_counter_read_en;
        A_pi_counter_load_val     = pi_counter_load_val;
        A_pi_rst_dqs_find         = pi_rst_dqs_find;


        A_po_fine_enable          = po_fine_enable;
        A_po_coarse_enable        = po_coarse_enable;
        A_po_fine_inc             = po_fine_inc;
        A_po_coarse_inc           = po_coarse_inc;
        A_po_counter_load_en      = po_counter_load_en;
        A_po_counter_read_en      = po_counter_read_en;
        A_po_counter_load_val     = po_counter_load_val;
    A_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;

        A_idelay_ce               = idelay_ce;
        A_idelay_ld               = idelay_ld;
        A_fine_delay              = fine_delay ;
        A_fine_delay_sel          = fine_delay_sel;

     end
    1: begin
        B_pi_fine_enable          = pi_fine_enable;
        B_pi_fine_inc             = pi_fine_inc;
        B_pi_counter_load_en      = pi_counter_load_en;
        B_pi_counter_read_en      = pi_counter_read_en;
        B_pi_counter_load_val     = pi_counter_load_val;
        B_pi_rst_dqs_find         = pi_rst_dqs_find;


        B_po_fine_enable          = po_fine_enable;
        B_po_coarse_enable        = po_coarse_enable;
        B_po_fine_inc             = po_fine_inc;
        B_po_coarse_inc           = po_coarse_inc;
        B_po_counter_load_en      = po_counter_load_en;
        B_po_counter_read_en      = po_counter_read_en;
        B_po_counter_load_val     = po_counter_load_val;
    B_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;

        B_idelay_ce               = idelay_ce;
        B_idelay_ld               = idelay_ld;
        B_fine_delay              = fine_delay ;
        B_fine_delay_sel          = fine_delay_sel;

     end

    2: begin
        C_pi_fine_enable          = pi_fine_enable;
        C_pi_fine_inc             = pi_fine_inc;
        C_pi_counter_load_en      = pi_counter_load_en;
        C_pi_counter_read_en      = pi_counter_read_en;
        C_pi_counter_load_val     = pi_counter_load_val;
        C_pi_rst_dqs_find         = pi_rst_dqs_find;


        C_po_fine_enable          = po_fine_enable;
        C_po_coarse_enable        = po_coarse_enable;
        C_po_fine_inc             = po_fine_inc;
        C_po_coarse_inc           = po_coarse_inc;
        C_po_counter_load_en      = po_counter_load_en;
        C_po_counter_read_en      = po_counter_read_en;
        C_po_counter_load_val     = po_counter_load_val;
    C_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;

        C_idelay_ce               = idelay_ce;
        C_idelay_ld               = idelay_ld;
        C_fine_delay              = fine_delay ;
        C_fine_delay_sel          = fine_delay_sel;

     end

    3: begin
        D_pi_fine_enable          = pi_fine_enable;
        D_pi_fine_inc             = pi_fine_inc;
        D_pi_counter_load_en      = pi_counter_load_en;
        D_pi_counter_read_en      = pi_counter_read_en;
        D_pi_counter_load_val     = pi_counter_load_val;
        D_pi_rst_dqs_find         = pi_rst_dqs_find;


        D_po_fine_enable          = po_fine_enable;
        D_po_coarse_enable        = po_coarse_enable;
        D_po_fine_inc             = po_fine_inc;
        D_po_coarse_inc           = po_coarse_inc;
        D_po_counter_load_en      = po_counter_load_en;
        D_po_counter_load_val     = po_counter_load_val;
        D_po_counter_read_en      = po_counter_read_en;
    D_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;

        D_idelay_ce               = idelay_ce;
        D_idelay_ld               = idelay_ld;
        D_fine_delay              = fine_delay ;
        D_fine_delay_sel          = fine_delay_sel;

     end
    endcase
    end
end