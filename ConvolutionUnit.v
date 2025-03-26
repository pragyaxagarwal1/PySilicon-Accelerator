module ConvolutionUnit (
    input clk, 
    input rst, 
    input [71:0] image,   // 9 pixels (each 8-bit), packed in a single 72-bit bus
    input [71:0] kernel,  // 9 kernel values (each 8-bit), packed in a single 72-bit bus
    output reg [15:0] result  // Output Pixel Value
);

    integer i;
    reg [15:0] sum;
    reg [7:0] image_array [0:8];  // Internal unpacked array for image
    reg [7:0] kernel_array [0:8]; // Internal unpacked array for kernel

    always @(*) begin
        // Unpacking the 72-bit input buses into 8-bit array elements
        for (i = 0; i < 9; i = i + 1) begin
            image_array[i] = image[i*8 +: 8];
            kernel_array[i] = kernel[i*8 +: 8];
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            sum <= 16'b0;
        else begin
            sum = 0;
            for (i = 0; i < 9; i = i + 1) begin
                sum = sum + image_array[i] * kernel_array[i];
            end
            result <= sum;
        end
    end

endmodule
