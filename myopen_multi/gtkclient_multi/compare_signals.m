% Generate neural signals with:
% [signals, target, r1]= generatenoisysamples('Duration', 100, 'SampleRate',31250,
%                                             'N_Targets',2, 'RefractoryPeriod', 0.002)
% audiowrite('../validation/fname.wav', signals(1:Fs*100), Fs);
% 2/9/2016 - Made changes to generatenoisysamples, line 546 on how noisysignal is generated

close all;
clear;
Fs = 31250; % sampling frequency is 31250Hz

% Script to compare recorded RHD signals against reference signals.
% Each signal is 100 seconds long. That means a total of Fs*100 samples

load('reference_signal.mat');   % r1, signals, target

% find spike timing
spike_timing = target.targettimes;

% load headstage samples
RHD_samples = plot_raw_channels('RHDspikes_1neuron.nlg', 'noplot');
%RHA_samples = plot_raw_channels('RHAspikes_1neuron.nlg', 'noplot');

% normalize first channel to within -1 and 1, use setlimits() from the signal-generator package
RHD_norm_samples = setlimits(RHD_samples(1,:),-1,1);
%RHA_norm_samples = setlimits(RHA_samples(1,:),-1,1);

figure;
plot(signals); hold on;
plot(RHD_norm_samples, 'r'); ylim([-1.3,1.3]);
%plot(RHA_norm_samples, 'r'); ylim([-1.3,1.3]);
title('Original signal vs measured signal');

% analyze xcorrelation for different length of time from the beginning?
[acor,lag] = xcorr(signals, RHD_norm_samples);
%[acor,lag] = xcorr(signals, RHA_norm_samples);
[~,I] = max(abs(acor));
lagDiff = lag(I);
figure;
plot(signals); hold on;
plot(RHD_norm_samples(-lagDiff:-lagDiff+numel(signals)-1), 'r');
%plot(RHA_norm_samples(-lagDiff:-lagDiff+numel(signals)-1), 'r');
ylim([-1.3,1.3]);
title('Aligned original vs measured signal');


%% Check the spike timings.
sSpikes = [target.targettimes.', ones(numel(target.targettimes),1)];    % signal spike timing

load('RHDspikes_1neuron.mat');
%load('RHAspikes_1neuron.mat');
f_timer = 9155.273438;  % mstimer increments by 1 with 9155.273438Hz, see ./convert

db_mstimer = double(mstimer);   % convert from uint32 to double
db_ts = double(spike_ts);       % convert from uint32 to double

mSpikes = (db_mstimer(db_ts) - db_mstimer(1))./f_timer + lagDiff/Fs;    % align the measured spikes
mSpikes = [mSpikes, ones(numel(mSpikes),1)];

nPlot = 1000;
figure; 
stem(sSpikes(1:nPlot,1), sSpikes(1:nPlot,2)); hold on;
stem(mSpikes(1:nPlot,1), mSpikes(1:nPlot,2), 'r'); ylim([0, 1.2]);
title('First 1000 spikes');

compare_spike_trains(sSpikes(1:nPlot,1), mSpikes(1:nPlot,1));

%% Plot inter-spike interval distributions
d_sSpikes = diff(sSpikes(:,1));         % all interspike intervals
u_sSpikes = unique(d_sSpikes);          % unique interspike intervals
figure; bar(u_sSpikes, histc(d_sSpikes, u_sSpikes));
title('Original signal inter-spike interval'); xlabel('interval (s)');

d_mSpikes = diff(mSpikes(:,1));
u_mSpikes = unique(d_mSpikes);
figure; bar(u_mSpikes, histc(d_mSpikes, u_mSpikes));
title('Measured signal inter-spike intervals'); xlabel('interval (s)');




