
module program_counter_4bit (
    input wire clk,
    input wire reset,
    input wire [3:0] addr,
    output reg [3:0] pc
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 4'b0000;
        else
            pc <= addr;
    end

endmodule


module tb_task1;

    reg clk;
    reg reset;
    reg [3:0] addr;
    wire [3:0] pc;

    program_counter_4bit uut (.clk(clk),.reset(reset),.addr(addr),.pc(pc));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        addr = 4'b0000;

        #10 reset = 0;

        addr = 4'b0001;
        #10;

        addr = 4'b0101;
        #10;

        addr = 4'b1010;
        #10;

        addr = 4'b1111;
        #10;

  
    end

endmodule
