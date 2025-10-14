    function [WAYS-1:0] pick_way;
    input [WAYS-1:0] valid_bits;
    input [3:0]      random_num;
    begin
        if (      valid_bits[0] == 1'd0 )
            
            pick_way     = 2'b01;
        else if ( valid_bits[1] == 1'd0 )
            
            pick_way     = 2'b10;
        else
            begin
            
            case (random_num[3:1])
                3'd0, 3'd3,
                3'd5, 3'd6: pick_way = 2'b10;
                default:    pick_way = 2'b01;
            endcase
            end
    end
    endfunction