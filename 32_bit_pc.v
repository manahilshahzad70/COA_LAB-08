module program_counter_32bit (
    input wire clk,
    input wire reset,
    output reg [31:0] pc
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 32'h00000000;
        else
            pc <= pc + 32'd4;
    end

endmodule


module tb_task3;

    reg clk;
    reg reset;

    wire [31:0] pc;
    wire [3:0] pc_addr;

    program_counter_32bit uut (.clk(clk),.reset(reset),.pc(pc));

    assign pc_addr = pc[3:0];

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #12 reset = 0;

        repeat (8) @(negedge clk);

        $finish;
    end

endmodule