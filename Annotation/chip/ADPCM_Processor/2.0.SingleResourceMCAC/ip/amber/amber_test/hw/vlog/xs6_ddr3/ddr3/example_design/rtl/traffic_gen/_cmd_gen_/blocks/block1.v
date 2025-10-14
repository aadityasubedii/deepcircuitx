always @ (prbs_bl)
if (FAMILY == "SPARTAN6")  
    prbs_brlen =  (prbs_bl[5:0] == 6'b000000) ? 6'b000001: prbs_bl[5:0];
else 
     prbs_brlen =  6'b000010;
endgenerate