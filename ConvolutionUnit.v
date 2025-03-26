`timescale 1ns/1ps

module ConvolutionUnit(
    input clk, rst,
    input [71:0] image,
    input [71:0] kernel,
    output reg [15:0] result  // result is reg, so update inside always block
);
    
    reg [15:0] sum; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 16'b0;
            result <= 16'b0;  // Reset result
        end
        else begin
            // Element-wise multiplication and summation for 3x3 convolution
            sum <=  (image[71:64] * kernel[71:64]) +
                    (image[63:56] * kernel[63:56]) +
                    (image[55:48] * kernel[55:48]) +
                    (image[47:40] * kernel[47:40]) +
                    (image[39:32] * kernel[39:32]) +
                    (image[31:24] * kernel[31:24]) +
                    (image[23:16] * kernel[23:16]) +
                    (image[15:8]  * kernel[15:8])  +
                    (image[7:0]   * kernel[7:0]);

            result <= sum;  // Move result update inside always block
        end
    end

endmodule

