    function [WAYS-1:0] pick_way;
    input [WAYS-1:0] valid_bits;
    input [3:0]      random_num;
    begin
        if (      valid_bits[0] == 1'd0 )
            
            pick_way     = 8'b00000001;
        else if ( valid_bits[1] == 1'd0 )
            
            pick_way     = 8'b00000010;
        else if ( valid_bits[2] == 1'd0 )
            
            pick_way     = 8'b00000100;
        else if ( valid_bits[3] == 1'd0 )
            
            pick_way     = 8'b00001000;
        else if ( valid_bits[4] == 1'd0 )
            
            pick_way     = 8'b00010000;
        else if ( valid_bits[5] == 1'd0 )
            
            pick_way     = 8'b00100000;
        else if ( valid_bits[6] == 1'd0 )
            
            pick_way     = 8'b01000000;
        else if ( valid_bits[7] == 1'd0 )
            
            pick_way     = 8'b10000000;
        else
            begin
            
            case (random_num[3:1])
                3'd0:       pick_way = 8'b00010000;
                3'd1:       pick_way = 8'b00100000;
                3'd2:       pick_way = 8'b01000000;
                3'd3:       pick_way = 8'b10000000;
                3'd4:       pick_way = 8'b00000001;
                3'd5:       pick_way = 8'b00000010;
                3'd6:       pick_way = 8'b00000100;
                default:    pick_way = 8'b00001000;
            endcase
            end
    end
    endfunction