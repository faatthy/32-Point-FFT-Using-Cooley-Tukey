module MUX5x1
    #(parameter DATA_WIDTH=16,parameter Width_Mux=3)
    (
        input       [ DATA_WIDTH-1:0]     a,
        input       [ DATA_WIDTH-1:0]     b,
        input       [ DATA_WIDTH-1:0]     c,
        input       [ DATA_WIDTH-1:0]     d,
        input       [ DATA_WIDTH-1:0]     e,  
        input       [Width_Mux-1:0]       selector,

        output reg  [ DATA_WIDTH-1:0]     y
    );
    always@(*)begin
        case(selector)
            3'b000  :   y=a;
            3'b001  :   y=b;
            3'b010  :   y=c;
            3'b011  :   y=d;
            3'b100  :   y=e;
            default :   y=0;
        endcase
    end
endmodule
