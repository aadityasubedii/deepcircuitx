   generate if (PIPELINE_READY == 1) 
     begin : REGISTERED_READY_PLINE
        
        assign in_ready  = !full0;
