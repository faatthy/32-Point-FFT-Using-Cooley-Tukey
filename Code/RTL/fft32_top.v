/*top module*/
module FFT_TOP
    #(
        parameter inADC = 8,
        parameter inWordWidth_1 = 13, //
        parameter inWordWidth_2 = 8,
        parameter  I1 = 16, // butterfly output before round
        parameter  F1 = 6, 
        parameter  I2 = 12, // butterfly output 
        parameter  F2 = 0  
    )
    (
        input clk,                           /*clock 20MHZ*/
        input rst_n,

        input signed [inADC-1:0] ADC_in0_real,
        input signed [inADC-1:0] ADC_in1_real,
        input signed [inADC-1:0] ADC_in2_real,
        input signed [inADC-1:0] ADC_in3_real,
        input signed [inADC-1:0] ADC_in4_real,
        input signed [inADC-1:0] ADC_in5_real,
        input signed [inADC-1:0] ADC_in6_real,
        input signed [inADC-1:0] ADC_in7_real,
        input signed [inADC-1:0] ADC_in8_real,
        input signed [inADC-1:0] ADC_in9_real,
        input signed [inADC-1:0] ADC_in10_real,
        input signed [inADC-1:0] ADC_in11_real,
        input signed [inADC-1:0] ADC_in12_real,
        input signed [inADC-1:0] ADC_in13_real,
        input signed [inADC-1:0] ADC_in14_real,
        input signed [inADC-1:0] ADC_in15_real,
        input signed [inADC-1:0] ADC_in16_real,
        input signed [inADC-1:0] ADC_in17_real,
        input signed [inADC-1:0] ADC_in18_real,
        input signed [inADC-1:0] ADC_in19_real,
        input signed [inADC-1:0] ADC_in20_real,
        input signed [inADC-1:0] ADC_in21_real,
        input signed [inADC-1:0] ADC_in22_real,
        input signed [inADC-1:0] ADC_in23_real,
        input signed [inADC-1:0] ADC_in24_real,
        input signed [inADC-1:0] ADC_in25_real,
        input signed [inADC-1:0] ADC_in26_real,
        input signed [inADC-1:0] ADC_in27_real,
        input signed [inADC-1:0] ADC_in28_real,
        input signed [inADC-1:0] ADC_in29_real,
        input signed [inADC-1:0] ADC_in30_real,
        input signed [inADC-1:0] ADC_in31_real,
 
        output signed [inWordWidth_1-1:0] output_0_real,
        output signed [inWordWidth_1-1:0] output_0_imag,
        output signed [inWordWidth_1-1:0] output_1_real,
        output signed [inWordWidth_1-1:0] output_1_imag,
        output signed [inWordWidth_1-1:0] output_2_real,
        output signed [inWordWidth_1-1:0] output_2_imag,
        output signed [inWordWidth_1-1:0] output_3_real,
        output signed [inWordWidth_1-1:0] output_3_imag,
        output signed [inWordWidth_1-1:0] output_4_real,
        output signed [inWordWidth_1-1:0] output_4_imag,
        output signed [inWordWidth_1-1:0] output_5_real,
        output signed [inWordWidth_1-1:0] output_5_imag,
        output signed [inWordWidth_1-1:0] output_6_real,
        output signed [inWordWidth_1-1:0] output_6_imag,
        output signed [inWordWidth_1-1:0] output_7_real,
        output signed [inWordWidth_1-1:0] output_7_imag,
        output signed [inWordWidth_1-1:0] output_8_real,
        output signed [inWordWidth_1-1:0] output_8_imag,
        output signed [inWordWidth_1-1:0] output_9_real,
        output signed [inWordWidth_1-1:0] output_9_imag,
        output signed [inWordWidth_1-1:0] output_10_real,
        output signed [inWordWidth_1-1:0] output_10_imag,
        output signed [inWordWidth_1-1:0] output_11_real,
        output signed [inWordWidth_1-1:0] output_11_imag,
        output signed [inWordWidth_1-1:0] output_12_real,
        output signed [inWordWidth_1-1:0] output_12_imag,
        output signed [inWordWidth_1-1:0] output_13_real,
        output signed [inWordWidth_1-1:0] output_13_imag,
        output signed [inWordWidth_1-1:0] output_14_real,
        output signed [inWordWidth_1-1:0] output_14_imag,
        output signed [inWordWidth_1-1:0] output_15_real,
        output signed [inWordWidth_1-1:0] output_15_imag,
        output signed [inWordWidth_1-1:0] output_16_real,
        output signed [inWordWidth_1-1:0] output_16_imag,
        output signed [inWordWidth_1-1:0] output_17_real,
        output signed [inWordWidth_1-1:0] output_17_imag,
        output signed [inWordWidth_1-1:0] output_18_real,
        output signed [inWordWidth_1-1:0] output_18_imag,
        output signed [inWordWidth_1-1:0] output_19_real,
        output signed [inWordWidth_1-1:0] output_19_imag,
        output signed [inWordWidth_1-1:0] output_20_real,
        output signed [inWordWidth_1-1:0] output_20_imag,
        output signed [inWordWidth_1-1:0] output_21_real,
        output signed [inWordWidth_1-1:0] output_21_imag,
        output signed [inWordWidth_1-1:0] output_22_real,
        output signed [inWordWidth_1-1:0] output_22_imag,
        output signed [inWordWidth_1-1:0] output_23_real,
        output signed [inWordWidth_1-1:0] output_23_imag,
        output signed [inWordWidth_1-1:0] output_24_real,
        output signed [inWordWidth_1-1:0] output_24_imag,
        output signed [inWordWidth_1-1:0] output_25_real,
        output signed [inWordWidth_1-1:0] output_25_imag,
        output signed [inWordWidth_1-1:0] output_26_real,
        output signed [inWordWidth_1-1:0] output_26_imag,
        output signed [inWordWidth_1-1:0] output_27_real,
        output signed [inWordWidth_1-1:0] output_27_imag,
        output signed [inWordWidth_1-1:0] output_28_real,
        output signed [inWordWidth_1-1:0] output_28_imag,
        output signed [inWordWidth_1-1:0] output_29_real,
        output signed [inWordWidth_1-1:0] output_29_imag,
        output signed [inWordWidth_1-1:0] output_30_real,
        output signed [inWordWidth_1-1:0] output_30_imag,
        output signed [inWordWidth_1-1:0] output_31_real,
        output signed [inWordWidth_1-1:0] output_31_imag
    );



    wire reg_slow_enable ;

    wire signed [inADC-1:0] in0_reg;
    wire signed [inADC-1:0] in1_reg;
    wire signed [inADC-1:0] in2_reg;
    wire signed [inADC-1:0] in3_reg;
    wire signed [inADC-1:0] in4_reg;
    wire signed [inADC-1:0] in5_reg;
    wire signed [inADC-1:0] in6_reg;
    wire signed [inADC-1:0] in7_reg;
    wire signed [inADC-1:0] in8_reg;
    wire signed [inADC-1:0] in9_reg;
    wire signed [inADC-1:0] in10_reg;
    wire signed [inADC-1:0] in11_reg;
    wire signed [inADC-1:0] in12_reg;
    wire signed [inADC-1:0] in13_reg;
    wire signed [inADC-1:0] in14_reg;
    wire signed [inADC-1:0] in15_reg;
    wire signed [inADC-1:0] in16_reg;
    wire signed [inADC-1:0] in17_reg;
    wire signed [inADC-1:0] in18_reg;
    wire signed [inADC-1:0] in19_reg;
    wire signed [inADC-1:0] in20_reg;
    wire signed [inADC-1:0] in21_reg;
    wire signed [inADC-1:0] in22_reg;
    wire signed [inADC-1:0] in23_reg;
    wire signed [inADC-1:0] in24_reg;
    wire signed [inADC-1:0] in25_reg;
    wire signed [inADC-1:0] in26_reg;
    wire signed [inADC-1:0] in27_reg;
    wire signed [inADC-1:0] in28_reg;
    wire signed [inADC-1:0] in29_reg;
    wire signed [inADC-1:0] in30_reg;
    wire signed [inADC-1:0] in31_reg;

    Register #(.DATA_WIDTH(inADC)) register_inputs (
        .clk(clk),
        .rst_n(rst_n),
        .en(1'b1),
        .in1(ADC_in0_real),
        .in2(ADC_in1_real),
        .in3(ADC_in2_real),
        .in4(ADC_in3_real),
        .in5(ADC_in4_real),
        .in6(ADC_in5_real),
        .in7(ADC_in6_real),
        .in8(ADC_in7_real),
        .in9(ADC_in8_real),
        .in10(ADC_in9_real),
        .in11(ADC_in10_real),
        .in12(ADC_in11_real),
        .in13(ADC_in12_real),
        .in14(ADC_in13_real),
        .in15(ADC_in14_real),
        .in16(ADC_in15_real),
        .in17(ADC_in16_real),
        .in18(ADC_in17_real),
        .in19(ADC_in18_real),
        .in20(ADC_in19_real),
        .in21(ADC_in20_real),
        .in22(ADC_in21_real),
        .in23(ADC_in22_real),
        .in24(ADC_in23_real),
        .in25(ADC_in24_real),
        .in26(ADC_in25_real),
        .in27(ADC_in26_real),
        .in28(ADC_in27_real),
        .in29(ADC_in28_real),
        .in30(ADC_in29_real),
        .in31(ADC_in30_real),
        .in32(ADC_in31_real),

        .out1(in0_reg),
        .out2(in1_reg),
        .out3(in2_reg),
        .out4(in3_reg),
        .out5(in4_reg),
        .out6(in5_reg),
        .out7(in6_reg),
        .out8(in7_reg),
        .out9(in8_reg),
        .out10(in9_reg),
        .out11(in10_reg),
        .out12(in11_reg),
        .out13(in12_reg),
        .out14(in13_reg),
        .out15(in14_reg),
        .out16(in15_reg),
        .out17(in16_reg),
        .out18(in17_reg),
        .out19(in18_reg),
        .out20(in19_reg),
        .out21(in20_reg),
        .out22(in21_reg),
        .out23(in22_reg),
        .out24(in23_reg),
        .out25(in24_reg),
        .out26(in25_reg),
        .out27(in26_reg),
        .out28(in27_reg),
        .out29(in28_reg),
        .out30(in29_reg),
        .out31(in30_reg),
        .out32(in31_reg)
    );
    wire [inWordWidth_2-1:0] W0_r,  W1_r,  W2_r,  W3_r;
    wire [inWordWidth_2-1:0] W4_r,  W5_r,  W6_r,  W7_r;
    wire [inWordWidth_2-1:0] W8_r,  W9_r,  W10_r, W11_r;
    wire [inWordWidth_2-1:0] W12_r, W13_r, W14_r, W15_r;

    wire [inWordWidth_2-1:0] W0_i,  W1_i,  W2_i,  W3_i;
    wire [inWordWidth_2-1:0] W4_i,  W5_i,  W6_i,  W7_i;
    wire [inWordWidth_2-1:0] W8_i,  W9_i,  W10_i, W11_i;
    wire [inWordWidth_2-1:0] W12_i, W13_i, W14_i, W15_i;

    ROM_W_Real #(.DATA_WIDTH(inWordWidth_2)) rom_w_real_inst (
    .reg0(W0_r),
    .reg1(W1_r),
    .reg2(W2_r),
    .reg3(W3_r),
    .reg4(W4_r),
    .reg5(W5_r),
    .reg6(W6_r),
    .reg7(W7_r),
    .reg8(W8_r),
    .reg9(W9_r),
    .reg10(W10_r),
    .reg11(W11_r),
    .reg12(W12_r),
    .reg13(W13_r),
    .reg14(W14_r),
    .reg15(W15_r)
);

    ROM_W_Imag #(.DATA_WIDTH(inWordWidth_2)) rom_w_imag_inst (
    .reg0(W0_i),
    .reg1(W1_i),
    .reg2(W2_i),
    .reg3(W3_i),
    .reg4(W4_i),
    .reg5(W5_i),
    .reg6(W6_i),
    .reg7(W7_i),
    .reg8(W8_i),
    .reg9(W9_i),
    .reg10(W10_i),
    .reg11(W11_i),
    .reg12(W12_i),
    .reg13(W13_i),
    .reg14(W14_i),
    .reg15(W15_i)
);

wire [2:0] control_select;
control_unit #(.mux_width(3)) CU
(
    .clk(clk),
    .rst_n(rst_n),
    .mux_sel(control_select)
);

wire [inWordWidth_2-1:0] W_R1;
wire [inWordWidth_2-1:0] W_I1;

wire [inWordWidth_2-1:0] W_R2;
wire [inWordWidth_2-1:0] W_I2;

wire [inWordWidth_2-1:0] W_R3;
wire [inWordWidth_2-1:0] W_I3;

wire [inWordWidth_2-1:0] W_R4;
wire [inWordWidth_2-1:0] W_I4;

wire [inWordWidth_2-1:0] W_R5;
wire [inWordWidth_2-1:0] W_I5;

wire [inWordWidth_2-1:0] W_R6;
wire [inWordWidth_2-1:0] W_I6;

wire [inWordWidth_2-1:0] W_R7;
wire [inWordWidth_2-1:0] W_I7;

wire [inWordWidth_2-1:0] W_R8;
wire [inWordWidth_2-1:0] W_I8;

wire [inWordWidth_2-1:0] W_R9;
wire [inWordWidth_2-1:0] W_I9;

wire [inWordWidth_2-1:0] W_R10;
wire [inWordWidth_2-1:0] W_I10;

wire [inWordWidth_2-1:0] W_R11;
wire [inWordWidth_2-1:0] W_I11;

wire [inWordWidth_2-1:0] W_R12;
wire [inWordWidth_2-1:0] W_I12;

wire [inWordWidth_2-1:0] W_R13;
wire [inWordWidth_2-1:0] W_I13;

wire [inWordWidth_2-1:0] W_R14;
wire [inWordWidth_2-1:0] W_I14;

wire [inWordWidth_2-1:0] W_R15;
wire [inWordWidth_2-1:0] W_I15;

wire [inWordWidth_2-1:0] W_R16;
wire [inWordWidth_2-1:0] W_I16;


W_SELECT_STAGE #(.DATA_WIDTH(inWordWidth_2)) W_SELECT (
    .control_select(control_select),

    .W0_r(W0_r),    .W0_i(W0_i),
    .W1_r(W1_r),    .W1_i(W1_i),
    .W2_r(W2_r),    .W2_i(W2_i),
    .W3_r(W3_r),    .W3_i(W3_i),
    .W4_r(W4_r),    .W4_i(W4_i),
    .W5_r(W5_r),    .W5_i(W5_i),
    .W6_r(W6_r),    .W6_i(W6_i),
    .W7_r(W7_r),    .W7_i(W7_i),
    .W8_r(W8_r),    .W8_i(W8_i),
    .W9_r(W9_r),    .W9_i(W9_i),
    .W10_r(W10_r),  .W10_i(W10_i),
    .W11_r(W11_r),  .W11_i(W11_i),
    .W12_r(W12_r),  .W12_i(W12_i),
    .W13_r(W13_r),  .W13_i(W13_i),
    .W14_r(W14_r),  .W14_i(W14_i),
    .W15_r(W15_r),  .W15_i(W15_i),

    // out
    .W_R1(W_R1),    .W_I1(W_I1),
    .W_R2(W_R2),    .W_I2(W_I2),
    .W_R3(W_R3),    .W_I3(W_I3),
    .W_R4(W_R4),    .W_I4(W_I4),
    .W_R5(W_R5),    .W_I5(W_I5),
    .W_R6(W_R6),    .W_I6(W_I6),
    .W_R7(W_R7),    .W_I7(W_I7),
    .W_R8(W_R8),    .W_I8(W_I8),
    .W_R9(W_R9),    .W_I9(W_I9),
    .W_R10(W_R10),  .W_I10(W_I10),
    .W_R11(W_R11),  .W_I11(W_I11),
    .W_R12(W_R12),  .W_I12(W_I12),
    .W_R13(W_R13),  .W_I13(W_I13),
    .W_R14(W_R14),  .W_I14(W_I14),
    .W_R15(W_R15),  .W_I15(W_I15),
    .W_R16(W_R16),  .W_I16(W_I16)
);
/*wires*/
wire signed  [inWordWidth_1-1:0]     out0_real;
wire signed  [inWordWidth_1-1:0]     out0_imag;
wire signed  [inWordWidth_1-1:0]     out1_real;
wire signed  [inWordWidth_1-1:0]     out1_imag;
wire signed  [inWordWidth_1-1:0]     out2_real;
wire signed  [inWordWidth_1-1:0]     out2_imag;
wire signed  [inWordWidth_1-1:0]     out3_real;
wire signed  [inWordWidth_1-1:0]     out3_imag;
wire signed  [inWordWidth_1-1:0]     out4_real;
wire signed  [inWordWidth_1-1:0]     out4_imag;
wire signed  [inWordWidth_1-1:0]     out5_real;
wire signed  [inWordWidth_1-1:0]     out5_imag;
wire signed  [inWordWidth_1-1:0]     out6_real;
wire signed  [inWordWidth_1-1:0]     out6_imag;
wire signed  [inWordWidth_1-1:0]     out7_real;
wire signed  [inWordWidth_1-1:0]     out7_imag;
wire signed  [inWordWidth_1-1:0]     out8_real;
wire signed  [inWordWidth_1-1:0]     out8_imag;
wire signed  [inWordWidth_1-1:0]     out9_real;
wire signed  [inWordWidth_1-1:0]     out9_imag;
wire signed  [inWordWidth_1-1:0]     out10_real;
wire signed  [inWordWidth_1-1:0]     out10_imag;
wire signed  [inWordWidth_1-1:0]     out11_real;
wire signed  [inWordWidth_1-1:0]     out11_imag;
wire signed  [inWordWidth_1-1:0]     out12_real;
wire signed  [inWordWidth_1-1:0]     out12_imag;
wire signed  [inWordWidth_1-1:0]     out13_real;
wire signed  [inWordWidth_1-1:0]     out13_imag;
wire signed  [inWordWidth_1-1:0]     out14_real;
wire signed  [inWordWidth_1-1:0]     out14_imag;
wire signed  [inWordWidth_1-1:0]     out15_real;
wire signed  [inWordWidth_1-1:0]     out15_imag;
wire signed  [inWordWidth_1-1:0]     out16_real;
wire signed  [inWordWidth_1-1:0]     out16_imag;
wire signed  [inWordWidth_1-1:0]     out17_real;
wire signed  [inWordWidth_1-1:0]     out17_imag;
wire signed  [inWordWidth_1-1:0]     out18_real;
wire signed  [inWordWidth_1-1:0]     out18_imag;
wire signed  [inWordWidth_1-1:0]     out19_real;
wire signed  [inWordWidth_1-1:0]     out19_imag;
wire signed  [inWordWidth_1-1:0]     out20_real;
wire signed  [inWordWidth_1-1:0]     out20_imag;
wire signed  [inWordWidth_1-1:0]     out21_real;
wire signed  [inWordWidth_1-1:0]     out21_imag;
wire signed  [inWordWidth_1-1:0]     out22_real;
wire signed  [inWordWidth_1-1:0]     out22_imag;
wire signed  [inWordWidth_1-1:0]     out23_real;
wire signed  [inWordWidth_1-1:0]     out23_imag;
wire signed  [inWordWidth_1-1:0]     out24_real;
wire signed  [inWordWidth_1-1:0]     out24_imag;
wire signed  [inWordWidth_1-1:0]     out25_real;
wire signed  [inWordWidth_1-1:0]     out25_imag;
wire signed  [inWordWidth_1-1:0]     out26_real;
wire signed  [inWordWidth_1-1:0]     out26_imag;
wire signed  [inWordWidth_1-1:0]     out27_real;
wire signed  [inWordWidth_1-1:0]     out27_imag;
wire signed  [inWordWidth_1-1:0]     out28_real;
wire signed  [inWordWidth_1-1:0]     out28_imag;
wire signed  [inWordWidth_1-1:0]     out29_real;
wire signed  [inWordWidth_1-1:0]     out29_imag;
wire signed  [inWordWidth_1-1:0]     out30_real;
wire signed  [inWordWidth_1-1:0]     out30_imag;
wire signed  [inWordWidth_1-1:0]     out31_real;
wire signed  [inWordWidth_1-1:0]     out31_imag;

wire signed  [inWordWidth_1-1:0]      a_real1;
wire signed  [inWordWidth_1-1:0]      a_imag1;
wire signed  [inWordWidth_1-1:0]      b_real1;
wire signed  [inWordWidth_1-1:0]      b_imag1;

wire signed  [inWordWidth_1-1:0]      a_real2;
wire signed  [inWordWidth_1-1:0]      a_imag2;
wire signed  [inWordWidth_1-1:0]      b_real2;
wire signed  [inWordWidth_1-1:0]      b_imag2;

wire signed  [inWordWidth_1-1:0]      a_real3;
wire signed  [inWordWidth_1-1:0]      a_imag3;
wire signed  [inWordWidth_1-1:0]      b_real3;
wire signed  [inWordWidth_1-1:0]      b_imag3;

wire signed  [inWordWidth_1-1:0]      a_real4;
wire signed  [inWordWidth_1-1:0]      a_imag4;
wire signed  [inWordWidth_1-1:0]      b_real4;
wire signed  [inWordWidth_1-1:0]      b_imag4;

wire signed  [inWordWidth_1-1:0]      a_real5;
wire signed  [inWordWidth_1-1:0]      a_imag5;
wire signed  [inWordWidth_1-1:0]      b_real5;
wire signed  [inWordWidth_1-1:0]      b_imag5;

wire signed  [inWordWidth_1-1:0]      a_real6;
wire signed  [inWordWidth_1-1:0]      a_imag6;
wire signed  [inWordWidth_1-1:0]      b_real6;
wire signed  [inWordWidth_1-1:0]      b_imag6;

wire signed  [inWordWidth_1-1:0]      a_real7;
wire signed  [inWordWidth_1-1:0]      a_imag7;
wire signed  [inWordWidth_1-1:0]      b_real7;
wire signed  [inWordWidth_1-1:0]      b_imag7;

wire signed  [inWordWidth_1-1:0]      a_real8;
wire signed  [inWordWidth_1-1:0]      a_imag8;
wire signed  [inWordWidth_1-1:0]      b_real8;
wire signed  [inWordWidth_1-1:0]      b_imag8;

wire signed  [inWordWidth_1-1:0]      a_real9;
wire signed  [inWordWidth_1-1:0]      a_imag9;
wire signed  [inWordWidth_1-1:0]      b_real9;
wire signed  [inWordWidth_1-1:0]      b_imag9;

wire signed  [inWordWidth_1-1:0]      a_real10;
wire signed  [inWordWidth_1-1:0]      a_imag10;
wire signed  [inWordWidth_1-1:0]      b_real10;
wire signed  [inWordWidth_1-1:0]      b_imag10;

wire signed  [inWordWidth_1-1:0]      a_real11;
wire signed  [inWordWidth_1-1:0]      a_imag11;
wire signed  [inWordWidth_1-1:0]      b_real11;
wire signed  [inWordWidth_1-1:0]      b_imag11;

wire signed  [inWordWidth_1-1:0]      a_real12;
wire signed  [inWordWidth_1-1:0]      a_imag12;
wire signed  [inWordWidth_1-1:0]      b_real12;
wire signed  [inWordWidth_1-1:0]      b_imag12;

wire signed  [inWordWidth_1-1:0]      a_real13;
wire signed  [inWordWidth_1-1:0]      a_imag13;
wire signed  [inWordWidth_1-1:0]      b_real13;
wire signed  [inWordWidth_1-1:0]      b_imag13;

wire signed  [inWordWidth_1-1:0]      a_real14;
wire signed  [inWordWidth_1-1:0]      a_imag14;
wire signed  [inWordWidth_1-1:0]      b_real14;
wire signed  [inWordWidth_1-1:0]      b_imag14;

wire signed  [inWordWidth_1-1:0]      a_real15;
wire signed  [inWordWidth_1-1:0]      a_imag15;
wire signed  [inWordWidth_1-1:0]      b_real15;
wire signed  [inWordWidth_1-1:0]      b_imag15;

wire signed  [inWordWidth_1-1:0]      a_real16;
wire signed  [inWordWidth_1-1:0]      a_imag16;
wire signed  [inWordWidth_1-1:0]      b_real16;
wire signed  [inWordWidth_1-1:0]      b_imag16;

////////////////////////////////////////////////////////

wire signed [inWordWidth_1-1:0] output_0_real_reg;
wire signed [inWordWidth_1-1:0] output_1_real_reg;
wire signed [inWordWidth_1-1:0] output_2_real_reg;
wire signed [inWordWidth_1-1:0] output_3_real_reg;
wire signed [inWordWidth_1-1:0] output_4_real_reg;
wire signed [inWordWidth_1-1:0] output_5_real_reg;
wire signed [inWordWidth_1-1:0] output_6_real_reg;
wire signed [inWordWidth_1-1:0] output_7_real_reg;
wire signed [inWordWidth_1-1:0] output_8_real_reg;
wire signed [inWordWidth_1-1:0] output_9_real_reg;
wire signed [inWordWidth_1-1:0] output_10_real_reg;
wire signed [inWordWidth_1-1:0] output_11_real_reg;
wire signed [inWordWidth_1-1:0] output_12_real_reg;
wire signed [inWordWidth_1-1:0] output_13_real_reg;
wire signed [inWordWidth_1-1:0] output_14_real_reg;
wire signed [inWordWidth_1-1:0] output_15_real_reg;
wire signed [inWordWidth_1-1:0] output_16_real_reg;
wire signed [inWordWidth_1-1:0] output_17_real_reg;
wire signed [inWordWidth_1-1:0] output_18_real_reg;
wire signed [inWordWidth_1-1:0] output_19_real_reg;
wire signed [inWordWidth_1-1:0] output_20_real_reg;
wire signed [inWordWidth_1-1:0] output_21_real_reg;
wire signed [inWordWidth_1-1:0] output_22_real_reg;
wire signed [inWordWidth_1-1:0] output_23_real_reg;
wire signed [inWordWidth_1-1:0] output_24_real_reg;
wire signed [inWordWidth_1-1:0] output_25_real_reg;
wire signed [inWordWidth_1-1:0] output_26_real_reg;
wire signed [inWordWidth_1-1:0] output_27_real_reg;
wire signed [inWordWidth_1-1:0] output_28_real_reg;
wire signed [inWordWidth_1-1:0] output_29_real_reg;
wire signed [inWordWidth_1-1:0] output_30_real_reg;
wire signed [inWordWidth_1-1:0] output_31_real_reg;


wire signed [inWordWidth_1-1:0] output_0_imag_reg;
wire signed [inWordWidth_1-1:0] output_1_imag_reg;
wire signed [inWordWidth_1-1:0] output_2_imag_reg;
wire signed [inWordWidth_1-1:0] output_3_imag_reg;
wire signed [inWordWidth_1-1:0] output_4_imag_reg;
wire signed [inWordWidth_1-1:0] output_5_imag_reg;
wire signed [inWordWidth_1-1:0] output_6_imag_reg;
wire signed [inWordWidth_1-1:0] output_7_imag_reg;
wire signed [inWordWidth_1-1:0] output_8_imag_reg;
wire signed [inWordWidth_1-1:0] output_9_imag_reg;
wire signed [inWordWidth_1-1:0] output_10_imag_reg;
wire signed [inWordWidth_1-1:0] output_11_imag_reg;
wire signed [inWordWidth_1-1:0] output_12_imag_reg;
wire signed [inWordWidth_1-1:0] output_13_imag_reg;
wire signed [inWordWidth_1-1:0] output_14_imag_reg;
wire signed [inWordWidth_1-1:0] output_15_imag_reg;
wire signed [inWordWidth_1-1:0] output_16_imag_reg;
wire signed [inWordWidth_1-1:0] output_17_imag_reg;
wire signed [inWordWidth_1-1:0] output_18_imag_reg;
wire signed [inWordWidth_1-1:0] output_19_imag_reg;
wire signed [inWordWidth_1-1:0] output_20_imag_reg;
wire signed [inWordWidth_1-1:0] output_21_imag_reg;
wire signed [inWordWidth_1-1:0] output_22_imag_reg;
wire signed [inWordWidth_1-1:0] output_23_imag_reg;
wire signed [inWordWidth_1-1:0] output_24_imag_reg;
wire signed [inWordWidth_1-1:0] output_25_imag_reg;
wire signed [inWordWidth_1-1:0] output_26_imag_reg;
wire signed [inWordWidth_1-1:0] output_27_imag_reg;
wire signed [inWordWidth_1-1:0] output_28_imag_reg;
wire signed [inWordWidth_1-1:0] output_29_imag_reg;
wire signed [inWordWidth_1-1:0] output_30_imag_reg;
wire signed [inWordWidth_1-1:0] output_31_imag_reg;

Register #(.DATA_WIDTH(inWordWidth_1)) register_mux_real_in (
    .clk(clk),
    .rst_n(rst_n),
    .en(1'b1),
    .in1(out0_real),
    .in2(out1_real),
    .in3(out2_real),
    .in4(out3_real),
    .in5(out4_real),
    .in6(out5_real),
    .in7(out6_real),
    .in8(out7_real),
    .in9(out8_real),
    .in10(out9_real),
    .in11(out10_real),
    .in12(out11_real),
    .in13(out12_real),
    .in14(out13_real),
    .in15(out14_real),
    .in16(out15_real),
    .in17(out16_real),
    .in18(out17_real),
    .in19(out18_real),
    .in20(out19_real),
    .in21(out20_real),
    .in22(out21_real),
    .in23(out22_real),
    .in24(out23_real),
    .in25(out24_real),
    .in26(out25_real),
    .in27(out26_real),
    .in28(out27_real),
    .in29(out28_real),
    .in30(out29_real),
    .in31(out30_real),
    .in32(out31_real),

    .out1(output_0_real_reg),
    .out2(output_1_real_reg),
    .out3(output_2_real_reg),
    .out4(output_3_real_reg),
    .out5(output_4_real_reg),
    .out6(output_5_real_reg),
    .out7(output_6_real_reg),
    .out8(output_7_real_reg),
    .out9(output_8_real_reg),
    .out10(output_9_real_reg),
    .out11(output_10_real_reg),
    .out12(output_11_real_reg),
    .out13(output_12_real_reg),
    .out14(output_13_real_reg),
    .out15(output_14_real_reg),
    .out16(output_15_real_reg),
    .out17(output_16_real_reg),
    .out18(output_17_real_reg),
    .out19(output_18_real_reg),
    .out20(output_19_real_reg),
    .out21(output_20_real_reg),
    .out22(output_21_real_reg),
    .out23(output_22_real_reg),
    .out24(output_23_real_reg),
    .out25(output_24_real_reg),
    .out26(output_25_real_reg),
    .out27(output_26_real_reg),
    .out28(output_27_real_reg),
    .out29(output_28_real_reg),
    .out30(output_29_real_reg),
    .out31(output_30_real_reg),
    .out32(output_31_real_reg)
);



Register #(.DATA_WIDTH(inWordWidth_1)) register_mux_imag_in (
    .clk(clk),
    .en(1'b1),
    .rst_n(rst_n),
    .in1(out0_imag),
    .in2(out1_imag),
    .in3(out2_imag),
    .in4(out3_imag),
    .in5(out4_imag),
    .in6(out5_imag),
    .in7(out6_imag),
    .in8(out7_imag),
    .in9(out8_imag),
    .in10(out9_imag),
    .in11(out10_imag),
    .in12(out11_imag),
    .in13(out12_imag),
    .in14(out13_imag),
    .in15(out14_imag),
    .in16(out15_imag),
    .in17(out16_imag),
    .in18(out17_imag),
    .in19(out18_imag),
    .in20(out19_imag),
    .in21(out20_imag),
    .in22(out21_imag),
    .in23(out22_imag),
    .in24(out23_imag),
    .in25(out24_imag),
    .in26(out25_imag),
    .in27(out26_imag),
    .in28(out27_imag),
    .in29(out28_imag),
    .in30(out29_imag),
    .in31(out30_imag),
    .in32(out31_imag),

    .out1(output_0_imag_reg),
    .out2(output_1_imag_reg),
    .out3(output_2_imag_reg),
    .out4(output_3_imag_reg),
    .out5(output_4_imag_reg),
    .out6(output_5_imag_reg),
    .out7(output_6_imag_reg),
    .out8(output_7_imag_reg),
    .out9(output_8_imag_reg),
    .out10(output_9_imag_reg),
    .out11(output_10_imag_reg),
    .out12(output_11_imag_reg),
    .out13(output_12_imag_reg),
    .out14(output_13_imag_reg),
    .out15(output_14_imag_reg),
    .out16(output_15_imag_reg),
    .out17(output_16_imag_reg),
    .out18(output_17_imag_reg),
    .out19(output_18_imag_reg),
    .out20(output_19_imag_reg),
    .out21(output_20_imag_reg),
    .out22(output_21_imag_reg),
    .out23(output_22_imag_reg),
    .out24(output_23_imag_reg),
    .out25(output_24_imag_reg),
    .out26(output_25_imag_reg),
    .out27(output_26_imag_reg),
    .out28(output_27_imag_reg),
    .out29(output_28_imag_reg),
    .out30(output_29_imag_reg),
    .out31(output_30_imag_reg),
    .out32(output_31_imag_reg)
);


SELECT_STAGE #(.DATA_WIDTH(inWordWidth_1))stage_selector (

.control_select(control_select),

.in0({{5{in0_reg[inADC-1]}},in0_reg}),   
.in1({{5{in1_reg[inADC-1]}},in1_reg}),
.in2({{5{in2_reg[inADC-1]}},in2_reg}),     
.in3({{5{in3_reg[inADC-1]}},in3_reg}),
.in4({{5{in4_reg[inADC-1]}},in4_reg}),    
.in5({{5{in5_reg[inADC-1]}},in5_reg}),
.in6({{5{in6_reg[inADC-1]}},in6_reg}),    
.in7({{5{in7_reg[inADC-1]}},in7_reg}),
.in8({{5{in8_reg[inADC-1]}},in8_reg}),     
.in9({{5{in9_reg[inADC-1]}},in9_reg}),
.in10({{5{in10_reg[inADC-1]}},in10_reg}),  
.in11({{5{in11_reg[inADC-1]}},in11_reg}),
.in12({{5{in12_reg[inADC-1]}},in12_reg}), 
.in13({{5{in13_reg[inADC-1]}},in13_reg}),
.in14({{5{in14_reg[inADC-1]}},in14_reg}),
.in15({{5{in15_reg[inADC-1]}},in15_reg}),
.in16({{5{in16_reg[inADC-1]}},in16_reg}),
.in17({{5{in17_reg[inADC-1]}},in17_reg}),
.in18({{5{in18_reg[inADC-1]}},in18_reg}),
.in19({{5{in19_reg[inADC-1]}},in19_reg}),
.in20({{5{in20_reg[inADC-1]}},in20_reg}),
.in21({{5{in21_reg[inADC-1]}},in21_reg}),
.in22({{5{in22_reg[inADC-1]}},in22_reg}),
.in23({{5{in23_reg[inADC-1]}},in23_reg}),
.in24({{5{in24_reg[inADC-1]}},in24_reg}),
.in25({{5{in25_reg[inADC-1]}},in25_reg}),
.in26({{5{in26_reg[inADC-1]}},in26_reg}),
.in27({{5{in27_reg[inADC-1]}},in27_reg}),
.in28({{5{in28_reg[inADC-1]}},in28_reg}),
.in29({{5{in29_reg[inADC-1]}},in29_reg}),
.in30({{5{in30_reg[inADC-1]}},in30_reg}),
.in31({{5{in31_reg[inADC-1]}},in31_reg}),


.out0_real(output_0_real_reg),     .out0_imag(output_0_imag_reg),
.out1_real(output_1_real_reg),     .out1_imag(output_1_imag_reg),
.out2_real(output_2_real_reg),     .out2_imag(output_2_imag_reg),
.out3_real(output_3_real_reg),     .out3_imag(output_3_imag_reg),
.out4_real(output_4_real_reg),     .out4_imag(output_4_imag_reg),
.out5_real(output_5_real_reg),     .out5_imag(output_5_imag_reg),
.out6_real(output_6_real_reg),     .out6_imag(output_6_imag_reg),
.out7_real(output_7_real_reg),     .out7_imag(output_7_imag_reg),
.out8_real(output_8_real_reg),     .out8_imag(output_8_imag_reg),
.out9_real(output_9_real_reg),     .out9_imag(output_9_imag_reg),
.out10_real(output_10_real_reg),   .out10_imag(output_10_imag_reg),
.out11_real(output_11_real_reg),   .out11_imag(output_11_imag_reg),
.out12_real(output_12_real_reg),   .out12_imag(output_12_imag_reg),
.out13_real(output_13_real_reg),   .out13_imag(output_13_imag_reg),
.out14_real(output_14_real_reg),   .out14_imag(output_14_imag_reg),
.out15_real(output_15_real_reg),   .out15_imag(output_15_imag_reg),
.out16_real(output_16_real_reg),   .out16_imag(output_16_imag_reg),
.out17_real(output_17_real_reg),   .out17_imag(output_17_imag_reg),
.out18_real(output_18_real_reg),   .out18_imag(output_18_imag_reg),
.out19_real(output_19_real_reg),   .out19_imag(output_19_imag_reg),
.out20_real(output_20_real_reg),   .out20_imag(output_20_imag_reg),
.out21_real(output_21_real_reg),   .out21_imag(output_21_imag_reg),
.out22_real(output_22_real_reg),   .out22_imag(output_22_imag_reg),
.out23_real(output_23_real_reg),   .out23_imag(output_23_imag_reg),
.out24_real(output_24_real_reg),   .out24_imag(output_24_imag_reg),
.out25_real(output_25_real_reg),   .out25_imag(output_25_imag_reg),
.out26_real(output_26_real_reg),   .out26_imag(output_26_imag_reg),
.out27_real(output_27_real_reg),   .out27_imag(output_27_imag_reg),
.out28_real(output_28_real_reg),   .out28_imag(output_28_imag_reg),
.out29_real(output_29_real_reg),   .out29_imag(output_29_imag_reg),
.out30_real(output_30_real_reg),   .out30_imag(output_30_imag_reg),
.out31_real(output_31_real_reg),   .out31_imag(output_31_imag_reg),


.a_real1(a_real1),         .a_imag1(a_imag1),
.b_real1(b_real1),         .b_imag1(b_imag1),

.a_real2(a_real2),         .a_imag2(a_imag2),
.b_real2(b_real2),         .b_imag2(b_imag2),

.a_real3(a_real3),         .a_imag3(a_imag3),
.b_real3(b_real3),         .b_imag3(b_imag3),

.a_real4(a_real4),         .a_imag4(a_imag4),
.b_real4(b_real4),         .b_imag4(b_imag4),

.a_real5(a_real5),         .a_imag5(a_imag5),
.b_real5(b_real5),         .b_imag5(b_imag5),

.a_real6(a_real6),         .a_imag6(a_imag6),
.b_real6(b_real6),         .b_imag6(b_imag6),

.a_real7(a_real7),         .a_imag7(a_imag7),
.b_real7(b_real7),         .b_imag7(b_imag7),

.a_real8(a_real8),         .a_imag8(a_imag8),
.b_real8(b_real8),         .b_imag8(b_imag8),

.a_real9(a_real9),         .a_imag9(a_imag9),
.b_real9(b_real9),         .b_imag9(b_imag9),

.a_real10(a_real10),       .a_imag10(a_imag10),
.b_real10(b_real10),       .b_imag10(b_imag10),

.a_real11(a_real11),       .a_imag11(a_imag11),
.b_real11(b_real11),       .b_imag11(b_imag11),

.a_real12(a_real12),       .a_imag12(a_imag12),
.b_real12(b_real12),       .b_imag12(b_imag12),

.a_real13(a_real13),       .a_imag13(a_imag13),
.b_real13(b_real13),       .b_imag13(b_imag13),

.a_real14(a_real14),       .a_imag14(a_imag14),
.b_real14(b_real14),       .b_imag14(b_imag14),

.a_real15(a_real15),       .a_imag15(a_imag15),
.b_real15(b_real15),       .b_imag15(b_imag15),

.a_real16(a_real16),       .a_imag16(a_imag16),
.b_real16(b_real16),       .b_imag16(b_imag16)


);

Butterfly #(    .inWordWidth_1(inWordWidth_1),
                .inWordWidth_2(inWordWidth_2),
                .I1(I1),
                .F1(F1),
                .I2(I2),
                .F2(F2)
) butterfly_stage (
    .clk(clk),
    .rst_n(rst_n),
    // Inputs for 16 butterfly units
    .a_real1(a_real1),   .a_imag1(a_imag1),
    .b_real1(b_real1),   .b_imag1(b_imag1),
    .a_real2(a_real2),   .a_imag2(a_imag2),
    .b_real2(b_real2),   .b_imag2(b_imag2),
    .a_real3(a_real3),   .a_imag3(a_imag3),
    .b_real3(b_real3),   .b_imag3(b_imag3),
    .a_real4(a_real4),   .a_imag4(a_imag4),
    .b_real4(b_real4),   .b_imag4(b_imag4),
    .a_real5(a_real5),   .a_imag5(a_imag5),
    .b_real5(b_real5),   .b_imag5(b_imag5),
    .a_real6(a_real6),   .a_imag6(a_imag6),
    .b_real6(b_real6),   .b_imag6(b_imag6),
    .a_real7(a_real7),   .a_imag7(a_imag7),
    .b_real7(b_real7),   .b_imag7(b_imag7),
    .a_real8(a_real8),   .a_imag8(a_imag8),
    .b_real8(b_real8),   .b_imag8(b_imag8),
    .a_real9(a_real9),   .a_imag9(a_imag9),
    .b_real9(b_real9),   .b_imag9(b_imag9),
    .a_real10(a_real10), .a_imag10(a_imag10),
    .b_real10(b_real10), .b_imag10(b_imag10),
    .a_real11(a_real11), .a_imag11(a_imag11),
    .b_real11(b_real11), .b_imag11(b_imag11),
    .a_real12(a_real12), .a_imag12(a_imag12),
    .b_real12(b_real12), .b_imag12(b_imag12),
    .a_real13(a_real13), .a_imag13(a_imag13),
    .b_real13(b_real13), .b_imag13(b_imag13),
    .a_real14(a_real14), .a_imag14(a_imag14),
    .b_real14(b_real14), .b_imag14(b_imag14),
    .a_real15(a_real15), .a_imag15(a_imag15),
    .b_real15(b_real15), .b_imag15(b_imag15),
    .a_real16(a_real16), .a_imag16(a_imag16),
    .b_real16(b_real16), .b_imag16(b_imag16),
    // Twiddle factors
    .W_R1(W_R1),         .W_I1(W_I1),
    .W_R2(W_R2),         .W_I2(W_I2),
    .W_R3(W_R3),         .W_I3(W_I3),
    .W_R4(W_R4),         .W_I4(W_I4),
    .W_R5(W_R5),         .W_I5(W_I5),
    .W_R6(W_R6),         .W_I6(W_I6),
    .W_R7(W_R7),         .W_I7(W_I7),
    .W_R8(W_R8),         .W_I8(W_I8),
    .W_R9(W_R9),         .W_I9(W_I9),
    .W_R10(W_R10),       .W_I10(W_I10),
    .W_R11(W_R11),       .W_I11(W_I11),
    .W_R12(W_R12),       .W_I12(W_I12),
    .W_R13(W_R13),       .W_I13(W_I13),
    .W_R14(W_R14),       .W_I14(W_I14),
    .W_R15(W_R15),       .W_I15(W_I15),
    .W_R16(W_R16),       .W_I16(W_I16),

    // Outputs
    .out0_real(out0_real),      .out0_imag(out0_imag),
    .out1_real(out1_real),      .out1_imag(out1_imag),
    .out2_real(out2_real),      .out2_imag(out2_imag),
    .out3_real(out3_real),      .out3_imag(out3_imag),
    .out4_real(out4_real),      .out4_imag(out4_imag),
    .out5_real(out5_real),      .out5_imag(out5_imag),
    .out6_real(out6_real),      .out6_imag(out6_imag),
    .out7_real(out7_real),      .out7_imag(out7_imag),
    .out8_real(out8_real),      .out8_imag(out8_imag),
    .out9_real(out9_real),      .out9_imag(out9_imag),
    .out10_real(out10_real),    .out10_imag(out10_imag),
    .out11_real(out11_real),    .out11_imag(out11_imag),
    .out12_real(out12_real),    .out12_imag(out12_imag),
    .out13_real(out13_real),    .out13_imag(out13_imag),
    .out14_real(out14_real),    .out14_imag(out14_imag),
    .out15_real(out15_real),    .out15_imag(out15_imag),
    .out16_real(out16_real),    .out16_imag(out16_imag),
    .out17_real(out17_real),    .out17_imag(out17_imag),
    .out18_real(out18_real),    .out18_imag(out18_imag),
    .out19_real(out19_real),    .out19_imag(out19_imag),
    .out20_real(out20_real),    .out20_imag(out20_imag),
    .out21_real(out21_real),    .out21_imag(out21_imag),
    .out22_real(out22_real),    .out22_imag(out22_imag),
    .out23_real(out23_real),    .out23_imag(out23_imag),
    .out24_real(out24_real),    .out24_imag(out24_imag),
    .out25_real(out25_real),    .out25_imag(out25_imag),
    .out26_real(out26_real),    .out26_imag(out26_imag),
    .out27_real(out27_real),    .out27_imag(out27_imag),
    .out28_real(out28_real),    .out28_imag(out28_imag),
    .out29_real(out29_real),    .out29_imag(out29_imag),
    .out30_real(out30_real),    .out30_imag(out30_imag),
    .out31_real(out31_real),    .out31_imag(out31_imag)
);

Register #(.DATA_WIDTH(inWordWidth_1)) register_outputs_real (
    .clk(clk),
    .en(reg_slow_enable),
    .rst_n(rst_n),
    .in1(out0_real),
    .in2(out2_real),
    .in3(out4_real),
    .in4(out6_real),
    .in5(out8_real),
    .in6(out10_real),
    .in7(out12_real),
    .in8(out14_real),
    .in9(out16_real),
    .in10(out18_real),
    .in11(out20_real),
    .in12(out22_real),
    .in13(out24_real),
    .in14(out26_real),
    .in15(out28_real),
    .in16(out30_real),
    .in17(out1_real),
    .in18(out3_real),
    .in19(out5_real),
    .in20(out7_real),
    .in21(out9_real),
    .in22(out11_real),
    .in23(out13_real),
    .in24(out15_real),
    .in25(out17_real),
    .in26(out19_real),
    .in27(out21_real),
    .in28(out23_real),
    .in29(out25_real),
    .in30(out27_real),
    .in31(out29_real),
    .in32(out31_real),

    .out1(output_0_real),
    .out2(output_1_real),
    .out3(output_2_real),
    .out4(output_3_real),
    .out5(output_4_real),
    .out6(output_5_real),
    .out7(output_6_real),
    .out8(output_7_real),
    .out9(output_8_real),
    .out10(output_9_real),
    .out11(output_10_real),
    .out12(output_11_real),
    .out13(output_12_real),
    .out14(output_13_real),
    .out15(output_14_real),
    .out16(output_15_real),
    .out17(output_16_real),
    .out18(output_17_real),
    .out19(output_18_real),
    .out20(output_19_real),
    .out21(output_20_real),
    .out22(output_21_real),
    .out23(output_22_real),
    .out24(output_23_real),
    .out25(output_24_real),
    .out26(output_25_real),
    .out27(output_26_real),
    .out28(output_27_real),
    .out29(output_28_real),
    .out30(output_29_real),
    .out31(output_30_real),
    .out32(output_31_real)
);
Register #(.DATA_WIDTH(inWordWidth_1)) register_outputs_imag (
    .clk(clk),
    .en(reg_slow_enable),
    .rst_n(rst_n),
    .in1(out0_imag),
    .in2(out2_imag),
    .in3(out4_imag),
    .in4(out6_imag),
    .in5(out8_imag),
    .in6(out10_imag),
    .in7(out12_imag),
    .in8(out14_imag),
    .in9(out16_imag),
    .in10(out18_imag),
    .in11(out20_imag),
    .in12(out22_imag),
    .in13(out24_imag),
    .in14(out26_imag),
    .in15(out28_imag),
    .in16(out30_imag),
    .in17(out1_imag),
    .in18(out3_imag),
    .in19(out5_imag),
    .in20(out7_imag),
    .in21(out9_imag),
    .in22(out11_imag),
    .in23(out13_imag),
    .in24(out15_imag),
    .in25(out17_imag),
    .in26(out19_imag),
    .in27(out21_imag),
    .in28(out23_imag),
    .in29(out25_imag),
    .in30(out27_imag),
    .in31(out29_imag),
    .in32(out31_imag),

    .out1(output_0_imag),
    .out2(output_1_imag),
    .out3(output_2_imag),
    .out4(output_3_imag),
    .out5(output_4_imag),
    .out6(output_5_imag),
    .out7(output_6_imag),
    .out8(output_7_imag),
    .out9(output_8_imag),
    .out10(output_9_imag),
    .out11(output_10_imag),
    .out12(output_11_imag),
    .out13(output_12_imag),
    .out14(output_13_imag),
    .out15(output_14_imag),
    .out16(output_15_imag),
    .out17(output_16_imag),
    .out18(output_17_imag),
    .out19(output_18_imag),
    .out20(output_19_imag),
    .out21(output_20_imag),
    .out22(output_21_imag),
    .out23(output_22_imag),
    .out24(output_23_imag),
    .out25(output_24_imag),
    .out26(output_25_imag),
    .out27(output_26_imag),
    .out28(output_27_imag),
    .out29(output_28_imag),
    .out30(output_29_imag),
    .out31(output_30_imag),
    .out32(output_31_imag)
);


assign reg_slow_enable = (control_select == 3'd4);
endmodule
