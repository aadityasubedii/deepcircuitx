    task go;
        begin
            en <= 1;
            @(posedge ck);
            en <= 0;
            @(posedge ck);
        end
    endtask