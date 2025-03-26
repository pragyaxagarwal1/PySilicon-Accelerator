`timescale 1ns/1ps

module ConvolutionUnit_tb;

    reg clk, rst;
    reg [71:0] image;
    reg [71:0] kernel;
    wire [15:0] result;

    // Instantiate the module
    ConvolutionUnit uut (
        .clk(clk),
        .rst(rst),
        .image(image),
        .kernel(kernel),
        .result(result)
    );

    // Clock Generation
    always #5 clk = ~clk;  // 10ns clock period

    initial begin
        // Initialize Signals
        clk = 0;
        rst = 1;

        // Updated Image Data from Python
        image = 72'b01011010_01010101_10000010_10011011_00111010_10000100_10100010_11001111_01110011;

        // Example 3x3 Kernel (Sobel Edge Detection)
        kernel = 72'b00000001_00000000_11111111_00000001_00000000_11111111_00000001_00000000_11111111;  

        // Reset the module
        #10 rst = 0;  

        // Wait for results
        #50;
        
        // Display Output
        $display("Convolution Result: %d", result);

        // End simulation
        #10 $finish;
    end

    // Monitor the values
    initial begin
        $monitor("Time = %0t | Image = %h | Kernel = %h | Result = %d", $time, image, kernel, result);
    end

endmodule
