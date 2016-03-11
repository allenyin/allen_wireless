% Read the spike file and analog waveforms recorded from Plexon,
% and compare them against reference signals
clear;
close all;

load('reference_signal.mat');
load('validation_test1_plexon_analog.mat');
load('validation_test1_plexon_spkwav.mat');

% Signal Fs is 31250Hz
Fs = 31250;

% Time vector for generated signal
sTime = 1:numel(signals);
sTime = (sTime-1)./Fs;

% Plexon analog waveform is sampled with 20,000Hz.
Fplex = 20000;

% Time vector for measured waveform.
plexTime = 1:numel(AD12);
plexTime = (plexTime-1)./Fplex;

% Interpolate analog signal to same time scale as generated signal for comparison
AD12_q = interp1(plexTime, AD12, plexTime(1):1/Fs:plexTime(end));

figure;
plot(signals); hold on;
plot(AD12_q, 'r'); ylim([-1.4,1.4]);
title('Original signal, Plexon measured signal');

% Find shift between original and measured signal
% In acquisition, audio always started after recording starts, so lagDiff<0
[acor, lag] = xcorr(signals, AD12_q);
[~,I] = max(abs(acor));
lagDiff = lag(I);
figure;
plot(signals); hold on;
plot(AD12_q(-lagDiff:end), 'r');
ylim([-1.4,1.4]);
title('Aligned original vs measured signal');

%% Compare measured spike train vs original spike timings
nPlot = 1000;                                           % Number of spikes to plot and compare
plexSpikes = sig001a + lagDiff/Fs;                      % shift spike timing to align with generated signal
plexSpikes = [plexSpikes, ones(rows(plexSpikes),1)];    % Can be used in stem plot
sSpikes = [target.targettimes.', ones(numel(target.targettimes),1)];    % original spike timing

figure;
stem(sSpikes(1:nPlot,1), sSpikes(1:nPlot,2)); hold on;
stem(plexSpikes(1:nPlot,1), plexSpikes(1:nPlot,2), 'r'); ylim([0,1.2]);
title('First 1000 spikes');

compare_spike_trains(sSpikes(1:nPlot,1), plexSpikes(1:nPlot,1));

%% Plot inter-spike interval distributions
d_sSpikes = diff(sSpikes(:,1));         % all interspike intervals
u_sSpikes = unique(d_sSpikes);          % unique interspike intervals
figure; bar(u_sSpikes, histc(d_sSpikes, u_sSpikes));
title('Original signal inter-spike interval'); xlabel('interval (s)');

d_plexSpikes = diff(plexSpikes(:,1));
u_plexSpikes = unique(d_plexSpikes);
figure; bar(u_plexSpikes, histc(d_plexSpikes, u_plexSpikes));
title('Measured signal inter-spike intervals'); xlabel('interval (s)');

