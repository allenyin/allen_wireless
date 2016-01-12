function spectrum = plot_fft(X, Fs)
%   Inputs:
%       - X is the input vector
%       - Fs is the sampling frequency, in Hz, usually 1MHz/32=31250Hz
% 
%   Output:
%       - spectrum: first column is frequency,
%                   second column is the single-sided fft amplitude P1.
%
%   Also print out the n largest frequency contents

L = numel(X);  % length of signal
T = 1/Fs;           % time between samples, in seconds
t = (0:L-1)*T;      % time vector

Y = fft(X);

% Compute the two-sided spectrum P2.
P2 = abs(Y/L);
% Compute the single-sided spectrum P1 based on P2 and 
% even-valued signal length L
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% Define frequency domain f and plot the single-sided amplitude
% spectrum P1
f = Fs*(0:(L/2))/L;
figure;
plot(f, P1);
xlabel('f (Hz)');
ylabel('|P1(f)|');

spectrum = [f.', P1.'];

