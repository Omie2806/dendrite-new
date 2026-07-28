module tb_pe;
parameter DATA_WIDTH = 64;

logic clk;
logic reset;
logic[3 : 0] operand_srcA1;
logic[3 : 0] operand_srcB1;

logic[3 : 0] operand_srcA2;
logic[3 : 0] operand_srcB2;

logic[3 : 0] operand_srcA3;
logic[3 : 0] operand_srcB3;

logic[3 : 0] operand_srcA4;
logic[3 : 0] operand_srcB4;

logic[DATA_WIDTH - 1 : 0] A_TB1;
logic[DATA_WIDTH - 1 : 0] B_TB1;
logic[DATA_WIDTH - 1 : 0] RESULT1;
logic[DATA_WIDTH - 1 : 0] RESULT2;
logic[DATA_WIDTH - 1 : 0] RESULT3;
logic[DATA_WIDTH - 1 : 0] RESULT4;

logic[DATA_WIDTH - 1 : 0] A_TB2;
logic[DATA_WIDTH - 1 : 0] B_TB2;

logic[DATA_WIDTH - 1 : 0] A_TB3;
logic[DATA_WIDTH - 1 : 0] B_TB3;

logic[DATA_WIDTH - 1 : 0] A_TB4;
logic[DATA_WIDTH - 1 : 0] B_TB4;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

top_pe top_dut (.*);

initial begin
    //apply reset after every test
    //will have to clear operand_src and make operand 0 after the required number of operations have been done
    @(posedge clk);
    reset = 1;

    operand_srcA1 = 4'b0000; operand_srcB1 = 4'b0000;
    operand_srcA2 = 4'b0000; operand_srcB2 = 4'b0000;
    operand_srcA3 = 4'b0000; operand_srcB3 = 4'b0000;
    operand_srcA4 = 4'b0000; operand_srcB4 = 4'b0000;

    A_TB1 = 64'd0;  B_TB1 = 64'd0;
    A_TB2 = 64'd0;  B_TB2 = 64'd0;
    A_TB3 = 64'd0;  B_TB3 = 64'd0;
    A_TB4 = 64'd0;  B_TB4 = 64'd0;
    repeat(2)@(posedge clk);
    reset = 0;

//test 1 - check result1 forward to the next pe 
    @(posedge clk);
    operand_srcA1 = 4'b0000; operand_srcB1 = 4'b0000;
    operand_srcA2 = 4'b0001; operand_srcB2 = 4'b0001;
    operand_srcA3 = 4'b0000; operand_srcB3 = 4'b0000;
    operand_srcA4 = 4'b0000; operand_srcB4 = 4'b0000;

    A_TB1 = 64'd2;  B_TB1 = 64'd3;
    A_TB2 = 64'd0;  B_TB2 = 64'd0;
    A_TB3 = 64'd0;  B_TB3 = 64'd0;
    A_TB4 = 64'd0;  B_TB4 = 64'd0;
    repeat(3)@(posedge clk);

    reset = 1;

    operand_srcA1 = 4'b0000; operand_srcB1 = 4'b0000;
    operand_srcA2 = 4'b0000; operand_srcB2 = 4'b0000;
    operand_srcA3 = 4'b0000; operand_srcB3 = 4'b0000;
    operand_srcA4 = 4'b0000; operand_srcB4 = 4'b0000;

    A_TB1 = 64'd0;  B_TB1 = 64'd0;
    A_TB2 = 64'd0;  B_TB2 = 64'd0;
    A_TB3 = 64'd0;  B_TB3 = 64'd0;
    A_TB4 = 64'd0;  B_TB4 = 64'd0;
    repeat(2)@(posedge clk);
    reset = 0;

//test 2 - forward result1 to all PEs 
    @(posedge clk);
    operand_srcA1 = 4'b0000; operand_srcB1 = 4'b0000;
    operand_srcA2 = 4'b0001; operand_srcB2 = 4'b0001;
    operand_srcA3 = 4'b0001; operand_srcB3 = 4'b0001;
    operand_srcA4 = 4'b0001; operand_srcB4 = 4'b0001;

    A_TB1 = 64'd2;  B_TB1 = 64'd3;
    A_TB2 = 64'd0;  B_TB2 = 64'd0;
    A_TB3 = 64'd0;  B_TB3 = 64'd0;
    A_TB4 = 64'd0;  B_TB4 = 64'd0;
    repeat(3)@(posedge clk);

    reset = 1;

    operand_srcA1 = 4'b0000; operand_srcB1 = 4'b0000;
    operand_srcA2 = 4'b0000; operand_srcB2 = 4'b0000;
    operand_srcA3 = 4'b0000; operand_srcB3 = 4'b0000;
    operand_srcA4 = 4'b0000; operand_srcB4 = 4'b0000;

    A_TB1 = 64'd0;  B_TB1 = 64'd0;
    A_TB2 = 64'd0;  B_TB2 = 64'd0;
    A_TB3 = 64'd0;  B_TB3 = 64'd0;
    A_TB4 = 64'd0;  B_TB4 = 64'd0;
    repeat(2)@(posedge clk);
    reset = 0;

//test 3 - chain the forwarding, result1 then result2 and so on
//will have to clear operand_src and make operand 0 after the required number of operations have been done
    @(posedge clk);
    operand_srcA1 = 4'b0000; operand_srcB1 = 4'b0000;
    operand_srcA2 = 4'b0001; operand_srcB2 = 4'b0001;
    operand_srcA3 = 4'b0010; operand_srcB3 = 4'b0010;
    operand_srcA4 = 4'b0011; operand_srcB4 = 4'b0011;

    A_TB1 = 64'd2;  B_TB1 = 64'd3;
    A_TB2 = 64'd0;  B_TB2 = 64'd0;
    A_TB3 = 64'd0;  B_TB3 = 64'd0;
    A_TB4 = 64'd0;  B_TB4 = 64'd0;
    @(posedge clk);
    A_TB1 = 64'd0;  B_TB1 = 64'd0;
    A_TB2 = 64'd0;  B_TB2 = 64'd0;
    A_TB3 = 64'd0;  B_TB3 = 64'd0;
    A_TB4 = 64'd0;  B_TB4 = 64'd0;
    repeat(6)@(posedge clk);

    reset = 1;

    operand_srcA1 = 4'b0000; operand_srcB1 = 4'b0000;
    operand_srcA2 = 4'b0000; operand_srcB2 = 4'b0000;
    operand_srcA3 = 4'b0000; operand_srcB3 = 4'b0000;
    operand_srcA4 = 4'b0000; operand_srcB4 = 4'b0000;

    A_TB1 = 64'd0;  B_TB1 = 64'd0;
    A_TB2 = 64'd0;  B_TB2 = 64'd0;
    A_TB3 = 64'd0;  B_TB3 = 64'd0;
    A_TB4 = 64'd0;  B_TB4 = 64'd0;
    repeat(2)@(posedge clk);
    reset = 0;

//test 4- simple MAC 
    @(posedge clk);
    operand_srcA1 = 4'b0000; operand_srcB1 = 4'b0000;
    operand_srcA2 = 4'b0000; operand_srcB2 = 4'b0000;
    operand_srcA3 = 4'b0000; operand_srcB3 = 4'b0000;
    operand_srcA4 = 4'b0000; operand_srcB4 = 4'b0000;

    A_TB1 = 64'd2;  B_TB1 = 64'd3;
    A_TB2 = 64'd1;  B_TB2 = 64'd2;
    A_TB3 = 64'd2;  B_TB3 = 64'd2;
    A_TB4 = 64'd2;  B_TB4 = 64'd7;
    repeat(3)@(posedge clk);

    $finish;

end

endmodule
