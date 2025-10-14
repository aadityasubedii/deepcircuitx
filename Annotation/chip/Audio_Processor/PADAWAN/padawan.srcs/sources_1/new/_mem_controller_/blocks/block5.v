always @ (posedge(clk_100MHz))begin
    if(rst == 1)begin
        count <= 0;
        pulse <= 0;
    end
    else if( count < MHz44cnt)begin
        count <= count + 1;
        pulse <= 0;
    end
    else begin 
        pulse <= 1; 
        count <= 0;
    end      
end