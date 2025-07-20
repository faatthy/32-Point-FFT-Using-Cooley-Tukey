module complex_mult #(
    parameter inWordWidth_1 = 18,
    parameter inWordWidth_2 = 20
)
(   
    input         signed  [inWordWidth_1 - 1 : 0]                   in1_real, 
    input         signed  [inWordWidth_1 - 1: 0]                    in1_imag, 
    input         signed  [inWordWidth_2 - 1: 0]                    in2_real, 
    input         signed  [inWordWidth_2 - 1: 0]                    in2_imag, 
    output  wire  signed  [inWordWidth_1+inWordWidth_2 : 0]         out_real, 
    output  wire  signed  [inWordWidth_1+inWordWidth_2 : 0]         out_imag 
);

wire signed [inWordWidth_1 : 0] ab = in1_real + in1_imag;  
wire signed [inWordWidth_2 : 0] dc = in2_imag - in2_real;   
wire signed [inWordWidth_2 : 0] cd = in2_real + in2_imag;  

wire signed [inWordWidth_2+inWordWidth_1 - 1 : 0] k1 = in2_real * ab; 
wire signed [inWordWidth_1+inWordWidth_2 - 1 : 0] k2 = in1_real * dc; 
wire signed [inWordWidth_1+inWordWidth_2 - 1 : 0] k3 = in1_imag * cd; 

assign  out_real = k1-k3; 
assign  out_imag = k1+k2; 


endmodule