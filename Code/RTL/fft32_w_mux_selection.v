/*
this module contain 2*16 MUX 5*1 to selectorect W real and imag*/

module W_SELECT_STAGE
    #(parameter DATA_WIDTH=16)
    (
        input wire        [DATA_WIDTH-1:0]     W0_r,
        input wire        [DATA_WIDTH-1:0]     W0_i,
        input wire        [DATA_WIDTH-1:0]     W1_r,
        input wire        [DATA_WIDTH-1:0]     W1_i,
        input wire        [DATA_WIDTH-1:0]     W2_r,
        input wire        [DATA_WIDTH-1:0]     W2_i,
        input wire        [DATA_WIDTH-1:0]     W3_r,
        input wire        [DATA_WIDTH-1:0]     W3_i,
        input wire        [DATA_WIDTH-1:0]     W4_r,
        input wire        [DATA_WIDTH-1:0]     W4_i,
        input wire        [DATA_WIDTH-1:0]     W5_r,
        input wire        [DATA_WIDTH-1:0]     W5_i,
        input wire        [DATA_WIDTH-1:0]     W6_r,
        input wire        [DATA_WIDTH-1:0]     W6_i,
        input wire        [DATA_WIDTH-1:0]     W7_r,
        input wire        [DATA_WIDTH-1:0]     W7_i,
        input wire        [DATA_WIDTH-1:0]     W8_r,
        input wire        [DATA_WIDTH-1:0]     W8_i,
        input wire        [DATA_WIDTH-1:0]     W9_r,
        input wire        [DATA_WIDTH-1:0]     W9_i,
        input wire        [DATA_WIDTH-1:0]     W10_r,
        input wire        [DATA_WIDTH-1:0]     W10_i,
        input wire        [DATA_WIDTH-1:0]     W11_r,
        input wire        [DATA_WIDTH-1:0]     W11_i,
        input wire        [DATA_WIDTH-1:0]     W12_r,
        input wire        [DATA_WIDTH-1:0]     W12_i,
        input wire        [DATA_WIDTH-1:0]     W13_r,
        input wire        [DATA_WIDTH-1:0]     W13_i,
        input wire        [DATA_WIDTH-1:0]     W14_r,
        input wire        [DATA_WIDTH-1:0]     W14_i,
        input wire        [DATA_WIDTH-1:0]     W15_r,
        input wire        [DATA_WIDTH-1:0]     W15_i,
        input wire        [2:0]                control_select,
        output wire    [DATA_WIDTH-1:0] W_R1,
        output wire    [DATA_WIDTH-1:0] W_I1,

        output wire    [DATA_WIDTH-1:0] W_R2,
        output wire    [DATA_WIDTH-1:0] W_I2,

        output wire    [DATA_WIDTH-1:0] W_R3,
        output wire    [DATA_WIDTH-1:0] W_I3,

        output wire    [DATA_WIDTH-1:0] W_R4,
        output wire    [DATA_WIDTH-1:0] W_I4,

        output wire    [DATA_WIDTH-1:0] W_R5,
        output wire    [DATA_WIDTH-1:0] W_I5,

        output wire    [DATA_WIDTH-1:0] W_R6,
        output wire    [DATA_WIDTH-1:0] W_I6,

        output wire    [DATA_WIDTH-1:0] W_R7,
        output wire    [DATA_WIDTH-1:0] W_I7,

        output wire    [DATA_WIDTH-1:0] W_R8,
        output wire    [DATA_WIDTH-1:0] W_I8,

        output wire    [DATA_WIDTH-1:0] W_R9,
        output wire    [DATA_WIDTH-1:0] W_I9,

        output wire    [DATA_WIDTH-1:0] W_R10,
        output wire    [DATA_WIDTH-1:0] W_I10,

        output wire    [DATA_WIDTH-1:0] W_R11,
        output wire    [DATA_WIDTH-1:0] W_I11,

        output wire    [DATA_WIDTH-1:0] W_R12,
        output wire    [DATA_WIDTH-1:0] W_I12,

        output wire    [DATA_WIDTH-1:0] W_R13,
        output wire    [DATA_WIDTH-1:0] W_I13,

        output wire    [DATA_WIDTH-1:0] W_R14,
        output wire    [DATA_WIDTH-1:0] W_I14,

        output wire    [DATA_WIDTH-1:0] W_R15,
        output wire    [DATA_WIDTH-1:0] W_I15,

        output wire    [DATA_WIDTH-1:0] W_R16,
        output wire    [DATA_WIDTH-1:0] W_I16
    );
  MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL1
    (
       .a(W0_r),
       .b(W0_r),
       .c(W0_r),
       .d(W0_r),
       .e(W0_r),
       .selector(control_select),
       .y(W_R1)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG1
    (
       .a({DATA_WIDTH{1'b0}}),
       .b({DATA_WIDTH{1'b0}}),
       .c({DATA_WIDTH{1'b0}}),
       .d({DATA_WIDTH{1'b0}}),
       .e({DATA_WIDTH{1'b0}}),
       .selector(control_select),
       .y(W_I1)
    );

    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL2
    (
       .a(W0_r),
       .b(W8_r),
       .c(W4_r),
       .d(W2_r),
       .e(W1_r),
       .selector(control_select),
       .y(W_R2)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG2
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(W8_i),
       .c(W4_i),
       .d(W2_i),
       .e(W1_i),
       .selector(control_select),
       .y(W_I2)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL3
    (
       .a(W0_r),
       .b(W0_r),
       .c(W8_r),
       .d(W4_r),
       .e(W2_r),
       .selector(control_select),
       .y(W_R3)
    );
   MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG3
    (
       .a({DATA_WIDTH{1'b0}}),
       .b({DATA_WIDTH{1'b0}}),
       .c(W8_i),
       .d(W4_i),
       .e(W2_i),
       .selector(control_select),
       .y(W_I3)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL4
    (
       .a(W0_r),
       .b(W8_r),
       .c(W12_r),
       .d(W6_r),
       .e(W3_r),
       .selector(control_select),
       .y(W_R4)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG4
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(W8_i),
       .c(W12_i),
       .d(W6_i),
       .e(W3_i),
       .selector(control_select),
       .y(W_I4)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL5
    (
       .a(W0_r),
       .b(W0_r),
       .c(W0_r),
       .d(W8_r),
       .e(W4_r),
       .selector(control_select),
       .y(W_R5)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG5
    (
       .a({DATA_WIDTH{1'b0}}),
       .b({DATA_WIDTH{1'b0}}),
       .c({DATA_WIDTH{1'b0}}),
       .d(W8_i),
       .e(W4_i),
       .selector(control_select),
       .y(W_I5)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL6
    (
       .a(W0_r),
       .b(W8_r),
       .c(W4_r),
       .d(W10_r),
       .e(W5_r),
       .selector(control_select),
       .y(W_R6)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG6
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(W8_i),
       .c(W4_i),
       .d(W10_i),
       .e(W5_i),
       .selector(control_select),
       .y(W_I6)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL7
    (
       .a(W0_r),
       .b(W0_r),
       .c(W8_r),
       .d(W12_r),
       .e(W6_r),
       .selector(control_select),
       .y(W_R7)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG7
    (
       .a({DATA_WIDTH{1'b0}}),
       .b({DATA_WIDTH{1'b0}}),
       .c(W8_i),
       .d(W12_i),
       .e(W6_i),
       .selector(control_select),
       .y(W_I7)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL8
    (
       .a(W0_r),
       .b(W8_r),
       .c(W12_r),
       .d(W14_r),
       .e(W7_r),
       .selector(control_select),
       .y(W_R8)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG8
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(W8_i),
       .c(W12_i),
       .d(W14_i),
       .e(W7_i),
       .selector(control_select),
       .y(W_I8)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL9
    (
       .a(W0_r),
       .b(W0_r),
       .c(W0_r),
       .d(W0_r),
       .e(W8_r),
       .selector(control_select),
       .y(W_R9)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG9
    (
       .a({DATA_WIDTH{1'b0}}),
       .b({DATA_WIDTH{1'b0}}),
       .c({DATA_WIDTH{1'b0}}),
       .d({DATA_WIDTH{1'b0}}),
       .e(W8_i),
       .selector(control_select),
       .y(W_I9)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL10
    (
       .a(W0_r),
       .b(W8_r),
       .c(W4_r),
       .d(W2_r),
       .e(W9_r),
       .selector(control_select),
       .y(W_R10)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG10
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(W8_i),
       .c(W4_i),
       .d(W2_i),
       .e(W9_i),
       .selector(control_select),
       .y(W_I10)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL11
    (
       .a(W0_r),
       .b(W0_r),
       .c(W8_r),
       .d(W4_r),
       .e(W10_r),
       .selector(control_select),
       .y(W_R11)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG11
    (
       .a({DATA_WIDTH{1'b0}}),
       .b({DATA_WIDTH{1'b0}}),
       .c(W8_i),
       .d(W4_i),
       .e(W10_i),
       .selector(control_select),
       .y(W_I11)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL12
    (
       .a(W0_r),
       .b(W8_r),
       .c(W12_r),
       .d(W6_r),
       .e(W11_r),
       .selector(control_select),
       .y(W_R12)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG12
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(W8_i),
       .c(W12_i),
       .d(W6_i),
       .e(W11_i),
       .selector(control_select),
       .y(W_I12)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL13
    (
       .a(W0_r),
       .b(W0_r),
       .c(W0_r),
       .d(W8_r),
       .e(W12_r),
       .selector(control_select),
       .y(W_R13)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG13
    (
       .a({DATA_WIDTH{1'b0}}),
       .b({DATA_WIDTH{1'b0}}),
       .c({DATA_WIDTH{1'b0}}),
       .d(W8_i),
       .e(W12_i),
       .selector(control_select),
       .y(W_I13)
    );

    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL14
    (
       .a(W0_r),
       .b(W8_r),
       .c(W4_r),
       .d(W10_r),
       .e(W13_r),
       .selector(control_select),
       .y(W_R14)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG14
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(W8_i),
       .c(W4_i),
       .d(W10_i),
       .e(W13_i),
       .selector(control_select),
       .y(W_I14)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL15
    (
       .a(W0_r),
       .b(W0_r),
       .c(W8_r),
       .d(W12_r),
       .e(W14_r),
       .selector(control_select),
       .y(W_R15)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG15
    (
       .a({DATA_WIDTH{1'b0}}),
       .b({DATA_WIDTH{1'b0}}),
       .c(W8_i),
       .d(W12_i),
       .e(W14_i),
       .selector(control_select),
       .y(W_I15)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_REAL16
    (
       .a(W0_r),
       .b(W8_r),
       .c(W12_r),
       .d(W14_r),
       .e(W15_r),
       .selector(control_select),
       .y(W_R16)
    );
    MUX5x1 # (.DATA_WIDTH(DATA_WIDTH)) MUX_IMAG16
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(W8_i),
       .c(W12_i),
       .d(W14_i),
       .e(W15_i),
       .selector(control_select),
       .y(W_I16)
    );
endmodule