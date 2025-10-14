task fwrite_hex_drop_zeros;
input [31:0] file;
input [31:0] num;
    begin
    if (num[31:28] != 4'd0) 
        $fwrite(file, "%x", num);
    else if (num[27:24] != 4'd0) 
        $fwrite(file, "%x", num[27:0]);
    else if (num[23:20] != 4'd0) 
        $fwrite(file, "%x", num[23:0]);
    else if (num[19:16] != 4'd0) 
        $fwrite(file, "%x", num[19:0]);
    else if (num[15:12] != 4'd0) 
        $fwrite(file, "%x", num[15:0]);
    else if (num[11:8] != 4'd0) 
        $fwrite(file, "%x", num[11:0]);
    else if (num[7:4] != 4'd0) 
        $fwrite(file, "%x", num[7:0]);
    else
        $fwrite(file, "%x", num[3:0]);
        
    end
endtask