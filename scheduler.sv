//so there will be 16 PEs arraneged in SIMD manner
//each thread will have its own instruction and mapped to an 
//availabe PE
//for RVV vector ops, i'll be required to find multiple avaiable PEs 
//if there aren't enough PEs avaible then i will replay the instruction for the remaining vectors 

module scheduler #(
    parameter INSTR_WIDTH = 32,
    parameter ADDR_WIDTH  = 32,
    parameter DATA_WIDTH  = 64,
    parameter NO_OF_CU    = 16  //compute units
) (
    input logic clk,
    input logic reset,
    input logic [INSTR_WIDTH - 1 : 0] instr,
    input logic [NO_OF_CU - 1 : 0]    stall, //a combinational signal array to know which PEs are currently being used
    //i will output the register file addresses to the VRF 
    //and the operation type to the execution unit
    output logic[4 : 0] rs1[0 : NO_OF_CU - 1],
    output logic[4 : 0] rs2[0 : NO_OF_CU - 1],
    output logic[4 : 0] rd [0 : NO_OF_CU - 1],
    output logic[15 : 0] op_control[0 : NO_OF_CU - 1]   //output the operation type to the available PE
);

//the register file is banked according to the number of compute cores 

logic[3 : 0] avaible_pes;
logic[3 : 0] no_requires_pes;

always_comb begin
    for (integer m = 0; m < NO_OF_CU; m++) begin
        rs1[i] = 0;
        rs2[i] = 0;
        rd[i]  = 0;
       op_control[i] = 0; 
    end

    for (integer i = 0; i < NO_OF_CU; i++) begin
        if(!stall[i]) begin
            avaible_pes = avaible_pes + 1;
        end
    end
    
    no_requires_pes = instr[5 : 0] //define the correct field or calculate using SEW,LMUL and VLMAX;

    if(no_requires_pes == avaible_pes) begin
        for (integer i = 0; i < NO_OF_CU; i++) begin
            if (!stall[i]) begin
                op_control[i] = instr[5 : 0];
                rs1[i] = instr[5 : 0]; //read the correct instruction part according to rvv
                rs2[i] = instr[5 : 0];// ill need to change the intruction decode with every i to 
                rd[i]  = instr[5 : 0];//access the current bank
            end
        end
    end
end
    
endmodule
