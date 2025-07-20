module control_unit
    #(parameter mux_width=3)
    (
        input wire clk,rst_n,control_enable,
        output reg [mux_width-1:0]mux_sel
    );

    reg [mux_width-1:0]counter;
    reg flag;
    always@(posedge clk,negedge rst_n)begin
        if(!rst_n)begin
            mux_sel<=0;
            counter<=0;
            flag<=0;
        end
        else if(control_enable||flag) begin
            mux_sel<=counter;
            counter<=counter+1;
            if(control_enable)
            flag<=1;
            if(counter==3'd4) begin
            counter<=0; 
            flag<=0;
            end
        end
        else if(!flag&&counter==0)
        mux_sel<=0;
    end
endmodule