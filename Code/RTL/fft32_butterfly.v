/*instantiate 16 mac block*/
module Butterfly 
    #(      parameter inWordWidth_1 = 11,
            parameter inWordWidth_2 = 6,
            parameter  I1 = 0, 
            parameter  F1 = 5,  // Input fractional bits
            parameter  I2 = 0,  // Output integer bits (not including sign)
            parameter  F2 = 3   // Output fractional bits
)
    (   
        input wire clk,rst_n,
        input wire       [inWordWidth_1 - 1:0]      a_real1,
        input wire       [inWordWidth_1 - 1:0]      a_imag1,
        input wire       [inWordWidth_1 - 1:0]      b_real1,
        input wire       [inWordWidth_1 - 1:0]      b_imag1,

        input wire       [inWordWidth_1 - 1:0]      a_real2,
        input wire       [inWordWidth_1 - 1:0]      a_imag2,
        input wire       [inWordWidth_1 - 1:0]      b_real2,
        input wire       [inWordWidth_1 - 1:0]      b_imag2,

        input wire       [inWordWidth_1 - 1:0]      a_real3,
        input wire       [inWordWidth_1 - 1:0]      a_imag3,
        input wire       [inWordWidth_1 - 1:0]      b_real3,
        input wire       [inWordWidth_1 - 1:0]      b_imag3,

        input wire       [inWordWidth_1 - 1:0]      a_real4,
        input wire       [inWordWidth_1 - 1:0]      a_imag4,
        input wire       [inWordWidth_1 - 1:0]      b_real4,
        input wire       [inWordWidth_1 - 1:0]      b_imag4,

        input wire       [inWordWidth_1 - 1:0]      a_real5,
        input wire       [inWordWidth_1 - 1:0]      a_imag5,
        input wire       [inWordWidth_1 - 1:0]      b_real5,
        input wire       [inWordWidth_1 - 1:0]      b_imag5,

        input wire       [inWordWidth_1 - 1:0]      a_real6,
        input wire       [inWordWidth_1 - 1:0]      a_imag6,
        input wire       [inWordWidth_1 - 1:0]      b_real6,
        input wire       [inWordWidth_1 - 1:0]      b_imag6,

        input wire       [inWordWidth_1 - 1:0]      a_real7,
        input wire       [inWordWidth_1 - 1:0]      a_imag7,
        input wire       [inWordWidth_1 - 1:0]      b_real7,
        input wire       [inWordWidth_1 - 1:0]      b_imag7,

        input wire       [inWordWidth_1 - 1:0]      a_real8,
        input wire       [inWordWidth_1 - 1:0]      a_imag8,
        input wire       [inWordWidth_1 - 1:0]      b_real8,
        input wire       [inWordWidth_1 - 1:0]      b_imag8,

        input wire       [inWordWidth_1 - 1:0]      a_real9,
        input wire       [inWordWidth_1 - 1:0]      a_imag9,
        input wire       [inWordWidth_1 - 1:0]      b_real9,
        input wire       [inWordWidth_1 - 1:0]      b_imag9,

        input wire       [inWordWidth_1 - 1:0]      a_real10,
        input wire       [inWordWidth_1 - 1:0]      a_imag10,
        input wire       [inWordWidth_1 - 1:0]      b_real10,
        input wire       [inWordWidth_1 - 1:0]      b_imag10,

        input wire       [inWordWidth_1 - 1:0]      a_real11,
        input wire       [inWordWidth_1 - 1:0]      a_imag11,
        input wire       [inWordWidth_1 - 1:0]      b_real11,
        input wire       [inWordWidth_1 - 1:0]      b_imag11,

        input wire       [inWordWidth_1 - 1:0]      a_real12,
        input wire       [inWordWidth_1 - 1:0]      a_imag12,
        input wire       [inWordWidth_1 - 1:0]      b_real12,
        input wire       [inWordWidth_1 - 1:0]      b_imag12,

        input wire       [inWordWidth_1 - 1:0]      a_real13,
        input wire       [inWordWidth_1 - 1:0]      a_imag13,
        input wire       [inWordWidth_1 - 1:0]      b_real13,
        input wire       [inWordWidth_1 - 1:0]      b_imag13,

        input wire       [inWordWidth_1 - 1:0]      a_real14,
        input wire       [inWordWidth_1 - 1:0]      a_imag14,
        input wire       [inWordWidth_1 - 1:0]      b_real14,
        input wire       [inWordWidth_1 - 1:0]      b_imag14,

        input wire       [inWordWidth_1 - 1:0]      a_real15,
        input wire       [inWordWidth_1 - 1:0]      a_imag15,
        input wire       [inWordWidth_1 - 1:0]      b_real15,
        input wire       [inWordWidth_1 - 1:0]      b_imag15,

        input wire       [inWordWidth_1 - 1:0]      a_real16,
        input wire       [inWordWidth_1 - 1:0]      a_imag16,
        input wire       [inWordWidth_1 - 1:0]      b_real16,
        input wire       [inWordWidth_1 - 1:0]      b_imag16,


        input wire    [inWordWidth_2 - 1:0] W_R1,
        input wire    [inWordWidth_2 - 1:0] W_I1,

        input wire    [inWordWidth_2 - 1:0] W_R2,
        input wire    [inWordWidth_2 - 1:0] W_I2,

        input wire    [inWordWidth_2 - 1:0] W_R3,
        input wire    [inWordWidth_2 - 1:0] W_I3,

        input wire    [inWordWidth_2 - 1:0] W_R4,
        input wire    [inWordWidth_2 - 1:0] W_I4,

        input wire    [inWordWidth_2 - 1:0] W_R5,
        input wire    [inWordWidth_2 - 1:0] W_I5,

        input wire    [inWordWidth_2 - 1:0] W_R6,
        input wire    [inWordWidth_2 - 1:0] W_I6,

        input wire    [inWordWidth_2 - 1:0] W_R7,
        input wire    [inWordWidth_2 - 1:0] W_I7,

        input wire    [inWordWidth_2 - 1:0] W_R8,
        input wire    [inWordWidth_2 - 1:0] W_I8,

        input wire    [inWordWidth_2 - 1:0] W_R9,
        input wire    [inWordWidth_2 - 1:0] W_I9,

        input wire    [inWordWidth_2 - 1:0] W_R10,
        input wire    [inWordWidth_2 - 1:0] W_I10,

        input wire    [inWordWidth_2 - 1:0] W_R11,
        input wire    [inWordWidth_2 - 1:0] W_I11,

        input wire    [inWordWidth_2 - 1:0] W_R12,
        input wire    [inWordWidth_2 - 1:0] W_I12,

        input wire    [inWordWidth_2 - 1:0] W_R13,
        input wire    [inWordWidth_2 - 1:0] W_I13,

        input wire    [inWordWidth_2 - 1:0] W_R14,
        input wire    [inWordWidth_2 - 1:0] W_I14,

        input wire    [inWordWidth_2 - 1:0] W_R15,
        input wire    [inWordWidth_2 - 1:0] W_I15,

        input wire    [inWordWidth_2 - 1:0] W_R16,
        input wire    [inWordWidth_2 - 1:0] W_I16,


        output wire        [inWordWidth_1-1:0]     out0_real,
        output wire        [inWordWidth_1-1:0]     out0_imag,
        output wire        [inWordWidth_1-1:0]     out1_real,
        output wire        [inWordWidth_1-1:0]     out1_imag,
        output wire        [inWordWidth_1-1:0]     out2_real,
        output wire        [inWordWidth_1-1:0]     out2_imag,
        output wire        [inWordWidth_1-1:0]     out3_real,
        output wire        [inWordWidth_1-1:0]     out3_imag,
        output wire        [inWordWidth_1-1:0]     out4_real,
        output wire        [inWordWidth_1-1:0]     out4_imag,
        output wire        [inWordWidth_1-1:0]     out5_real,
        output wire        [inWordWidth_1-1:0]     out5_imag,
        output wire        [inWordWidth_1-1:0]     out6_real,
        output wire        [inWordWidth_1-1:0]     out6_imag,
        output wire        [inWordWidth_1-1:0]     out7_real,
        output wire        [inWordWidth_1-1:0]     out7_imag,
        output wire        [inWordWidth_1-1:0]     out8_real,
        output wire        [inWordWidth_1-1:0]     out8_imag,
        output wire        [inWordWidth_1-1:0]     out9_real,
        output wire        [inWordWidth_1-1:0]     out9_imag,
        output wire        [inWordWidth_1-1:0]     out10_real,
        output wire        [inWordWidth_1-1:0]     out10_imag,
        output wire        [inWordWidth_1-1:0]     out11_real,
        output wire        [inWordWidth_1-1:0]     out11_imag,
        output wire        [inWordWidth_1-1:0]     out12_real,
        output wire        [inWordWidth_1-1:0]     out12_imag,
        output wire        [inWordWidth_1-1:0]     out13_real,
        output wire        [inWordWidth_1-1:0]     out13_imag,
        output wire        [inWordWidth_1-1:0]     out14_real,
        output wire        [inWordWidth_1-1:0]     out14_imag,
        output wire        [inWordWidth_1-1:0]     out15_real,
        output wire        [inWordWidth_1-1:0]     out15_imag,
        output wire        [inWordWidth_1-1:0]     out16_real,
        output wire        [inWordWidth_1-1:0]     out16_imag,
        output wire        [inWordWidth_1-1:0]     out17_real,
        output wire        [inWordWidth_1-1:0]     out17_imag,
        output wire        [inWordWidth_1-1:0]     out18_real,
        output wire        [inWordWidth_1-1:0]     out18_imag,
        output wire        [inWordWidth_1-1:0]     out19_real,
        output wire        [inWordWidth_1-1:0]     out19_imag,
        output wire        [inWordWidth_1-1:0]     out20_real,
        output wire        [inWordWidth_1-1:0]     out20_imag,
        output wire        [inWordWidth_1-1:0]     out21_real,
        output wire        [inWordWidth_1-1:0]     out21_imag,
        output wire        [inWordWidth_1-1:0]     out22_real,
        output wire        [inWordWidth_1-1:0]     out22_imag,
        output wire        [inWordWidth_1-1:0]     out23_real,
        output wire        [inWordWidth_1-1:0]     out23_imag,
        output wire        [inWordWidth_1-1:0]     out24_real,
        output wire        [inWordWidth_1-1:0]     out24_imag,
        output wire        [inWordWidth_1-1:0]     out25_real,
        output wire        [inWordWidth_1-1:0]     out25_imag,
        output wire        [inWordWidth_1-1:0]     out26_real,
        output wire        [inWordWidth_1-1:0]     out26_imag,
        output wire        [inWordWidth_1-1:0]     out27_real,
        output wire        [inWordWidth_1-1:0]     out27_imag,
        output wire        [inWordWidth_1-1:0]     out28_real,
        output wire        [inWordWidth_1-1:0]     out28_imag,
        output wire        [inWordWidth_1-1:0]     out29_real,
        output wire        [inWordWidth_1-1:0]     out29_imag,
        output wire        [inWordWidth_1-1:0]     out30_real,
        output wire        [inWordWidth_1-1:0]     out30_imag,
        output wire        [inWordWidth_1-1:0]     out31_real,
        output wire        [inWordWidth_1-1:0]     out31_imag
    );
 MAC #(  .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
   ) BF1
    (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real1),  
       .A_imag(a_imag1),
       .B_real(b_real1),
       .B_imag(b_imag1),
       .W_real(W_R1),
       .W_imag(W_I1),
       .out1_real(out0_real),  
       .out1_imag(out0_imag),
       .out2_real(out1_real),
       .out2_imag(out1_imag)
    
   );
MAC #(  .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
   ) BF2
    (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real2),
       .A_imag(a_imag2),
       .B_real(b_real2),
       .B_imag(b_imag2),
       .W_real(W_R2),
       .W_imag(W_I2),
       .out1_real(out2_real),
       .out1_imag(out2_imag),
       .out2_real(out3_real),
       .out2_imag(out3_imag)
   );

MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
) BF3(
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real3),
       .A_imag(a_imag3),
       .B_real(b_real3),
       .B_imag(b_imag3),
       .W_real(W_R3),
       .W_imag(W_I3),
       .out1_real(out4_real),
       .out1_imag(out4_imag),
       .out2_real(out5_real),
       .out2_imag(out5_imag)
   );

MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
   ) BF4
   (
        .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real4),
       .A_imag(a_imag4),
       .B_real(b_real4),
       .B_imag(b_imag4),
       .W_real(W_R4),
       .W_imag(W_I4),
       .out1_real(out6_real),
       .out1_imag(out6_imag),
       .out2_real(out7_real),
       .out2_imag(out7_imag)
   );

MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
   )  BF5
    (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real5),
       .A_imag(a_imag5),
       .B_real(b_real5),
       .B_imag(b_imag5),
       .W_real(W_R5),
       .W_imag(W_I5),
       .out1_real(out8_real),
       .out1_imag(out8_imag),
       .out2_real(out9_real),
       .out2_imag(out9_imag)
   );


MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
   )   BF6
    (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real6),
       .A_imag(a_imag6),
       .B_real(b_real6),
       .B_imag(b_imag6),
       .W_real(W_R6),
       .W_imag(W_I6),
       .out1_real(out10_real),
       .out1_imag(out10_imag),
       .out2_real(out11_real),
       .out2_imag(out11_imag)
   );

MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
   ) BF7
    (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real7),
       .A_imag(a_imag7),
       .B_real(b_real7),
       .B_imag(b_imag7),
       .W_real(W_R7),
       .W_imag(W_I7),
       .out1_real(out12_real),
       .out1_imag(out12_imag),
       .out2_real(out13_real),
       .out2_imag(out13_imag)
   );

MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
   )  BF8
    (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real8),
       .A_imag(a_imag8),
       .B_real(b_real8),
       .B_imag(b_imag8),
       .W_real(W_R8),
       .W_imag(W_I8),
       .out1_real(out14_real),
       .out1_imag(out14_imag),
       .out2_real(out15_real),
       .out2_imag(out15_imag)
   );

MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
   ) BF9 (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real9),
       .A_imag(a_imag9),
       .B_real(b_real9),
       .B_imag(b_imag9),
       .W_real(W_R9),
       .W_imag(W_I9),
       .out1_real(out16_real),
       .out1_imag(out16_imag),
       .out2_real(out17_real),
       .out2_imag(out17_imag)
   );


MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
) BF10 (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real10),
       .A_imag(a_imag10),
       .B_real(b_real10),
       .B_imag(b_imag10),
       .W_real(W_R10),
       .W_imag(W_I10),
       .out1_real(out18_real),
       .out1_imag(out18_imag),
       .out2_real(out19_real),
       .out2_imag(out19_imag)
   );


MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
) BF11 (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real11),
       .A_imag(a_imag11),
       .B_real(b_real11),
       .B_imag(b_imag11),
       .W_real(W_R11),
       .W_imag(W_I11),
       .out1_real(out20_real),
       .out1_imag(out20_imag),
       .out2_real(out21_real),
       .out2_imag(out21_imag)
   );

MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
) BF12 (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real12),
       .A_imag(a_imag12),
       .B_real(b_real12),
       .B_imag(b_imag12),
       .W_real(W_R12),
       .W_imag(W_I12),
       .out1_real(out22_real),
       .out1_imag(out22_imag),
       .out2_real(out23_real),
       .out2_imag(out23_imag)
   );
MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
) BF13 (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real13),
       .A_imag(a_imag13),
       .B_real(b_real13),
       .B_imag(b_imag13),
       .W_real(W_R13),
       .W_imag(W_I13),
       .out1_real(out24_real),
       .out1_imag(out24_imag),
       .out2_real(out25_real),
       .out2_imag(out25_imag)
   );


MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
) BF14 (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real14),
       .A_imag(a_imag14),
       .B_real(b_real14),
       .B_imag(b_imag14),
       .W_real(W_R14),
       .W_imag(W_I14),
       .out1_real(out26_real),
       .out1_imag(out26_imag),
       .out2_real(out27_real),
       .out2_imag(out27_imag)
   );

MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
) BF15 (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real15),
       .A_imag(a_imag15),
       .B_real(b_real15),
       .B_imag(b_imag15),
       .W_real(W_R15),
       .W_imag(W_I15),
       .out1_real(out28_real),
       .out1_imag(out28_imag),
       .out2_real(out29_real),
       .out2_imag(out29_imag)
   );



MAC #(   .inWordWidth_1(inWordWidth_1),
         .inWordWidth_2(inWordWidth_2),
         .I1(I1), 
         .F1(F1),  // Input fractional bits
         .I2(I2),  // Output integer bits (not including sign)
         .F2(F2)   // Output fractional bits
) BF16 (
       .clk(clk),
       .rst_n(rst_n),
       .A_real(a_real16),
       .A_imag(a_imag16),
       .B_real(b_real16),
       .B_imag(b_imag16),
       .W_real(W_R16),
       .W_imag(W_I16),
       .out1_real(out30_real),
       .out1_imag(out30_imag),
       .out2_real(out31_real),
       .out2_imag(out31_imag)
   );
    endmodule