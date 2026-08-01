# Audio Noise Reduction Using IIR Butterworth Low-Pass Filter

A MATLAB-based Digital Signal Processing (DSP) project that demonstrates audio noise reduction using a **6th-order IIR Butterworth Low-Pass Filter**. The project adds Gaussian white noise to an input audio signal, applies zero-phase filtering, and evaluates filter performance using Signal-to-Noise Ratio (SNR), Mean Squared Error (MSE), and Peak Signal-to-Noise Ratio (PSNR). It also includes waveform visualization, frequency response analysis, pole-zero stability verification, and filtered audio export.

## Features

- Load and process mono or stereo audio files
- Add Gaussian white noise to an audio signal
- Design a 6th-order IIR Butterworth Low-Pass Filter
- Apply zero-phase filtering
- Compare original, noisy, and filtered signals
- Visualize time-domain waveforms
- Analyze filter frequency response
- Generate pole-zero plots for stability analysis
- Calculate SNR, MSE, and PSNR
- Export the filtered audio as a `.wav` file

## Technologies Used

- MATLAB
- Signal Processing Toolbox
- Digital Signal Processing (DSP)
- IIR Butterworth Low-Pass Filter

## Project Structure

```text
├── IIR_Filter_project.m                 # Main MATLAB script
├── input.wav                 # Input audio file
├── filtered_output.wav       # Generated filtered audio
└── README.md
```

## How to Run

1. Open the project in MATLAB.
2. Place `input.wav` in the project directory.
3. Run `IIR_Filter_project.m`.
4. The script will:
   - Play the original, noisy, and filtered audio
   - Display waveform, frequency response, and pole-zero plots
   - Calculate SNR, MSE, and PSNR
   - Save the filtered audio as `filtered_output.wav`

## Learning Outcomes

This project demonstrates the practical implementation of an IIR Butterworth Low-Pass Filter for audio denoising while evaluating filter performance and stability using standard DSP metrics.
