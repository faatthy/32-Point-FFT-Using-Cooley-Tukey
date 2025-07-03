module ROM_W_Imag
    #(parameter DATA_WIDTH=16)
    (
    output wire [ DATA_WIDTH-1:0]  reg0 ,
    output wire [ DATA_WIDTH-1:0]  reg1 ,
    output wire [ DATA_WIDTH-1:0]  reg2 ,
    output wire [ DATA_WIDTH-1:0]  reg3 ,
    output wire [ DATA_WIDTH-1:0]  reg4 ,
    output wire [ DATA_WIDTH-1:0]  reg5 ,
    output wire [ DATA_WIDTH-1:0]  reg6 ,
    output wire [ DATA_WIDTH-1:0]  reg7 ,
    output wire [ DATA_WIDTH-1:0]  reg8 ,
    output wire [ DATA_WIDTH-1:0]  reg9 ,
    output wire [ DATA_WIDTH-1:0]  reg10 ,
    output wire [ DATA_WIDTH-1:0]  reg11 ,
    output wire [ DATA_WIDTH-1:0]  reg12 ,
    output wire [ DATA_WIDTH-1:0]  reg13 ,
    output wire [ DATA_WIDTH-1:0]  reg14 ,
    output wire [ DATA_WIDTH-1:0]  reg15 
);

    assign reg0    =  'b00000000;
    assign reg1    =  'b11110100;
    assign reg2    =  'b11101000;
    assign reg3    =  'b11011100;
    assign reg4    =  'b11010011;
    assign reg5    =  'b11001011;
    assign reg6    =  'b11000101;
    assign reg7    =  'b11000001;
    assign reg8    =  'b11000000;
    assign reg9    =  'b11000001;
    assign reg10   =   'b11000101;
    assign reg11   =   'b11001011;
    assign reg12   =   'b11010011;
    assign reg13   =   'b11011100;
    assign reg14   =   'b11101000;
    assign reg15   =   'b11110100;

endmodule


