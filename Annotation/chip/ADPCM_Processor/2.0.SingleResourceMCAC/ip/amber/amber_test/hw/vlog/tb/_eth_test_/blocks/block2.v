task print_pkt;
input        tx;   
input [31:0] start;
reg   [15:0] eth_type;
reg   [7:0]  proto;
reg   [31:0] frame;
reg   [3:0]  ip_hdr_len;
reg   [15:0] ip_len;
reg   [3:0]  tcp_hdr_len;
reg   [15:0] tcp_bdy_len;
reg   [7:0]  tmp;
reg   [15:0] arp_op;

integer      i;
begin
    frame = start;
    
    if (tx) $write("%6d pkt to   amber ", tb.clk_count);
    else    $write("%6d pkt from amber ", tb.clk_count);
    
    $display("mac-dst %h:%h:%h:%h:%h:%h, mac-src %h:%h:%h:%h:%h:%h, type %h%h", 
        rmem(tx,frame+0), rmem(tx,frame+1),rmem(tx,frame+2),rmem(tx,frame+3),rmem(tx,frame+4),rmem(tx,frame+5),
        rmem(tx,frame+6), rmem(tx,frame+7),rmem(tx,frame+8),rmem(tx,frame+9),rmem(tx,frame+10),rmem(tx,frame+11),
        rmem(tx,frame+12),rmem(tx,frame+13));
        
    eth_type = {rmem(tx,frame+12),rmem(tx,frame+13)};

    if (eth_type == 16'h0806) 
        begin
        frame       = frame + 14;
        arp_op      = rmem(tx,frame+6) << 8 | rmem(tx,frame+7);
        
        $write("ARP operation %0d", arp_op);
      
        if (arp_op == 16'd1)
            $write(" look for ip %0d.%0d.%0d.%0d", 
                rmem(tx,frame+24), rmem(tx,frame+25),rmem(tx,frame+26),rmem(tx,frame+27));  
        $write("\n");      
        end
    
    if (eth_type == 16'h0800) 
        begin
        frame       = frame + 14;
        proto       = rmem(tx,frame+9);
        tmp         = rmem(tx,frame+0);
        ip_hdr_len  = tmp[3:0];
        ip_len      = {rmem(tx,frame+2), rmem(tx,frame+3)};
        
        $display("   ip-dst %0d.%0d.%0d.%0d, ip-src %0d.%0d.%0d.%0d, proto %0d, ip_len %0d, ihl %0d", 
            rmem(tx,frame+16), rmem(tx,frame+17),rmem(tx,frame+18),rmem(tx,frame+19),
            rmem(tx,frame+12), rmem(tx,frame+13),rmem(tx,frame+14),rmem(tx,frame+15), 
            proto, ip_len, ip_hdr_len*4);
        
        if (proto == 8'd6) 
            begin
            frame       = frame + ip_hdr_len*4;
            tmp         = rmem(tx,frame+12);
            tcp_hdr_len = tmp[7:4];
            tcp_bdy_len = ip_len - ({ip_hdr_len,2'd0} + {tcp_hdr_len,2'd0});
            
            $display("   tcp-dst %0d, tcp-src %0d, tcp hdr len %0d, tcp bdy len %0d", 
                {rmem(tx,frame+2), rmem(tx,frame+3)},
                {rmem(tx,frame+0), rmem(tx,frame+1)}, tcp_hdr_len*4, tcp_bdy_len);
            $display("   tcp-seq %0d, tcp-ack %0d", 
                {rmem(tx,frame+4), rmem(tx,frame+5), rmem(tx,frame+6), rmem(tx,frame+7)},
                {rmem(tx,frame+8), rmem(tx,frame+9), rmem(tx,frame+10), rmem(tx,frame+11)});
                
            if (tcp_bdy_len != 16'd0)
                begin
                for (i=0;i<tcp_bdy_len;i=i+1)
                    if ((rmem(tx,frame+tcp_hdr_len*4+i) > 31 && rmem(tx,frame+tcp_hdr_len*4+i) < 128) ||
                        (rmem(tx,frame+tcp_hdr_len*4+i) == "\n"))
                        $write("%c",  rmem(tx,frame+tcp_hdr_len*4+i));
                end
                
            end
        end
    $display("----");
end
endtask