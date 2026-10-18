module instruction_memory_32bit (
    input wire [31:0] addr,
    output reg [31:0] instruction
);

    reg [31:0] memory [0:15];
    integer i;

    initial begin
        for (i = 0; i < 16; i = i + 1)
            memory[i] = 32'h00000013;

        memory[0]  = 32'h00100093;
        memory[1]  = 32'h00200113;
        memory[2]  = 32'h00300193;
        memory[3]  = 32'h00400213;
        memory[4]  = 32'h00500293;
        memory[5]  = 32'h00600313;
        memory[6]  = 32'h00700393;
        memory[7]  = 32'h00800413;
        memory[8]  = 32'h00900493;
        memory[9]  = 32'h00A00513;
        memory[10] = 32'h00B00593;
        memory[11] = 32'h00C00613;
        memory[12] = 32'h00D00693;
        memory[13] = 32'h00E00713;
        memory[14] = 32'h00F00793;
        memory[15] = 32'h01000813;
    end

    always @(*) begin
        if ((addr[31:6] == 0) && (addr[1:0] == 0))
            instruction = memory[addr[5:2]];
        else
            instruction = 32'h00000000;
    end

endmodule


module tb_task4;

    reg clk;
    reg reset;

    wire [31:0] pc;
    wire [31:0] instruction;

    program_counter_32bit pc_unit (.clk(clk),.reset(reset),.pc(pc));

    instruction_memory_32bit im_unit (.addr(pc),.instruction(instruction));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #12 reset = 0;

        repeat (18) @(negedge clk);

        $finish;
    end

endmodule
