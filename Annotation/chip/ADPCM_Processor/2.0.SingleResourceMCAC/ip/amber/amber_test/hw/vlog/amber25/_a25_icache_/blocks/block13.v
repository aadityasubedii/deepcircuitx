    function [WAYS-1:0] pick_way;
    input [WAYS-1:0] valid_bits;
    input [3:0]      random_num;
    begin
        if (      valid_bits[0] == 1'd0 )
            
            pick_way     = 4'b0001;
        else if ( valid_bits[1] == 1'd0 )
            
            pick_way     = 4'b0010;
        else if ( valid_bits[2] == 1'd0 )
            
            pick_way     = 4'b0100;
        else if ( valid_bits[3] == 1'd0 )
            
            pick_way     = 4'b1000;
        else
            begin
            
            case (random_num[3:1])
                3'd0, 3'd1: pick_way = 4'b0100;
                3'd2, 3'd3: pick_way = 4'b1000;
                3'd4, 3'd5: pick_way = 4'b0001;
                default:    pick_way = 4'b0010;
            endcase
            end
    end
    endfunction