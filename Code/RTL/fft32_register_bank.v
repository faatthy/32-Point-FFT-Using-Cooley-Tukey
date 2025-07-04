module Register #
(
    parameter DATA_WIDTH = 16
)
(
    input                   clk,
    input                   rst_n,
    input                   en,
    input       [DATA_WIDTH-1:0]     in1,
    input       [DATA_WIDTH-1:0]     in2,
    input       [DATA_WIDTH-1:0]     in3,
    input       [DATA_WIDTH-1:0]     in4,
    input       [DATA_WIDTH-1:0]     in5,
    input       [DATA_WIDTH-1:0]     in6,
    input       [DATA_WIDTH-1:0]     in7,
    input       [DATA_WIDTH-1:0]     in8,
    input       [DATA_WIDTH-1:0]     in9,
    input       [DATA_WIDTH-1:0]     in10,
    input       [DATA_WIDTH-1:0]     in11,
    input       [DATA_WIDTH-1:0]     in12,
    input       [DATA_WIDTH-1:0]     in13,
    input       [DATA_WIDTH-1:0]     in14,
    input       [DATA_WIDTH-1:0]     in15,
    input       [DATA_WIDTH-1:0]     in16,
    input       [DATA_WIDTH-1:0]     in17,
    input       [DATA_WIDTH-1:0]     in18,
    input       [DATA_WIDTH-1:0]     in19,
    input       [DATA_WIDTH-1:0]     in20,
    input       [DATA_WIDTH-1:0]     in21,
    input       [DATA_WIDTH-1:0]     in22,
    input       [DATA_WIDTH-1:0]     in23,
    input       [DATA_WIDTH-1:0]     in24,
    input       [DATA_WIDTH-1:0]     in25,
    input       [DATA_WIDTH-1:0]     in26,
    input       [DATA_WIDTH-1:0]     in27,
    input       [DATA_WIDTH-1:0]     in28,
    input       [DATA_WIDTH-1:0]     in29,
    input       [DATA_WIDTH-1:0]     in30,
    input       [DATA_WIDTH-1:0]     in31,
    input       [DATA_WIDTH-1:0]     in32,

    output reg  [DATA_WIDTH-1:0]     out1,
    output reg  [DATA_WIDTH-1:0]     out2,
    output reg  [DATA_WIDTH-1:0]     out3,
    output reg  [DATA_WIDTH-1:0]     out4,
    output reg  [DATA_WIDTH-1:0]     out5,
    output reg  [DATA_WIDTH-1:0]     out6,
    output reg  [DATA_WIDTH-1:0]     out7,
    output reg  [DATA_WIDTH-1:0]     out8,
    output reg  [DATA_WIDTH-1:0]     out9,
    output reg  [DATA_WIDTH-1:0]     out10,
    output reg  [DATA_WIDTH-1:0]     out11,
    output reg  [DATA_WIDTH-1:0]     out12,
    output reg  [DATA_WIDTH-1:0]     out13,
    output reg  [DATA_WIDTH-1:0]     out14,
    output reg  [DATA_WIDTH-1:0]     out15,
    output reg  [DATA_WIDTH-1:0]     out16,
    output reg  [DATA_WIDTH-1:0]     out17,
    output reg  [DATA_WIDTH-1:0]     out18,
    output reg  [DATA_WIDTH-1:0]     out19,
    output reg  [DATA_WIDTH-1:0]     out20,
    output reg  [DATA_WIDTH-1:0]     out21,
    output reg  [DATA_WIDTH-1:0]     out22,
    output reg  [DATA_WIDTH-1:0]     out23,
    output reg  [DATA_WIDTH-1:0]     out24,
    output reg  [DATA_WIDTH-1:0]     out25,
    output reg  [DATA_WIDTH-1:0]     out26,
    output reg  [DATA_WIDTH-1:0]     out27,
    output reg  [DATA_WIDTH-1:0]     out28,
    output reg  [DATA_WIDTH-1:0]     out29,
    output reg  [DATA_WIDTH-1:0]     out30,
    output reg  [DATA_WIDTH-1:0]     out31,
    output reg  [DATA_WIDTH-1:0]     out32

);

    always @ (posedge clk , negedge rst_n) begin
      if(!rst_n) begin
        out1  <= 0;
        out2  <= 0;
        out3  <= 0;
        out4  <= 0;
        out5  <= 0;
        out6  <= 0;
        out7  <= 0;
        out8  <= 0;
        out9  <= 0;
        out10 <= 0;
        out11 <= 0;
        out12 <= 0;
        out13 <= 0;
        out14 <= 0;
        out15 <= 0;
        out16 <= 0;
        out17 <= 0;
        out18 <= 0;
        out19 <= 0;
        out20 <= 0;
        out21 <= 0;
        out22 <= 0;
        out23 <= 0;
        out24 <= 0;
        out25 <= 0;
        out26 <= 0;
        out27 <= 0;
        out28 <= 0;
        out29 <= 0;
        out30 <= 0;
        out31 <= 0;
        out32 <= 0;
      end
      else if(en)begin
        out1  <= in1;
        out2  <= in2;
        out3  <= in3;
        out4  <= in4;
        out5  <= in5;
        out6  <= in6;
        out7  <= in7;
        out8  <= in8;
        out9  <= in9;
        out10 <= in10;
        out11 <= in11;
        out12 <= in12;
        out13 <= in13;
        out14 <= in14;
        out15 <= in15;
        out16 <= in16;
        out17 <= in17;
        out18 <= in18;
        out19 <= in19;
        out20 <= in20;
        out21 <= in21;
        out22 <= in22;
        out23 <= in23;
        out24 <= in24;
        out25 <= in25;
        out26 <= in26;
        out27 <= in27;
        out28 <= in28;
        out29 <= in29;
        out30 <= in30;
        out31 <= in31;
        out32 <= in32;
      end
    end 

endmodule

