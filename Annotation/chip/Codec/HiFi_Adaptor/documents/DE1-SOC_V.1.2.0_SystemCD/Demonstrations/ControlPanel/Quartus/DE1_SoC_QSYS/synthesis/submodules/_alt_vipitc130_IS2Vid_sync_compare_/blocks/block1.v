always @ (state or sof_cvi_int or sof_cvo_int) begin
    next_state = state;
    case(state)
        `SC_CVI: begin
            if(sof_cvo_int & sof_cvi_int)
                next_state = `SC_IDLE;
            else if(sof_cvo_int)
                next_state = `SC_CVO;
        end
        `SC_CVO: begin
             if(sof_cvi_int & sof_cvo_int)
                 next_state = `SC_IDLE;
             else if(sof_cvi_int)
                 next_state = `SC_CVI;
        end
        default: begin
            if(sof_cvi_int & ~sof_cvo_int)
                next_state = `SC_CVI;
            else if(~sof_cvi_int & sof_cvo_int)
                next_state = `SC_CVO;
        end
    endcase
end