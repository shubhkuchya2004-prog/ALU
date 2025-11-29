// Basic ALU supporting ADD, SUB, AND, OR, NOT
// Parameterizable width
module alu #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    input  wire [2:0]       opcode,
    output reg  [WIDTH-1:0] result,
    output reg              Z,  // zero
    output reg              N,  // negative (sign)
    output reg              C,  // carry / borrow indicator
    output reg              V   // overflow (signed)
);

    // internal widened signals to capture carry-out
    reg [WIDTH:0] wide_sum;
    reg [WIDTH:0] wide_sub;

    always @(*) begin
        // defaults
        result = {WIDTH{1'b0}};
        Z = 1'b0;
        N = 1'b0;
        C = 1'b0;
        V = 1'b0;
        wide_sum = { (WIDTH+1){1'b0} };
        wide_sub = { (WIDTH+1){1'b0} };

        case (opcode)
            3'b000: begin // ADD
                wide_sum = {1'b0, A} + {1'b0, B};
                result = wide_sum[WIDTH-1:0];
                C = wide_sum[WIDTH]; // carry-out
                // overflow for addition:
                // if A and B have same sign, and result has different sign -> overflow
                V = (A[WIDTH-1] & B[WIDTH-1] & ~result[WIDTH-1]) |
                    (~A[WIDTH-1] & ~B[WIDTH-1] & result[WIDTH-1]);
            end

            3'b001: begin // SUB (A - B)
                // A - B = A + (~B) + 1
                wide_sub = {1'b0, A} + {1'b0, ~B} + 1'b1;
                result = wide_sub[WIDTH-1:0];
                C = wide_sub[WIDTH]; // carry-out (1 means no borrow in unsigned subtraction)
                // overflow for subtraction:
                // if A and B have different signs and result sign differs from A -> overflow
                V = (A[WIDTH-1] & ~B[WIDTH-1] & ~result[WIDTH-1]) |
                    (~A[WIDTH-1] & B[WIDTH-1] & result[WIDTH-1]);
            end

            3'b010: begin // AND
                result = A & B;
                C = 1'b0;
                V = 1'b0;
            end

            3'b011: begin // OR
                result = A | B;
                C = 1'b0;
                V = 1'b0;
            end

            3'b100: begin // NOT (unary, apply to A)
                result = ~A;
                C = 1'b0;
                V = 1'b0;
            end

            default: begin
                result = {WIDTH{1'b0}};
                C = 1'b0;
                V = 1'b0;
            end
        endcase

        // common flags
        Z = (result == {WIDTH{1'b0}});
        N = result[WIDTH-1];
    end

endmodule
