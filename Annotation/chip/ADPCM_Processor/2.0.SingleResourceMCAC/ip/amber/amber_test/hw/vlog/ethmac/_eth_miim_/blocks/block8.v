always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    begin
      InProgress <= #Tp 1'b0;
      WriteOp <= #Tp 1'b0;
    end
  else
    begin
      if(MdcEn)
        begin
          if(StartOp)
            begin
              if(~InProgress)
                WriteOp <= #Tp WriteDataOp;
              InProgress <= #Tp 1'b1;
            end
          else
            begin
              if(EndOp)
                begin
                  InProgress <= #Tp 1'b0;
                  WriteOp <= #Tp 1'b0;
                end
            end
        end
    end
end