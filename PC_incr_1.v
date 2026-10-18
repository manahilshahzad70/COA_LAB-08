module program_counter_auto (
    input wire clk,
    input wire reset,
    output reg [3:0] pc
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 4'b0000;
        else
            pc <= pc + 1'b1;
    end

endmodule
module instruction_memory_8bit (
    input wire [7:0] addr,
    output reg [7:0] instruction
);

    reg [7:0] memory [0:15];
    integer i;

    initial begin
        for (i = 0; i < 16; i = i + 1)
            memory[i] = 8'b00000000;

        memory[0]  = 8'h11;
        memory[1]  = 8'h22;
        memory[2]  = 8'h33;
        memory[3]  = 8'h44;
        memory[4]  = 8'h55;
        memory[5]  = 8'h66;
        memory[6]  = 8'h77;
        memory[7]  = 8'h88;
        memory[8]  = 8'h99;
        memory[9]  = 8'hAA;
        memory[10] = 8'hBB;
        memory[11] = 8'hCC;
        memory[12] = 8'hDD;
        memory[13] = 8'hEE;
        memory[14] = 8'hF0;
        memory[15] = 8'hFF;
    end

    always @(*) begin
        if (addr < 16)
            instruction = memory[addr];
        else
            instruction = 8'b00000000;
    end

endmodule
module tb_task2;

    reg clk;
    reg reset;
    reg [7:0] test_addr;

    wire [3:0] pc;
    wire [7:0] instruction;
    wire [7:0] instruction_for_test;

    program_counter_auto pc_unit (.clk(clk),.reset(reset),.pc(pc));

    instruction_memory_8bit im_unit(.addr({4'b0000, pc}),.instruction(instruction));

    instruction_memory_8bit check_invalid(.addr(test_addr),.instruction(instruction_for_test));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        test_addr = 0;

        #10; reset = 0;

        #180; test_addr = 8'd20;

        #10; $finish;
    end

endmodule