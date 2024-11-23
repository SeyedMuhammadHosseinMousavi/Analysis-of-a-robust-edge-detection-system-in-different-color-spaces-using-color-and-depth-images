# Analysis of a robust edge detection system in different color spaces using color and depth images

This repository contains the implementation of the **Analysis of a robust edge detection system in different color spaces using color and depth images** paper:

## 📄 Abstract

This project implements a robust edge detection pipeline using color and depth images. It employs preprocessing, Ant Colony Optimization (ACO)-based edge detection, post-processing, and evaluation using Image Quality Assessment (IQA) metrics. The pipeline supports multiple color spaces and evaluates performance under various noise conditions.
- Edge detection is a very important technique for revealing significant areas in the digital image, which could aid feature extraction techniques. In fact, it is possible to remove unnecessary parts from an image using edge detection. A lot of edge detection techniques have been made already, but we propose a robust evolutionary-based system to extract the vital parts of the image. The system is based on a lot of pre- and post-processing techniques, such as filters and morphological operations, and the application of a modified Ant Colony Optimization edge detection method to the image. The main goal is to test the system on different color spaces and calculate the system’s performance. Another novel aspect of the research is using depth images along with color ones, in which depth data is acquired by Kinect V.2 in the validation part, to understand the edge detection concept better in-depth data. The system is going to be tested with ten benchmark test images for color and five images for depth format and validated using 7 Image Quality Assessment factors such as Peak Signal-to-Noise Ratio, Mean Squared Error, Structural Similarity, and more (mostly related to edges) for prove, in different color spaces and compared with other famous edge detection methods in the same condition. Also, to evaluate the robustness of the system, some types of noises such as Gaussian, salt and pepper, Poisson, and speckle are added to images to show the proposed system's power in any condition. The goal is to reach the best edges possible and to do this; more computation is needed, which increases run time computation just a bit more. But with today’s systems, this time is decreased to a minimum, which is worth it to make such a system. Acquired results are so promising and satisfactory in comparison with other methods available in the validation section of the paper. 

## 🚀 Features

```
- Processes images in multiple color spaces: RGB, CIE Lab, YIQ, and YCbCr.
- Applies preprocessing techniques like median filtering and unsharp masking.
- Implements a simulated Ant Colony Optimization (ACO) algorithm for edge detection.
- Refines edge detection with post-processing (morphological operations).
- Evaluates results using IQA metrics such as PSNR and MSE.
- Visualizes all intermediate steps and final results.
```
![image](https://github.com/user-attachments/assets/f18225b2-b1b4-4cea-8a95-2426599c2dd1)

## 🖼️ Example Output
![image](https://github.com/user-attachments/assets/aef010e1-1007-42ec-96c4-e7f2b42cebcc)
![image](https://github.com/user-attachments/assets/fd40a0f2-5a3f-4bbb-b374-c5242818fa4b)



## 📊 IQA Metrics

```
The implementation evaluates edge detection performance using:
- Edge Based Structural Similarity (ESSIM): Evaluates structural similarity based on edge features using Sobel filters and histogram edge direction analysis.

- Peak Signal-to-Noise Ratio (PSNR): Measures the ratio of signal power to noise power, indicating the preservation of edge data.

- Mean Squared Error (MSE): Quantifies the cumulative squared error between the original and processed images, with smaller values indicating better quality.

- Enhancement Measure (EME): Assesses image contrast improvement using block-based calculations inspired by Weber’s Law.

- Edge Based Image Quality Assessment (EBIQA): Focuses on the perception of edges by comparing edge information between reference and processed images.

- Non-Shift Edge Based Ratio (NSER): Measures edge agreement across images using zero-crossings and Gaussian kernels for improved accuracy.

- Gradient Conduction Mean Squared Error (GCMSE): Combines pixel distances and gradients to provide a gradient-aware error evaluation.
```

## 📜 Citation

```
If you use this implementation, please cite the original paper:
" Mousavi, Seyed Muhammad Hossein, Vyacheslav Lyashenko, and Surya Prasath. "Analysis of a robust edge detection system in different color spaces using color and depth images." Компьютерная оптика 43.4 (2019)."
```
![image](https://github.com/user-attachments/assets/be7c87e1-f0c5-4204-a001-23cc16eef18e)

- ### Please Cite:
 Mousavi, Seyed Muhammad Hossein, Vyacheslav Lyashenko, and Surya Prasath. "Analysis of a robust edge detection system in different color spaces using color and depth images." Компьютерная оптика 43.4 (2019).

