    function [WAYS-1:0] pick_way;
    input [WAYS-1:0] valid_bits;
    input [3:0]      random_num;
    begin
        if (      valid_bits[0] == 1'd0 )
            
            pick_way     = 3'b001;
        else if ( valid_bits[1] == 1'd0 )
            
            pick_way     = 3'b010;
        else if ( valid_bits[2] == 1'd0 )
            
            pick_way     = 3'b100;
        else
            begin
            
            case (random_num[3:1])
                3'd0, 3'd1, 3'd2: pick_way = 3'b010;
                3'd2, 3'd3, 3'd4: pick_way = 3'b100;
                default:          pick_way = 3'b001;
            endcase
            end
    end
    endfunction