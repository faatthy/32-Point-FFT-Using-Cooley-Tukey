/*
This module contain 16 MUX5x1 5*1 for each butterfly and 16 MUX5x1 5*1 for twiddle factor real 
and 16 MUX5x1 5*1 for twiddle factors imag
*/

module SELECT_STAGE
    #(parameter DATA_WIDTH=16)(
         input wire        [DATA_WIDTH-1:0]     in0 ,
         input wire        [DATA_WIDTH-1:0]     in1 ,
         input wire        [DATA_WIDTH-1:0]     in2 ,
         input wire        [DATA_WIDTH-1:0]     in3 ,
         input wire        [DATA_WIDTH-1:0]     in4 ,
         input wire        [DATA_WIDTH-1:0]     in5 ,
         input wire        [DATA_WIDTH-1:0]     in6 ,
         input wire        [DATA_WIDTH-1:0]     in7 ,
         input wire        [DATA_WIDTH-1:0]     in8 ,
         input wire        [DATA_WIDTH-1:0]     in9 ,
         input wire        [DATA_WIDTH-1:0]     in10 ,
         input wire        [DATA_WIDTH-1:0]     in11 ,
         input wire        [DATA_WIDTH-1:0]     in12 ,
         input wire        [DATA_WIDTH-1:0]     in13 ,
         input wire        [DATA_WIDTH-1:0]     in14 ,
         input wire        [DATA_WIDTH-1:0]     in15 ,
         input wire        [DATA_WIDTH-1:0]     in16 ,
         input wire        [DATA_WIDTH-1:0]     in17 ,
         input wire        [DATA_WIDTH-1:0]     in18 ,
         input wire        [DATA_WIDTH-1:0]     in19 ,
         input wire        [DATA_WIDTH-1:0]     in20 ,
         input wire        [DATA_WIDTH-1:0]     in21 ,
         input wire        [DATA_WIDTH-1:0]     in22 ,
         input wire        [DATA_WIDTH-1:0]     in23 ,
         input wire        [DATA_WIDTH-1:0]     in24 ,
         input wire        [DATA_WIDTH-1:0]     in25 ,
         input wire        [DATA_WIDTH-1:0]     in26 ,
         input wire        [DATA_WIDTH-1:0]     in27 ,
         input wire        [DATA_WIDTH-1:0]     in28 ,
         input wire        [DATA_WIDTH-1:0]     in29 ,
         input wire        [DATA_WIDTH-1:0]     in30 ,
         input wire        [DATA_WIDTH-1:0]     in31 ,
        /*output from butterfly*/
         input wire        [DATA_WIDTH-1:0]     out0_real,
         input wire        [DATA_WIDTH-1:0]     out0_imag,
         input wire        [DATA_WIDTH-1:0]     out1_real,
         input wire        [DATA_WIDTH-1:0]     out1_imag,
         input wire        [DATA_WIDTH-1:0]     out2_real,
         input wire        [DATA_WIDTH-1:0]     out2_imag,
         input wire        [DATA_WIDTH-1:0]     out3_real,
         input wire        [DATA_WIDTH-1:0]     out3_imag,
         input wire        [DATA_WIDTH-1:0]     out4_real,
         input wire        [DATA_WIDTH-1:0]     out4_imag,
         input wire        [DATA_WIDTH-1:0]     out5_real,
         input wire        [DATA_WIDTH-1:0]     out5_imag,
         input wire        [DATA_WIDTH-1:0]     out6_real,
         input wire        [DATA_WIDTH-1:0]     out6_imag,
         input wire        [DATA_WIDTH-1:0]     out7_real,
         input wire        [DATA_WIDTH-1:0]     out7_imag,
         input wire        [DATA_WIDTH-1:0]     out8_real,
         input wire        [DATA_WIDTH-1:0]     out8_imag,
         input wire        [DATA_WIDTH-1:0]     out9_real,
         input wire        [DATA_WIDTH-1:0]     out9_imag,
         input wire        [DATA_WIDTH-1:0]     out10_real,
         input wire        [DATA_WIDTH-1:0]     out10_imag,
         input wire        [DATA_WIDTH-1:0]     out11_real,
         input wire        [DATA_WIDTH-1:0]     out11_imag,
         input wire        [DATA_WIDTH-1:0]     out12_real,
         input wire        [DATA_WIDTH-1:0]     out12_imag,
         input wire        [DATA_WIDTH-1:0]     out13_real,
         input wire        [DATA_WIDTH-1:0]     out13_imag,
         input wire        [DATA_WIDTH-1:0]     out14_real,
         input wire        [DATA_WIDTH-1:0]     out14_imag,
         input wire        [DATA_WIDTH-1:0]     out15_real,
         input wire        [DATA_WIDTH-1:0]     out15_imag,
         input wire        [DATA_WIDTH-1:0]     out16_real,
         input wire        [DATA_WIDTH-1:0]     out16_imag,
         input wire        [DATA_WIDTH-1:0]     out17_real,
         input wire        [DATA_WIDTH-1:0]     out17_imag,
         input wire        [DATA_WIDTH-1:0]     out18_real,
         input wire        [DATA_WIDTH-1:0]     out18_imag,
         input wire        [DATA_WIDTH-1:0]     out19_real,
         input wire        [DATA_WIDTH-1:0]     out19_imag,
         input wire        [DATA_WIDTH-1:0]     out20_real,
         input wire        [DATA_WIDTH-1:0]     out20_imag,
         input wire        [DATA_WIDTH-1:0]     out21_real,
         input wire        [DATA_WIDTH-1:0]     out21_imag,
         input wire        [DATA_WIDTH-1:0]     out22_real,
         input wire        [DATA_WIDTH-1:0]     out22_imag,
         input wire        [DATA_WIDTH-1:0]     out23_real,
         input wire        [DATA_WIDTH-1:0]     out23_imag,
         input wire        [DATA_WIDTH-1:0]     out24_real,
         input wire        [DATA_WIDTH-1:0]     out24_imag,
         input wire        [DATA_WIDTH-1:0]     out25_real,
         input wire        [DATA_WIDTH-1:0]     out25_imag,
         input wire        [DATA_WIDTH-1:0]     out26_real,
         input wire        [DATA_WIDTH-1:0]     out26_imag,
         input wire        [DATA_WIDTH-1:0]     out27_real,
         input wire        [DATA_WIDTH-1:0]     out27_imag,
         input wire        [DATA_WIDTH-1:0]     out28_real,
         input wire        [DATA_WIDTH-1:0]     out28_imag,
         input wire        [DATA_WIDTH-1:0]     out29_real,
         input wire        [DATA_WIDTH-1:0]     out29_imag,
         input wire        [DATA_WIDTH-1:0]     out30_real,
         input wire        [DATA_WIDTH-1:0]     out30_imag,
         input wire        [DATA_WIDTH-1:0]     out31_real,
         input wire        [DATA_WIDTH-1:0]     out31_imag,
         input wire        [2:0]       control_select,

         /*OUTPUTS*/
        output wire      [DATA_WIDTH-1:0]      a_real1,
        output wire      [DATA_WIDTH-1:0]      a_imag1,
        output wire      [DATA_WIDTH-1:0]      b_real1,
        output wire      [DATA_WIDTH-1:0]      b_imag1,

        output wire      [DATA_WIDTH-1:0]      a_real2,
        output wire      [DATA_WIDTH-1:0]      a_imag2,
        output wire      [DATA_WIDTH-1:0]      b_real2,
        output wire      [DATA_WIDTH-1:0]      b_imag2,

        output wire      [DATA_WIDTH-1:0]      a_real3,
        output wire      [DATA_WIDTH-1:0]      a_imag3,
        output wire      [DATA_WIDTH-1:0]      b_real3,
        output wire      [DATA_WIDTH-1:0]      b_imag3,

        output wire      [DATA_WIDTH-1:0]      a_real4,
        output wire      [DATA_WIDTH-1:0]      a_imag4,
        output wire      [DATA_WIDTH-1:0]      b_real4,
        output wire      [DATA_WIDTH-1:0]      b_imag4,

        output wire      [DATA_WIDTH-1:0]      a_real5,
        output wire      [DATA_WIDTH-1:0]      a_imag5,
        output wire      [DATA_WIDTH-1:0]      b_real5,
        output wire      [DATA_WIDTH-1:0]      b_imag5,

        output wire      [DATA_WIDTH-1:0]      a_real6,
        output wire      [DATA_WIDTH-1:0]      a_imag6,
        output wire      [DATA_WIDTH-1:0]      b_real6,
        output wire      [DATA_WIDTH-1:0]      b_imag6,

        output wire      [DATA_WIDTH-1:0]      a_real7,
        output wire      [DATA_WIDTH-1:0]      a_imag7,
        output wire      [DATA_WIDTH-1:0]      b_real7,
        output wire      [DATA_WIDTH-1:0]      b_imag7,

        output wire      [DATA_WIDTH-1:0]      a_real8,
        output wire      [DATA_WIDTH-1:0]      a_imag8,
        output wire      [DATA_WIDTH-1:0]      b_real8,
        output wire      [DATA_WIDTH-1:0]      b_imag8,

        output wire      [DATA_WIDTH-1:0]      a_real9,
        output wire      [DATA_WIDTH-1:0]      a_imag9,
        output wire      [DATA_WIDTH-1:0]      b_real9,
        output wire      [DATA_WIDTH-1:0]      b_imag9,

        output wire      [DATA_WIDTH-1:0]      a_real10,
        output wire      [DATA_WIDTH-1:0]      a_imag10,
        output wire      [DATA_WIDTH-1:0]      b_real10,
        output wire      [DATA_WIDTH-1:0]      b_imag10,

        output wire      [DATA_WIDTH-1:0]      a_real11,
        output wire      [DATA_WIDTH-1:0]      a_imag11,
        output wire      [DATA_WIDTH-1:0]      b_real11,
        output wire      [DATA_WIDTH-1:0]      b_imag11,

        output wire      [DATA_WIDTH-1:0]      a_real12,
        output wire      [DATA_WIDTH-1:0]      a_imag12,
        output wire      [DATA_WIDTH-1:0]      b_real12,
        output wire      [DATA_WIDTH-1:0]      b_imag12,

        output wire      [DATA_WIDTH-1:0]      a_real13,
        output wire      [DATA_WIDTH-1:0]      a_imag13,
        output wire      [DATA_WIDTH-1:0]      b_real13,
        output wire      [DATA_WIDTH-1:0]      b_imag13,

        output wire      [DATA_WIDTH-1:0]      a_real14,
        output wire      [DATA_WIDTH-1:0]      a_imag14,
        output wire      [DATA_WIDTH-1:0]      b_real14,
        output wire      [DATA_WIDTH-1:0]      b_imag14,

        output wire      [DATA_WIDTH-1:0]      a_real15,
        output wire      [DATA_WIDTH-1:0]      a_imag15,
        output wire      [DATA_WIDTH-1:0]      b_real15,
        output wire      [DATA_WIDTH-1:0]      b_imag15,

        output wire      [DATA_WIDTH-1:0]      a_real16,
        output wire      [DATA_WIDTH-1:0]      a_imag16,
        output wire      [DATA_WIDTH-1:0]      b_real16,
        output wire      [DATA_WIDTH-1:0]      b_imag16

        );


    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL1
    (
       .a(in0),
       .b(out0_real),
       .c(out0_real),
       .d(out0_real),
       .e(out0_real),
       .selector(control_select),
       .y(a_real1)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG1
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out0_imag),
       .c(out0_imag),
       .d(out0_imag),
       .e(out0_imag),
       .selector(control_select),
       .y(a_imag1)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL1
    (
       .a(in16 ),
       .b(out2_real),
       .c(out4_real),
       .d(out8_real),
       .e(out16_real),
       .selector(control_select),
       .y(b_real1)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG1
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out2_imag),
       .c(out4_imag),
       .d(out8_imag),
       .e(out16_imag),
       .selector(control_select),
       .y(b_imag1)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL2
    (
       .a(in8 ),
       .b(out1_real),
       .c(out2_real),
       .d(out2_real),
       .e(out2_real),
       .selector(control_select),
       .y(a_real2)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG2
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out1_imag),
       .c(out2_imag),
       .d(out2_imag),
       .e(out2_imag),
       .selector(control_select),
       .y(a_imag2)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL2
    (
       .a(in24 ),
       .b(out3_real),
       .c(out6_real),
       .d(out10_real),
       .e(out18_real),
       .selector(control_select),
       .y(b_real2)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG2
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out3_imag),
       .c(out6_imag),
       .d(out10_imag),
       .e(out18_imag),
       .selector(control_select),
       .y(b_imag2)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL3
    (
       .a(in4 ),
       .b(out4_real),
       .c(out1_real),
       .d(out4_real),
       .e(out4_real),
       .selector(control_select),
       .y(a_real3)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG3
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out4_imag),
       .c(out1_imag),
       .d(out4_imag),
       .e(out4_imag),
       .selector(control_select),
       .y(a_imag3)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL3
    (
       .a(in20 ),
       .b(out6_real),
       .c(out5_real),
       .d(out12_real),
       .e(out20_real),
       .selector(control_select),
       .y(b_real3)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG3
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out6_imag),
       .c(out5_imag),
       .d(out12_imag),
       .e(out20_imag),
       .selector(control_select),
       .y(b_imag3)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL4
    (
       .a(in12 ),
       .b(out5_real),
       .c(out3_real),
       .d(out6_real),
       .e(out6_real),
       .selector(control_select),
       .y(a_real4)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG4
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out5_imag),
       .c(out3_imag),
       .d(out6_imag),
       .e(out6_imag),
       .selector(control_select),
       .y(a_imag4)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL4
    (
       .a(in28 ),
       .b(out7_real),
       .c(out7_real),
       .d(out14_real),
       .e(out22_real),
       .selector(control_select),
       .y(b_real4)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG4
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out7_imag),
       .c(out7_imag),
       .d(out14_imag),
       .e(out22_imag),
       .selector(control_select),
       .y(b_imag4)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL5
    (
       .a(in2 ),
       .b(out8_real),
       .c(out8_real),
       .d(out1_real),
       .e(out8_real),
       .selector(control_select),
       .y(a_real5)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG5
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out8_imag),
       .c(out8_imag),
       .d(out1_imag),
       .e(out8_imag),
       .selector(control_select),
       .y(a_imag5)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL5
    (
       .a(in18 ),
       .b(out10_real),
       .c(out12_real),
       .d(out9_real),
       .e(out24_real),
       .selector(control_select),
       .y(b_real5)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG5
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out10_imag),
       .c(out12_imag),
       .d(out9_imag),
       .e(out24_imag),
       .selector(control_select),
       .y(b_imag5)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL6
    (
       .a(in10 ),
       .b(out9_real),
       .c(out10_real),
       .d(out3_real),
       .e(out10_real),
       .selector(control_select),
       .y(a_real6)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG6
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out9_imag),
       .c(out10_imag),
       .d(out3_imag),
       .e(out10_imag),
       .selector(control_select),
       .y(a_imag6)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL6
    (
       .a(in26 ),
       .b(out11_real),
       .c(out14_real),
       .d(out11_real),
       .e(out26_real),
       .selector(control_select),
       .y(b_real6)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG6
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out11_imag),
       .c(out14_imag),
       .d(out11_imag),
       .e(out26_imag),
       .selector(control_select),
       .y(b_imag6)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL7
    (
       .a(in6 ),
       .b(out12_real),
       .c(out9_real),
       .d(out5_real),
       .e(out12_real),
       .selector(control_select),
       .y(a_real7)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG7
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out12_imag),
       .c(out9_imag),
       .d(out5_imag),
       .e(out12_imag),
       .selector(control_select),
       .y(a_imag7)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL7
    (
       .a(in22 ),
       .b(out14_real),
       .c(out13_real),
       .d(out13_real),
       .e(out28_real),
       .selector(control_select),
       .y(b_real7)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG7
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out14_imag),
       .c(out13_imag),
       .d(out13_imag),
       .e(out28_imag),
       .selector(control_select),
       .y(b_imag7)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL8
    (
       .a(in14 ),
       .b(out13_real),
       .c(out11_real),
       .d(out7_real),
       .e(out14_real),
       .selector(control_select),
       .y(a_real8)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG8
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out13_imag),
       .c(out11_imag),
       .d(out7_imag),
       .e(out14_imag),
       .selector(control_select),
       .y(a_imag8)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL8
    (
       .a(in30 ),
       .b(out15_real),
       .c(out15_real),
       .d(out15_real),
       .e(out30_real),
       .selector(control_select),
       .y(b_real8)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG8
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out15_imag),
       .c(out15_imag),
       .d(out15_imag),
       .e(out30_imag),
       .selector(control_select),
       .y(b_imag8)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL9
    (
       .a(in1 ),
       .b(out16_real),
       .c(out16_real),
       .d(out16_real),
       .e(out1_real),
       .selector(control_select),
       .y(a_real9)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG9
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out16_imag),
       .c(out16_imag),
       .d(out16_imag),
       .e(out1_imag),
       .selector(control_select),
       .y(a_imag9)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL9
    (
       .a(in17 ),
       .b(out18_real),
       .c(out20_real),
       .d(out24_real),
       .e(out17_real),
       .selector(control_select),
       .y(b_real9)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG9
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out18_imag),
       .c(out20_imag),
       .d(out24_imag),
       .e(out17_imag),
       .selector(control_select),
       .y(b_imag9)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL10
    (
       .a(in9 ),
       .b(out17_real),
       .c(out18_real),
       .d(out18_real),
       .e(out3_real),
       .selector(control_select),
       .y(a_real10)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG10
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out17_imag),
       .c(out18_imag),
       .d(out18_imag),
       .e(out3_imag),
       .selector(control_select),
       .y(a_imag10)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL10
    (
       .a(in25 ),
       .b(out19_real),
       .c(out22_real),
       .d(out26_real),
       .e(out19_real),
       .selector(control_select),
       .y(b_real10)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG10
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out19_imag),
       .c(out22_imag),
       .d(out26_imag),
       .e(out19_imag),
       .selector(control_select),
       .y(b_imag10)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL11
    (
       .a(in5 ),
       .b(out20_real),
       .c(out17_real),
       .d(out20_real),
       .e(out5_real),
       .selector(control_select),
       .y(a_real11)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG11
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out20_imag),
       .c(out17_imag),
       .d(out20_imag),
       .e(out5_imag),
       .selector(control_select),
       .y(a_imag11)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL11
    (
       .a(in21 ),
       .b(out22_real),
       .c(out21_real),
       .d(out28_real),
       .e(out21_real),
       .selector(control_select),
       .y(b_real11)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG11
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out22_imag),
       .c(out21_imag),
       .d(out28_imag),
       .e(out21_imag),
       .selector(control_select),
       .y(b_imag11)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL12
    (
       .a(in13 ),
       .b(out21_real),
       .c(out19_real),
       .d(out22_real),
       .e(out7_real),
       .selector(control_select),
       .y(a_real12)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG12
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out21_imag),
       .c(out19_imag),
       .d(out22_imag),
       .e(out7_imag),
       .selector(control_select),
       .y(a_imag12)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL12
    (
       .a(in29 ),
       .b(out23_real),
       .c(out23_real),
       .d(out30_real),
       .e(out23_real),
       .selector(control_select),
       .y(b_real12)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG12
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out23_imag),
       .c(out23_imag),
       .d(out30_imag),
       .e(out23_imag),
       .selector(control_select),
       .y(b_imag12)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL13
    (
       .a(in3 ),
       .b(out24_real),
       .c(out24_real),
       .d(out17_real),
       .e(out9_real),
       .selector(control_select),
       .y(a_real13)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG13
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out24_imag),
       .c(out24_imag),
       .d(out17_imag),
       .e(out9_imag),
       .selector(control_select),
       .y(a_imag13)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL13
    (
       .a(in19 ),
       .b(out26_real),
       .c(out28_real),
       .d(out25_real),
       .e(out25_real),
       .selector(control_select),
       .y(b_real13)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG13
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out26_imag),
       .c(out28_imag),
       .d(out25_imag),
       .e(out25_imag),
       .selector(control_select),
       .y(b_imag13)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL14
    (
       .a(in11 ),
       .b(out25_real),
       .c(out26_real),
       .d(out19_real),
       .e(out11_real),
       .selector(control_select),
       .y(a_real14)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG14
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out25_imag),
       .c(out26_imag),
       .d(out19_imag),
       .e(out11_imag),
       .selector(control_select),
       .y(a_imag14)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL14
    (
       .a(in27 ),
       .b(out27_real),
       .c(out30_real),
       .d(out27_real),
       .e(out27_real),
       .selector(control_select),
       .y(b_real14)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG14
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out27_imag),
       .c(out30_imag),
       .d(out27_imag),
       .e(out27_imag),
       .selector(control_select),
       .y(b_imag14)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL15
    (
       .a(in7 ),
       .b(out28_real),
       .c(out25_real),
       .d(out21_real),
       .e(out13_real),
       .selector(control_select),
       .y(a_real15)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG15
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out28_imag),
       .c(out25_imag),
       .d(out21_imag),
       .e(out13_imag),
       .selector(control_select),
       .y(a_imag15)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL15
    (
       .a(in23 ),
       .b(out30_real),
       .c(out29_real),
       .d(out29_real),
       .e(out29_real),
       .selector(control_select),
       .y(b_real15)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG15
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out30_imag),
       .c(out29_imag),
       .d(out29_imag),
       .e(out29_imag),
       .selector(control_select),
       .y(b_imag15)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_REAL16
    (
       .a(in15 ),
       .b(out29_real),
       .c(out27_real),
       .d(out23_real),
       .e(out15_real),
       .selector(control_select),
       .y(a_real16)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) A_IMAG16
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out29_imag),
       .c(out27_imag),
       .d(out23_imag),
       .e(out15_imag),
       .selector(control_select),
       .y(a_imag16)
    );
    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_REAL16
    (
       .a(in31 ),
       .b(out31_real),
       .c(out31_real),
       .d(out31_real),
       .e(out31_real),
       .selector(control_select),
       .y(b_real16)
    );

    MUX5x1 #(.DATA_WIDTH(DATA_WIDTH),.Width_Mux(3)) B_IMAG16
    (
       .a({DATA_WIDTH{1'b0}}),
       .b(out31_imag),
       .c(out31_imag),
       .d(out31_imag),
       .e(out31_imag),
       .selector(control_select),
       .y(b_imag16)
    );
endmodule