module MAC #
    (
        parameter inWordWidth_1 = 13, // S(8,2)
        parameter inWordWidth_2 = 8,  // S(1,4)
        parameter  I1 = 16, 
        parameter  F1 = 6,  // Input fractional bits
        parameter  I2 = 12,  // Output integer bits (not including sign)
        parameter  F2 = 0   // Output fractional bits
    )
    (
        input                                   clk,
        input                                   rst_n,
        input signed    [inWordWidth_1-1:0]     A_real,
        input signed    [inWordWidth_1-1:0]     A_imag,
        input signed    [inWordWidth_1-1:0]     B_real,
        input signed    [inWordWidth_1-1:0]     B_imag,
        input signed    [inWordWidth_2-1:0]     W_real,
        input signed    [inWordWidth_2-1:0]     W_imag,
        output  reg     [inWordWidth_1-1:0]     out1_real,
        output  reg     [inWordWidth_1-1:0]     out1_imag,
        output  reg     [inWordWidth_1-1:0]     out2_real,
        output  reg     [inWordWidth_1-1:0]     out2_imag
    );
        
        wire signed [inWordWidth_1+inWordWidth_2 : 0]        mul_real_out;
        wire signed [inWordWidth_1+inWordWidth_2 : 0]        mul_img_out;
        wire signed [inWordWidth_1+inWordWidth_2 + 1 :0]     out_add_a_real;
        wire signed [inWordWidth_1+inWordWidth_2 + 1 :0]     out_add_a_img;
        wire signed [inWordWidth_1+inWordWidth_2 + 1 :0]     out_sub_a_real;
        wire signed [inWordWidth_1+inWordWidth_2 + 1 :0]     out_sub_a_img;
        wire signed [inWordWidth_1-1:0]                      sat_real_1_out ;
        wire signed [inWordWidth_1-1:0]                      sat_img_1_out ;
        wire signed [inWordWidth_1-1:0]                      sat_real_2_out ;
        wire signed [inWordWidth_1-1:0]                      sat_img_2_out ;

        complex_mult #(
            .inWordWidth_1(inWordWidth_1),
            .inWordWidth_2(inWordWidth_2)
        ) fft_complex_mult_unit (
            .in1_real(B_real),
            .in1_imag(B_imag),
            .in2_real(W_real),
            .in2_imag(W_imag),
            .out_real(mul_real_out), 
            .out_imag(mul_img_out)
        );

        // twiddle S(1,6) butterfly S(12,0) 
        // s(1+12,6+0)  >>> + 2IN = (15,6)
        // Mult > 13 + 8 + 1 bits  S(16,6)
        // A should be 13 + 8 + 1  it is now > 13 , so need to shift by 9 bits 
        // out add > 13+8+3
        assign out_add_a_real = $signed({A_real, 6'b0}) + $signed(mul_real_out);
        assign out_add_a_img  = $signed({A_imag, 6'b0}) + $signed(mul_img_out);
        assign out_sub_a_real = $signed({A_real, 6'b0}) - $signed(mul_real_out);
        assign out_sub_a_img  = $signed({A_imag, 6'b0}) - $signed(mul_img_out);
    

        round_and_sat #(.I1(I1),
                        .F1(F1),  
                        .I2(I2),  
                        .F2(F2))
        fft_real_1_round_and_sat(
        .data_in(out_add_a_real),
        .data_out(sat_real_1_out)
        );

        round_and_sat #(.I1(I1),
                        .F1(F1),  
                        .I2(I2),  
                        .F2(F2))
        fft_img_1_round_and_sat(
        .data_in(out_add_a_img),
        .data_out(sat_img_1_out)
        );

        round_and_sat #(.I1(I1),
                        .F1(F1),  
                        .I2(I2),  
                        .F2(F2))
        fft_real_2_round_and_sat(
        .data_in(out_sub_a_real),
        .data_out(sat_real_2_out)
        );

        round_and_sat #(.I1(I1),
                        .F1(F1),  
                        .I2(I2),  
                        .F2(F2))
        fft_img_2_round_and_sat(
        .data_in(out_sub_a_img),
        .data_out(sat_img_2_out)
        );

    always @(*)begin
        out1_imag = sat_img_1_out;
        out1_real = sat_real_1_out;
        out2_imag = sat_img_2_out;
        out2_real = sat_real_2_out;
    end

    endmodule