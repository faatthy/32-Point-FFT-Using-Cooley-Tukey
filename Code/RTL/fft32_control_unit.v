module control_unit
    #(parameter mux_width=3)
    (
        input wire clk,rst_n,
        output reg [mux_width-1:0]mux_sel
    );

    reg [mux_width-1:0]counter;
    always@(posedge clk,negedge rst_n)begin
        if(!rst_n)begin
            mux_sel<=0;
            counter<=0;
        end
        else begin
            mux_sel<=counter;
            counter<=counter+1;

            if(counter==3'd4) 
            counter<=0; 
        end


    end
endmodule