`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 04:33:28 PM
// Design Name: 
// Module Name: Data_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Data_Memory(
input logic Mem_read, Mem_write,
    input logic clk,
    input logic [31:0] mem_addr, write_data,
    output logic [31:0] mem_out //, current_mem_data
);

// Define memory array
logic [31:0] memory_array [0:31] = '{32{32'b0}}; // 15 32-bit words
//logic [31:0] memory_array ; // 4294967296 32-bit words (32-bit address space)


// Read data from memory initialization file
// initial begin
   // $readmemh("main_memory.mem", memory_array);
         //  memory_array[9] = 32'h00000003; // Writing data to address 0
    //    memory_array  = '{10{32'b0}};
//end
initial begin
       memory_array[12] = 32'h00000008;
end
// Write data to memory at the negative edge of the clock if Mem_W is asserted
always @(posedge clk) begin
    if (Mem_write)
        memory_array[mem_addr] <= write_data;
        // $writememh("main_memory.mem", memory_array);
end

// Read data from memory if Mem_R is asserted
always_comb begin
    // current_mem_data = memory_array[mem_addr] ;
    if (Mem_read)
        mem_out = memory_array[mem_addr];
    else
       mem_out = 32'b0; // Output zero if Mem_R is not asserted
end
endmodule
