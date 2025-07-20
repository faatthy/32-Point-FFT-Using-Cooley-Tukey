module fft_wrapper_tb;

    parameter inADC = 8;
    parameter inWordWidth_1 = 13;

    reg clk;
    reg rst_n;
    reg enable;
    reg signed [inADC-1:0] data_in;
    wire signed [inWordWidth_1-1:0] data_out;
    wire valid;

    // Instantiate DUT
    FFT_WRAPPER #(
        .inADC(inADC),
        .inWordWidth_1(inWordWidth_1)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .data_in(data_in),
        .data_out(data_out),
        .valid(valid)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #2 clk = ~clk; // 100MHz
    end

    // Test sequence
    initial begin
        rst_n = 0;
        enable = 0;
        data_in = 0;
        #20;
        rst_n = 1;

        // Send first sample = 1
        @(posedge clk);
        enable = 1;
        data_in = 8'sd1;

        // Send next 31 samples = 0
        repeat (31) begin
            @(posedge clk);
            data_in = 8'sd0;
        end

        // Stop feeding data
        @(posedge clk);
        enable = 0;
        data_in = 0;

        // Wait for outputs
        repeat (125) @(posedge clk);

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | valid=%b | data_out=%0d", $time, valid, data_out);
    end

endmodule
