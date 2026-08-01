clc;
clear;
close all;

%% Step 1: Load Audio File
[x, fs] = audioread('input.wav');

% Convert stereo to mono if necessary
if size(x,2) > 1
    x = mean(x,2);
end

t = (0:length(x)-1)/fs;

%% Step 2: Play Original Audio
disp('Playing Original Audio...');
sound(x, fs);
pause(length(x)/fs + 2);

%% Step 3: Add Gaussian Noise
noise_level = 0.10;        
noise = noise_level * randn(size(x));
x_noisy = x + noise;

%% Step 4: Play Noisy Audio
disp('Playing Noisy Audio...');
sound(x_noisy, fs);
pause(length(x)/fs + 2);

%% Step 5: Design IIR Butterworth Low-Pass Filter
fc = 4000;                        
order = 6;                       

Wn = fc/(fs/2);    

[b, a] = butter(order, Wn, 'low');

%% Step 6: Apply Filter (Zero-Phase Filtering)
y = filtfilt(b, a, x_noisy);

%% Step 7: Play Filtered Audio
disp('Playing Filtered Audio...');
sound(y, fs);

%% Step 8: Plot Time Domain Signals
figure;

subplot(4,1,1);
plot(t, x);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t, noise);
title('Added Gaussian Noise');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t, x_noisy);
title('Noisy Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,4);
plot(t, y);
title('Filtered Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Step 9: Frequency Response
figure;
freqz(b, a);
title('Frequency Response of Butterworth Low-Pass Filter');

%% Step 10: Pole-Zero Plot
figure;
zplane(b, a);
title('Pole-Zero Plot');

%% Step 11: Stability Check
poles = roots(a);

if all(abs(poles) < 1)
    disp('The IIR Butterworth Filter is STABLE');
else
    disp('The IIR Butterworth Filter is UNSTABLE');
end

%% Step 12: Calculate SNR

% Noise before filtering
noise_before = x_noisy - x;

% Remaining noise after filtering
noise_after = y - x;

% SNR values
snr_before = snr(x, noise_before);
snr_after  = snr(x, noise_after);

fprintf('\n');
fprintf('==============================\n');
fprintf('Signal-to-Noise Ratio (SNR)\n');
fprintf('==============================\n');
fprintf('SNR Before Filtering : %.2f dB\n', snr_before);
fprintf('SNR After Filtering  : %.2f dB\n', snr_after);

if snr_after > snr_before
    fprintf('\nFiltering Improved the SNR.\n');
else
    fprintf('\nFiltering Did NOT Improve the SNR.\n');
end

%% Step 13: Calculate Performance Metrics

mse = mean((x - y).^2);

signal_power = mean(x.^2);

psnr_value = 10 * log10(signal_power / mse);

fprintf('\n');
fprintf('Mean Squared Error (MSE) : %.6f\n', mse);
fprintf('Peak Signal-to-Noise Ratio (PSNR): %.2f dB\n', psnr_value);

%% Step 14: Save Filtered Audio
audiowrite('filtered_output.wav', y, fs);

disp('Filtered audio saved as "filtered_output.wav".');