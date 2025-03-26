import numpy as np
import cv2
import matplotlib.pyplot as plt

# Define a simple 3x3 filter (Sobel Edge Detection)
kernel = np.array([[1, 0, -1],
                   [1, 0, -1],
                   [1, 0, -1]])

# Load an image in grayscale
image = cv2.imread("butterfly.jpg", cv2.IMREAD_GRAYSCALE)

# Check if the image was loaded successfully
if image is None:
    print("Error: Could not load image. Check file path and name.")
    exit()

# Get image dimensions
h, w = image.shape

# Apply convolution manually
output = np.zeros((h-2, w-2))  # Output image size after convolution

for i in range(h-2):
    for j in range(w-2):
        region = image[i:i+3, j:j+3]  # Extract 3x3 region
        output[i, j] = np.sum(region * kernel)  # Perform element-wise multiplication

# Normalize output
output = np.clip(output, 0, 255)

# Display images
plt.figure(figsize=(10,5))
plt.subplot(1,2,1)
plt.imshow(image, cmap='gray')
plt.title("Original Image")

plt.subplot(1,2,2)
plt.imshow(output, cmap='gray')
plt.title("Filtered Image")

plt.show()
