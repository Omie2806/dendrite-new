module top_pe #(
    parameter DATA_WIDTH = 64
) (
    input logic reset,
    input logic clk,
    input logic[3 : 0] operand_srcA1,
    input logic[3 : 0] operand_srcB1,

    input logic[3 : 0] operand_srcA2,
    input logic[3 : 0] operand_srcB2,

    input logic[3 : 0] operand_srcA3,
    input logic[3 : 0] operand_srcB3,

    input logic[3 : 0] operand_srcA4,
    input logic[3 : 0] operand_srcB4,

    input logic[DATA_WIDTH - 1 : 0] A_TB1,
    input logic[DATA_WIDTH - 1 : 0] B_TB1,

    input logic[DATA_WIDTH - 1 : 0] A_TB2,
    input logic[DATA_WIDTH - 1 : 0] B_TB2,

    input logic[DATA_WIDTH - 1 : 0] A_TB3,
    input logic[DATA_WIDTH - 1 : 0] B_TB3,

    input logic[DATA_WIDTH - 1 : 0] A_TB4,
    input logic[DATA_WIDTH - 1 : 0] B_TB4,

    output logic[DATA_WIDTH - 1 : 0] RESULT1,

    output logic[DATA_WIDTH - 1 : 0] RESULT2,

    output logic[DATA_WIDTH - 1 : 0] RESULT3,

    output logic[DATA_WIDTH - 1 : 0] RESULT4
);


logic[DATA_WIDTH - 1 : 0] A1;
logic[DATA_WIDTH - 1 : 0] B1;
// logic[DATA_WIDTH - 1 : 0] RESULT1;

logic[DATA_WIDTH - 1 : 0] A2;
logic[DATA_WIDTH - 1 : 0] B2;
// logic[DATA_WIDTH - 1 : 0] RESULT2;

logic[DATA_WIDTH - 1 : 0] A3;
logic[DATA_WIDTH - 1 : 0] B3;
// logic[DATA_WIDTH - 1 : 0] RESULT3;

logic[DATA_WIDTH - 1 : 0] A4;
logic[DATA_WIDTH - 1 : 0] B4;
// logic[DATA_WIDTH - 1 : 0] RESULT4;


always_comb begin
    case (operand_srcA1)
        4'b0000: A1 = A_TB1;
        4'b0001: A1 = RESULT2;
        4'B0010: A1 = RESULT3;
        4'B0011: A1 = RESULT4;
        default: A1 = A_TB1;
    endcase

    case (operand_srcB1)
        4'b0000: B1 = B_TB1;
        4'b0001: B1 = RESULT2;
        4'B0010: B1 = RESULT3;
        4'B0011: B1 = RESULT4;
        default: B1 = B_TB1;
    endcase

    case (operand_srcA2)
        4'b0000: A2 = A_TB2;
        4'b0001: A2 = RESULT1;
        4'B0010: A2 = RESULT3;
        4'B0011: A2 = RESULT4;
        default: A2 = A_TB2;
    endcase

    case (operand_srcB2)
        4'b0000: B2 = B_TB2;
        4'b0001: B2 = RESULT1;
        4'B0010: B2 = RESULT3;
        4'B0011: B2 = RESULT4;
        default: B2 = B_TB2;
    endcase

    case (operand_srcA3)
        4'b0000: A3 = A_TB3;
        4'b0001: A3 = RESULT1;
        4'B0010: A3 = RESULT2;
        4'B0011: A3 = RESULT4;
        default: A3 = A_TB3;
    endcase

    case (operand_srcB3)
        4'b0000: B3 = B_TB3;
        4'b0001: B3 = RESULT1;
        4'B0010: B3 = RESULT2;
        4'B0011: B3 = RESULT4;
        default: B3 = B_TB3;
    endcase

    case (operand_srcA4)
        4'b0000: A4 = A_TB4;
        4'b0001: A4 = RESULT1;
        4'B0010: A4 = RESULT2;
        4'B0011: A4 = RESULT3;
        default: A4 = A_TB4;
    endcase

    case (operand_srcB4)
        4'b0000: B4 = B_TB4;
        4'b0001: B4 = RESULT1;
        4'B0010: B4 = RESULT2;
        4'B0011: B4 = RESULT3;
        default: B4 = B_TB4;
    endcase
end

pe dut1 (
    .clk(clk),
    .reset(reset),
    .A(A1),
    .B(B1),
    .RESULT(RESULT1)
);

pe dut2 (
    .clk(clk),
    .reset(reset),
    .A(A2),
    .B(B2),
    .RESULT(RESULT2)
);

pe dut3 (
    .clk(clk),
    .reset(reset),
    .A(A3),
    .B(B3),
    .RESULT(RESULT3)
);

pe dut4 (
    .clk(clk),
    .reset(reset),
    .A(A4),
    .B(B4),
    .RESULT(RESULT4)
);


endmodule
