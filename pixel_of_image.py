import cv2
import numpy as np

# Use the correct Windows file path
image_path = r"C:\Users\PRAGYA\Desktop\PROGRAMMING\projects for resume\butterfly.jpg"

# Load the image in grayscale
img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)

# Check if the image was loaded successfully
if img is None:
    print("Error: Unable to load image. Check the file path.")
else:
    print("Image loaded successfully!")

    # Resize to 3x3 for Verilog test
    resized_img = cv2.resize(img, (3, 3), interpolation=cv2.INTER_NEAREST)

    # Convert to binary representation
    binary_values = [format(pixel, '08b') for row in resized_img for pixel in row]

    # Convert to a single 72-bit binary string
    image_binary = "_".join(binary_values)

    print(f"Verilog Testbench Image Data: {image_binary}")
