close all;
clear;
Fs = 31250; % sampling frequency is 31250Hz

original = audioread('../validation/2spikes_noiseless_1s_31250.wav');
RHALMS = plot_raw_channels('RHALMS_spikes.nlg');
RHAnoLMS = plot_raw_channels('RHAnoLMS_spikes.nlg');
RHD = plot_raw_channels('RHD_spikes.nlg');

% normalize amplitude
original_norm = zeros(1, Fs);
RHALMS_norm = zeros(1, Fs);
RHAnoLMS_norm = zeros(1, Fs);
RHD_norm = zeros(1, Fs);

for i=1:Fs,
    if original(i)>0,
        original_norm(i) = original(i)/max(original);
    elseif original(i)<0,
        original_norm(i) = original(i)/abs(min(original));
    end

    if RHALMS(2,i)>0,
        RHALMS_norm(i) = RHALMS(2,i)/127;
    elseif RHALMS(i)<0,
        RHALMS_norm(i) = RHALMS(2,i)/128;
    end

    if RHAnoLMS(2,i)>0,
        RHAnoLMS_norm(i) = RHAnoLMS(2,i)/127;
    elseif RHAnoLMS(i)<0,
        RHAnoLMS_norm(i) = RHAnoLMS(2,i)/128;
    end

    if RHD(2,i)>0,
        RHD_norm(i) = RHD(2,i)/127;
    elseif RHD(i)<0,
        RHD_norm(i) = RHD(2,i)/128;
    end
end
    

% Plot 1 second of data
figure;
subplot(4,1,1); plot(original_norm); title('Original signal');
subplot(4,1,2); plot(RHALMS_norm); title('RHALMS');
subplot(4,1,3); plot(RHAnoLMS_norm); title('RHAnoLMS');
subplot(4,1,4); plot(RHD_norm); title('RHD');

% Plot fft of plotted channels.
original_spec = plot_fft(original_norm, Fs); title('Original signal');
RHALMS_spec = plot_fft(RHALMS_norm, Fs);  title('RHALMS');
RHAnoLMS_spec = plot_fft(RHAnoLMS_norm, Fs); title('RHAnoLMS');
RHD_spec = plot_fft(RHD_norm, Fs); title('RHD');
