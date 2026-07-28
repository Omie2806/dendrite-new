module pe #(
    parameter DATA_WIDTH = 64
) ( 
    input logic clk,
    input logic reset,
    input logic[DATA_WIDTH - 1 : 0] A,
    input logic[DATA_WIDTH - 1 : 0] B,
    output logic[DATA_WIDTH - 1 : 0]RESULT
);

always_ff @(posedge clk) begin
    if (reset) begin
        RESULT <= '0;
    end
    else begin
        RESULT <= RESULT + A * B;
    end
end
    
endmodule