generate   
if ( C_CALIB_SOFT_IP != "TRUE") begin: gen_no_term_calib   
    assign DONE_SOFTANDHARD_CAL = 1'b0;
    assign MCB_SYSRST = int_sys_rst | (~wait_200us_counter[15]);
    assign mcb_recal = calib_recal;
    assign mcb_ui_read = ui_read;
    assign mcb_ui_add = ui_add;
    assign mcb_ui_cs = ui_cs;  
    assign mcb_ui_clk = ui_clk;
    assign mcb_ui_sdi = ui_sdi;
    assign mcb_ui_addr = ui_addr;
    assign mcb_ui_broadcast = ui_broadcast;
    assign mcb_ui_drp_update = ui_drp_update;
    assign mcb_ui_done_cal = ui_done_cal;
    assign mcb_ui_cmd = ui_cmd;
    assign mcb_ui_cmd_in = ui_cmd_in;
    assign mcb_ui_cmd_en = ui_cmd_en;
    assign mcb_ui_dq_lower_dec = ui_dq_lower_dec;
    assign mcb_ui_dq_lower_inc = ui_dq_lower_inc;
    assign mcb_ui_dq_upper_dec = ui_dq_upper_dec;
    assign mcb_ui_dq_upper_inc = ui_dq_upper_inc;
    assign mcb_ui_udqs_inc = ui_udqs_inc;
    assign mcb_ui_udqs_dec = ui_udqs_dec;
    assign mcb_ui_ldqs_inc = ui_ldqs_inc;
    assign mcb_ui_ldqs_dec = ui_ldqs_dec; 
    assign selfrefresh_mode = 1'b0;
 