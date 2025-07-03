`timescale 1ns / 1ps
module FFT_tb;

  parameter inADC = 8;
  parameter inWordWidth_1 = 13; //
  parameter inWordWidth_2 = 8;
  parameter  I1 = 16; // butterfly output before round
  parameter  F1 = 6; 
  parameter  I2 = 12; // butterfly output 
  parameter  F2 = 0;
logic clk;

logic rst_n;
logic signed [inADC-1:0] ADC_in0_real;
logic signed [inADC-1:0] ADC_in1_real;
logic signed [inADC-1:0] ADC_in2_real;
logic signed [inADC-1:0] ADC_in3_real;
logic signed [inADC-1:0] ADC_in4_real;
logic signed [inADC-1:0] ADC_in5_real;
logic signed [inADC-1:0] ADC_in6_real;
logic signed [inADC-1:0] ADC_in7_real;
logic signed [inADC-1:0] ADC_in8_real;
logic signed [inADC-1:0] ADC_in9_real;
logic signed [inADC-1:0] ADC_in10_real;
logic signed [inADC-1:0] ADC_in11_real;
logic signed [inADC-1:0] ADC_in12_real;
logic signed [inADC-1:0] ADC_in13_real;
logic signed [inADC-1:0] ADC_in14_real;
logic signed [inADC-1:0] ADC_in15_real;
logic signed [inADC-1:0] ADC_in16_real;
logic signed [inADC-1:0] ADC_in17_real;
logic signed [inADC-1:0] ADC_in18_real;
logic signed [inADC-1:0] ADC_in19_real;
logic signed [inADC-1:0] ADC_in20_real;
logic signed [inADC-1:0] ADC_in21_real;
logic signed [inADC-1:0] ADC_in22_real;
logic signed [inADC-1:0] ADC_in23_real;
logic signed [inADC-1:0] ADC_in24_real;
logic signed [inADC-1:0] ADC_in25_real;
logic signed [inADC-1:0] ADC_in26_real;
logic signed [inADC-1:0] ADC_in27_real;
logic signed [inADC-1:0] ADC_in28_real;
logic signed [inADC-1:0] ADC_in29_real;
logic signed [inADC-1:0] ADC_in30_real;
logic signed [inADC-1:0] ADC_in31_real;

logic signed [inWordWidth_1-1:0] output_0_real;
logic signed [inWordWidth_1-1:0] output_0_imag;
logic signed [inWordWidth_1-1:0] output_1_real;
logic signed [inWordWidth_1-1:0] output_1_imag;
logic signed [inWordWidth_1-1:0] output_2_real;
logic signed [inWordWidth_1-1:0] output_2_imag;
logic signed [inWordWidth_1-1:0] output_3_real;
logic signed [inWordWidth_1-1:0] output_3_imag;
logic signed [inWordWidth_1-1:0] output_4_real;
logic signed [inWordWidth_1-1:0] output_4_imag;
logic signed [inWordWidth_1-1:0] output_5_real;
logic signed [inWordWidth_1-1:0] output_5_imag;
logic signed [inWordWidth_1-1:0] output_6_real;
logic signed [inWordWidth_1-1:0] output_6_imag;
logic signed [inWordWidth_1-1:0] output_7_real;
logic signed [inWordWidth_1-1:0] output_7_imag;
logic signed [inWordWidth_1-1:0] output_8_real;
logic signed [inWordWidth_1-1:0] output_8_imag;
logic signed [inWordWidth_1-1:0] output_9_real;
logic signed [inWordWidth_1-1:0] output_9_imag;
logic signed [inWordWidth_1-1:0] output_10_real;
logic signed [inWordWidth_1-1:0] output_10_imag;
logic signed [inWordWidth_1-1:0] output_11_real;
logic signed [inWordWidth_1-1:0] output_11_imag;
logic signed [inWordWidth_1-1:0] output_12_real;
logic signed [inWordWidth_1-1:0] output_12_imag;
logic signed [inWordWidth_1-1:0] output_13_real;
logic signed [inWordWidth_1-1:0] output_13_imag;
logic signed [inWordWidth_1-1:0] output_14_real;
logic signed [inWordWidth_1-1:0] output_14_imag;
logic signed [inWordWidth_1-1:0] output_15_real;
logic signed [inWordWidth_1-1:0] output_15_imag;
logic signed [inWordWidth_1-1:0] output_16_real;
logic signed [inWordWidth_1-1:0] output_16_imag;
logic signed [inWordWidth_1-1:0] output_17_real;
logic signed [inWordWidth_1-1:0] output_17_imag;
logic signed [inWordWidth_1-1:0] output_18_real;
logic signed [inWordWidth_1-1:0] output_18_imag;
logic signed [inWordWidth_1-1:0] output_19_real;
logic signed [inWordWidth_1-1:0] output_19_imag;
logic signed [inWordWidth_1-1:0] output_20_real;
logic signed [inWordWidth_1-1:0] output_20_imag;
logic signed [inWordWidth_1-1:0] output_21_real;
logic signed [inWordWidth_1-1:0] output_21_imag;
logic signed [inWordWidth_1-1:0] output_22_real;
logic signed [inWordWidth_1-1:0] output_22_imag;
logic signed [inWordWidth_1-1:0] output_23_real;
logic signed [inWordWidth_1-1:0] output_23_imag;
logic signed [inWordWidth_1-1:0] output_24_real;
logic signed [inWordWidth_1-1:0] output_24_imag;
logic signed [inWordWidth_1-1:0] output_25_real;
logic signed [inWordWidth_1-1:0] output_25_imag;
logic signed [inWordWidth_1-1:0] output_26_real;
logic signed [inWordWidth_1-1:0] output_26_imag;
logic signed [inWordWidth_1-1:0] output_27_real;
logic signed [inWordWidth_1-1:0] output_27_imag;
logic signed [inWordWidth_1-1:0] output_28_real;
logic signed [inWordWidth_1-1:0] output_28_imag;
logic signed [inWordWidth_1-1:0] output_29_real;
logic signed [inWordWidth_1-1:0] output_29_imag;
logic signed [inWordWidth_1-1:0] output_30_real;
logic signed [inWordWidth_1-1:0] output_30_imag;
logic signed [inWordWidth_1-1:0] output_31_real;
logic signed [inWordWidth_1-1:0] output_31_imag;
FFT_TOP #(
  .inWordWidth_1(inWordWidth_1),
  .inWordWidth_2(inWordWidth_2),
  .I1(I1),
  .F1(F1),
  .I2(I2),
  .F2(F2)
) FFT_TOP_inst (
  .*
);

// clock 100MHZ

initial begin
clk = 1'b0;
forever #5 clk = ~clk;
end


bit signed [inADC -1:0] INPUT [32];
bit signed [inADC -1:0] OUTPUT [32][2];
bit signed [inADC -1:0] OUTPUT_sim [32][2];



// Test
int fd  ;
initial 
	begin
    fd = $fopen("input.txt","r");
    for (int i = 0 ; i <32 ; i++) begin
      $fscanf(fd,"%d",INPUT[i]);
    end

    fd = $fopen("output.txt","r");
    for (int i = 0 ; i <32 ; i++) begin
      $fscanf(fd,"%d",OUTPUT[i][0]);
      $fscanf(fd,"%d",OUTPUT[i][1]);
    end

	end		  

initial begin
  rst_n = 1'b0;
  #25 rst_n = 1'b1;
  ADC_in0_real  = INPUT[0];
  ADC_in1_real  = INPUT[1];
  ADC_in2_real  = INPUT[2];
  ADC_in3_real  = INPUT[3];
  ADC_in4_real  = INPUT[4];
  ADC_in5_real  = INPUT[5];
  ADC_in6_real  = INPUT[6];
  ADC_in7_real  = INPUT[7];
  ADC_in8_real  = INPUT[8];
  ADC_in9_real  = INPUT[9];
  ADC_in10_real = INPUT[10];
  ADC_in11_real = INPUT[11];
  ADC_in12_real = INPUT[12];
  ADC_in13_real = INPUT[13];
  ADC_in14_real = INPUT[14];
  ADC_in15_real = INPUT[15];
  ADC_in16_real = INPUT[16];
  ADC_in17_real = INPUT[17];
  ADC_in18_real = INPUT[18];
  ADC_in19_real = INPUT[19];
  ADC_in20_real = INPUT[20];
  ADC_in21_real = INPUT[21];
  ADC_in22_real = INPUT[22];
  ADC_in23_real = INPUT[23];
  ADC_in24_real = INPUT[24];
  ADC_in25_real = INPUT[25];
  ADC_in26_real = INPUT[26];
  ADC_in27_real = INPUT[27];
  ADC_in28_real = INPUT[28];
  ADC_in29_real = INPUT[29];
  ADC_in30_real = INPUT[30];
  ADC_in31_real = INPUT[31];

  repeat(6) @(posedge clk );
  #5;
  OUTPUT_sim[0][0] = output_0_real;
  OUTPUT_sim[0][1] =output_0_imag;
  OUTPUT_sim[1][0] =output_1_real;
  OUTPUT_sim[1][1] =output_1_imag;
  OUTPUT_sim[2][0] =output_2_real;
  OUTPUT_sim[2][1] =output_2_imag;
  OUTPUT_sim[3][0] =output_3_real;
  OUTPUT_sim[3][1] =output_3_imag;
  OUTPUT_sim[4][0] =output_4_real;
  OUTPUT_sim[4][1] =output_4_imag;
  OUTPUT_sim[5][0] =output_5_real;
  OUTPUT_sim[5][1] =output_5_imag;
  OUTPUT_sim[6][0] =output_6_real;
  OUTPUT_sim[6][1] =output_6_imag;
  OUTPUT_sim[7][0] =output_7_real;
  OUTPUT_sim[7][1] =output_7_imag;
  OUTPUT_sim[8][0] =output_8_real;
  OUTPUT_sim[8][1] =output_8_imag;
  OUTPUT_sim[9][0] =output_9_real;
  OUTPUT_sim[9][1] =output_9_imag;
  OUTPUT_sim[10][0] =output_10_real;
  OUTPUT_sim[10][1] =output_10_imag;
  OUTPUT_sim[11][0] =output_11_real;
  OUTPUT_sim[11][1] =output_11_imag;
  OUTPUT_sim[12][0] =output_12_real;
  OUTPUT_sim[12][1] =output_12_imag;
  OUTPUT_sim[13][0] =output_13_real;
  OUTPUT_sim[13][1] =output_13_imag;
  OUTPUT_sim[14][0] =output_14_real;
  OUTPUT_sim[14][1] =output_14_imag;
  OUTPUT_sim[15][0] =output_15_real;
  OUTPUT_sim[15][1] =output_15_imag;
  OUTPUT_sim[16][0] =output_16_real;
  OUTPUT_sim[16][1] =output_16_imag;
  OUTPUT_sim[17][0] =output_17_real;
  OUTPUT_sim[17][1] =output_17_imag;
  OUTPUT_sim[18][0] =output_18_real;
  OUTPUT_sim[18][1] =output_18_imag;
  OUTPUT_sim[19][0] =output_19_real;
  OUTPUT_sim[19][1] =output_19_imag;
  OUTPUT_sim[20][0] =output_20_real;
  OUTPUT_sim[20][1] =output_20_imag;
  OUTPUT_sim[21][0] =output_21_real;
  OUTPUT_sim[21][1] =output_21_imag;
  OUTPUT_sim[22][0] =output_22_real;
  OUTPUT_sim[22][1] =output_22_imag;
  OUTPUT_sim[23][0] =output_23_real;
  OUTPUT_sim[23][1] =output_23_imag;
  OUTPUT_sim[24][0] =output_24_real;
  OUTPUT_sim[24][1] =output_24_imag;
  OUTPUT_sim[25][0] =output_25_real;
  OUTPUT_sim[25][1] =output_25_imag;
  OUTPUT_sim[26][0] =output_26_real;
  OUTPUT_sim[26][1] =output_26_imag;
  OUTPUT_sim[27][0] =output_27_real;
  OUTPUT_sim[27][1] =output_27_imag;
  OUTPUT_sim[28][0] =output_28_real;
  OUTPUT_sim[28][1] =output_28_imag;
  OUTPUT_sim[29][0] =output_29_real;
  OUTPUT_sim[29][1] =output_29_imag;
  OUTPUT_sim[30][0] =output_30_real;
  OUTPUT_sim[30][1] =output_30_imag;
  OUTPUT_sim[31][0] =output_31_real;
  OUTPUT_sim[31][1] =output_31_imag;


  for(int i = 0 ; i < 32 ; i++)begin
    CHECK_real: assert (abs(OUTPUT_sim[i][0] - OUTPUT[i][0]) <= 1 )
      else $error("Assertion CHECK_Real failed! , Expected = %d  , output = %d " ,OUTPUT[i][0] , OUTPUT_sim[i][0] );
    CHECK_imag: assert (abs(OUTPUT_sim[i][1] - OUTPUT[i][1]) <= 1 )
      else $error("Assertion CHECK_imag failed! , Expected = %d  , output = %d " ,OUTPUT[i][1] , OUTPUT_sim[i][1] );
  end
  
#1000 $stop;

end


function int abs(input int in );
    if ($signed(in) < 0)
      return -$signed(in);
    else
      return in;
endfunction


endmodule