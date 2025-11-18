% --- 1. Define Simulation Parameters ---
N = 970;            % Number of bits to simulate
Rb = 1000;         % Bit rate (bits per second)
Tb = 1/Rb;         % Bit duration (time for one bit)

% --- 2. Generate the Random Bits (The Information) ---
% Use randi to get 0s and 1s
bits = randi([0, 1], 1, N);

% --- 3. Create the Signal Waveform ---
% We need to make the plot clear. Let's use 100 samples
% to represent each bit in the plot.
samples_per_bit = 100;

% 'repelem' repeats each element. This "stretches" each bit
% to last for 100 samples.
% Example: [0 1] becomes [0 0...0 1 1...1]
signal_waveform = repelem(bits, samples_per_bit);

% --- 4. Create the Time Vector ---
% The total sampling frequency (samples per second)
Fs = Rb * samples_per_bit; 
total_samples = N * samples_per_bit;

% Create a time vector 't' that goes from 0 up to
% the total time, with one time point for each sample.
t = (0 : total_samples - 1) / Fs;% 100000/50

% --- 5. Plot the Result ---
plot(t, signal_waveform, 'LineWidth', 2); % Plot with a thick line
grid on;
ylim([-0.5, 1.5]);  % Set Y-axis limits to see 0 and 1 clearly
xlabel('Time (s)');
ylabel('Amplitude (Voltage)');
title('Simulated Digital Information Signal (NRZ)');