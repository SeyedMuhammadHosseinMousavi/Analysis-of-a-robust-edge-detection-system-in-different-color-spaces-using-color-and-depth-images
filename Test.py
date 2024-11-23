import cv2
import numpy as np
import matplotlib.pyplot as plt
from skimage.metrics import peak_signal_noise_ratio as psnr, mean_squared_error as mse

def load_and_convert_image(path):
    """Load an image and convert to different color spaces."""
    image = cv2.imread(path)
    images = {
        'RGB': cv2.cvtColor(image, cv2.COLOR_BGR2RGB),
        'CIE Lab': cv2.cvtColor(image, cv2.COLOR_BGR2Lab),
        'YIQ': cv2.cvtColor(image, cv2.COLOR_BGR2YCrCb),  # Approximation in OpenCV
        'YCbCr': cv2.cvtColor(image, cv2.COLOR_BGR2YCrCb)
    }
    return images

def preprocess_image(image):
    """Apply median filtering and unsharp masking."""
    # Median filtering
    median_filtered = cv2.medianBlur(image, 5)
    # Unsharp masking
    gaussian = cv2.GaussianBlur(median_filtered, (9, 9), 10.0)
    unsharp_image = cv2.addWeighted(median_filtered, 1.5, gaussian, -0.5, 0)
    return unsharp_image

def initialize_pheromones(image_shape):
    """Initialize pheromones to a small constant value."""
    return np.full(image_shape[:2], 0.01)

def simulate_aco(image, pheromones, iterations=50):
    """Simulate Ant Colony Optimization."""
    for _ in range(iterations):
        # Placeholder: Use gradient intensity as a heuristic
        gradient = cv2.Canny(image.astype(np.uint8), 100, 200) / 255.0
        pheromones += gradient * 0.1  # Update pheromones based on gradient
        pheromones *= 0.9  # Apply evaporation
    return pheromones

def threshold_pheromones(pheromones, threshold=0.3):
    """Threshold pheromones to extract edges."""
    return (pheromones > threshold).astype(np.uint8) * 255

def post_process_edges(edges):
    """Apply morphological operations to clean edges."""
    kernel = np.ones((5, 5), np.uint8)
    processed_edges = cv2.morphologyEx(edges, cv2.MORPH_CLOSE, kernel)
    return processed_edges

def calculate_iqa_metrics(original, edge_detected):
    """Calculate Image Quality Assessment (IQA) metrics."""
    psnr_value = psnr(original, edge_detected)
    mse_value = mse(original, edge_detected)
    return psnr_value, mse_value

def plot_results(images, titles):
    """Plot multiple images with titles."""
    plt.figure(figsize=(15, 10))
    for i, (img, title) in enumerate(zip(images, titles)):
        plt.subplot(1, len(images), i+1)
        plt.imshow(img, cmap='gray' if len(img.shape) == 2 else None)
        plt.title(title)
        plt.axis('off')
    plt.show()

# Main pipeline
image_path = 'fruits.jpg'  # Replace with your image path
color_images = load_and_convert_image(image_path)

# Process each color space
results = {}
for color_space, image in color_images.items():
    print(f"Processing {color_space} color space...")
    preprocessed = preprocess_image(image)
    pheromones = initialize_pheromones(preprocessed.shape)
    pheromones = simulate_aco(preprocessed, pheromones)
    edges = threshold_pheromones(pheromones)
    post_processed = post_process_edges(edges)

    # Calculate IQA metrics (PSNR and MSE with original grayscale version)
    original_gray = cv2.cvtColor(cv2.imread(image_path), cv2.COLOR_BGR2GRAY)
    psnr_value, mse_value = calculate_iqa_metrics(original_gray, post_processed)

    # Store results for display
    results[color_space] = {
        'Original': image,
        'Preprocessed': preprocessed,
        'Edges': edges,
        'Post-Processed Edges': post_processed,
        'PSNR': psnr_value,
        'MSE': mse_value
    }

# Display results
for color_space, res in results.items():
    print(f"\n{color_space} Metrics:")
    print(f"PSNR: {res['PSNR']:.2f}, MSE: {res['MSE']:.2f}")
    plot_results(
        [res['Original'], res['Preprocessed'], res['Edges'], res['Post-Processed Edges']],
        [f"{color_space} Original", f"{color_space} Preprocessed",
         f"{color_space} Edges", f"{color_space} Post-Processed Edges"]
    )
