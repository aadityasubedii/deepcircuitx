assign r13_out = usr_exec ? r13      :
                 svc_exec ? r13_svc  :
                 irq_exec ? r13_irq  :
                          r13_firq ;