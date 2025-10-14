function [7:0] rmem;
input        tx;   
input [31:0] addr;
begin
    if (tx)
        rmem = mem[addr+3];
    else
        rmem = rxm[addr];
end
endfunction