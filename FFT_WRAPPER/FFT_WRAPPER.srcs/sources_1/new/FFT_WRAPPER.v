module FFT_WRAPPER #(
    parameter inADC = 8,
    parameter inWordWidth_1 = 13
)(
    input clk,
    input rst_n,
    input enable,                        // High for 32 cycles (one sample per cycle)
    input signed [inADC-1:0] data_in,    // Real input only (serial)
    output reg signed [inWordWidth_1-1:0] data_out, // Serial output: real(0)...real(31), imag(0)...imag(31)
    output reg valid                      // High when data_out is valid
);

    reg signed [inADC-1:0] real_buf [0:31];
    reg [5:0] sample_count;
    reg [5:0] output_count;
    reg fft_enable;
    wire fft_done;
    wire [inWordWidth_1-1:0] fft_out_real [0:31];
    wire [inWordWidth_1-1:0] fft_out_imag [0:31];
    
    // Input Serial to Parallel
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sample_count <= 0;
            fft_enable <= 0;
            for(integer i=0;i<32;i=i+1)begin
            real_buf[i]<=0;
            end
        end 
        else if (enable) begin
            real_buf[sample_count] <= data_in;
            sample_count <= sample_count + 1;

            if (sample_count == 31) begin
                fft_enable <= 1'b1;  // Trigger FFT after last sample
            end
        end else begin
            sample_count <= 0;
            fft_enable <= 0;
        end
    end

    // Instantiate FFT_TOP (Imag parts tied to 0)
    FFT_TOP fft_inst (
        .clk(clk),
        .rst_n(rst_n),
        .enable(fft_enable),
        .ADC_in0_real(real_buf[0]),
        .ADC_in1_real(real_buf[1]),
        .ADC_in2_real(real_buf[2]),
        .ADC_in3_real(real_buf[3]),
        .ADC_in4_real(real_buf[4]),
        .ADC_in5_real(real_buf[5]),
        .ADC_in6_real(real_buf[6]),
        .ADC_in7_real(real_buf[7]),
        .ADC_in8_real(real_buf[8]),
        .ADC_in9_real(real_buf[9]),
        .ADC_in10_real(real_buf[10]),
        .ADC_in11_real(real_buf[11]),
        .ADC_in12_real(real_buf[12]),
        .ADC_in13_real(real_buf[13]),
        .ADC_in14_real(real_buf[14]),
        .ADC_in15_real(real_buf[15]),
        .ADC_in16_real(real_buf[16]),
        .ADC_in17_real(real_buf[17]),
        .ADC_in18_real(real_buf[18]),
        .ADC_in19_real(real_buf[19]),
        .ADC_in20_real(real_buf[20]),
        .ADC_in21_real(real_buf[21]),
        .ADC_in22_real(real_buf[22]),
        .ADC_in23_real(real_buf[23]),
        .ADC_in24_real(real_buf[24]),
        .ADC_in25_real(real_buf[25]),
        .ADC_in26_real(real_buf[26]),
        .ADC_in27_real(real_buf[27]),
        .ADC_in28_real(real_buf[28]),
        .ADC_in29_real(real_buf[29]),
        .ADC_in30_real(real_buf[30]),
        .ADC_in31_real(real_buf[31]),
        .output_0_real(fft_out_real[0]),
        .output_0_imag(fft_out_imag[0]),
        .output_1_real(fft_out_real[1]),
        .output_1_imag(fft_out_imag[1]),
        .output_2_real(fft_out_real[2]),
        .output_2_imag(fft_out_imag[2]),
        .output_3_real(fft_out_real[3]),
        .output_3_imag(fft_out_imag[3]),
        .output_4_real(fft_out_real[4]),
        .output_4_imag(fft_out_imag[4]),
        .output_5_real(fft_out_real[5]),
        .output_5_imag(fft_out_imag[5]),
        .output_6_real(fft_out_real[6]),
        .output_6_imag(fft_out_imag[6]),
        .output_7_real(fft_out_real[7]),
        .output_7_imag(fft_out_imag[7]),
        .output_8_real(fft_out_real[8]),
        .output_8_imag(fft_out_imag[8]),
        .output_9_real(fft_out_real[9]),
        .output_9_imag(fft_out_imag[9]),
        .output_10_real(fft_out_real[10]),
        .output_10_imag(fft_out_imag[10]),
        .output_11_real(fft_out_real[11]),
        .output_11_imag(fft_out_imag[11]),
        .output_12_real(fft_out_real[12]),
        .output_12_imag(fft_out_imag[12]),
        .output_13_real(fft_out_real[13]),
        .output_13_imag(fft_out_imag[13]),
        .output_14_real(fft_out_real[14]),
        .output_14_imag(fft_out_imag[14]),
        .output_15_real(fft_out_real[15]),
        .output_15_imag(fft_out_imag[15]),
        .output_16_real(fft_out_real[16]),
        .output_16_imag(fft_out_imag[16]),
        .output_17_real(fft_out_real[17]),
        .output_17_imag(fft_out_imag[17]),
        .output_18_real(fft_out_real[18]),
        .output_18_imag(fft_out_imag[18]),
        .output_19_real(fft_out_real[19]),
        .output_19_imag(fft_out_imag[19]),
        .output_20_real(fft_out_real[20]),
        .output_20_imag(fft_out_imag[20]),
        .output_21_real(fft_out_real[21]),
        .output_21_imag(fft_out_imag[21]),
        .output_22_real(fft_out_real[22]),
        .output_22_imag(fft_out_imag[22]),
        .output_23_real(fft_out_real[23]),
        .output_23_imag(fft_out_imag[23]),
        .output_24_real(fft_out_real[24]),
        .output_24_imag(fft_out_imag[24]),
        .output_25_real(fft_out_real[25]),
        .output_25_imag(fft_out_imag[25]),
        .output_26_real(fft_out_real[26]),
        .output_26_imag(fft_out_imag[26]),
        .output_27_real(fft_out_real[27]),
        .output_27_imag(fft_out_imag[27]),
        .output_28_real(fft_out_real[28]),
        .output_28_imag(fft_out_imag[28]),
        .output_29_real(fft_out_real[29]),
        .output_29_imag(fft_out_imag[29]),
        .output_30_real(fft_out_real[30]),
        .output_30_imag(fft_out_imag[30]),
        .output_31_real(fft_out_real[31]),
        .output_31_imag(fft_out_imag[31]),
        .valid(fft_done)
    );

    // Output Parallel to Serial
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            output_count <= 0;
            data_out <= 0;
            valid <= 0;
        end else if (fft_done||valid) begin
            if (output_count < 32)begin
                data_out <= fft_out_real[output_count];
                valid<=1;
                end
            else begin
                data_out <= fft_out_imag[output_count - 32];
                valid<=1;
            end
            output_count <= output_count + 1;

            if (output_count == 63)
                valid <= 0;
        end
    end

endmodule
