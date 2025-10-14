/********1*********2*********3*********4*********5*********6*********7*********8
*
* FILE      : clk50MHz.v
* FUNCTION  : 50MHz clock generator
* AUTHOR    :
*
*_______________________________________________________________________________
*
* REVISION HISTORY
*
* Name                 Date         Comments
* ------------------------------------------------------------------------------
* rcasanova         26/Feb/2013  Created
* ------------------------------------------------------------------------------
*_______________________________________________________________________________
* 
* FUNCTIONAL DESCRIPTION 
*
*_______________________________________________________________________________
* 
* (c) Copyright Universitat de Barcelona, 2013 
* All rights reserved. Copying or other reproduction of this 
* program except for archival purposes is prohibited.
*
*********1*********2*********3*********4*********5*********6*********7*********/
`timescale 1ns/100ps

module sys_clk50MHz_fm (                  
    Clk                   
    );

`define DATA_SKEW #1 

output          Clk            ;   // Generated clock
reg             Clk            ;   

// Initialization of all signals and variables
initial begin
    Clk=0;
end

initial begin
    forever begin
        Clk=1;
        #100;
        Clk=0;
        #100;
    end
end


// -----------------------------------------------------------------------------
// Task: sys.waitCycles(<cycles>)
// <cycles>: number of clock positive edges to wait
// -----------------------------------------------------------------------------

task waitCycles;
input [31:0] cycles;
begin
    repeat (cycles)
        @(posedge Clk);
    `DATA_SKEW;
end
endtask // waitCycles

endmodule