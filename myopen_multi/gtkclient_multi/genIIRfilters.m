%% Script to generate coefficients for RHD's two-stage Direct-Form I IIR biquad
%  bandpass filter. Set the fc_LPF and fc_HPF cutoff frequency.
% See http://allenyin.github.io/reading_list/2016/01/DirectFormI-IIR-butterworth-filters

close all;
% Convertinf from (pi rad/sample) to frequency:
% w/2*fs

fs = 31250;   % sampling frequency
% 2nd order butterworth LPF, cutoff at fc_LPF
fc_LPF = 9000 ; % Hz
wn_LPF = (fc_LPF/fs)*2;  % normalized cutoff frequency (units=pi rad/sample)
[b_LPF, a_LPF] = butter(2, wn_LPF, 'low');  % descending powers of z, const first
figure;
title('2nd order LPF');
freqz(b_LPF, a_LPF);

% 2nd order butterworth HPF, cutoff fc_HPF
fc_HPF = 250;   % Hz
wn_HPF = (fc_HPF/fs)*2;
[b_HPF, a_HPF] = butter(2, wn_HPF, 'high');
figure;
title('2nd order HPF');
freqz(b_HPF, a_HPF);

% plot freq-response of bandpass filter
fvtool(conv(b_LPF,b_HPF), conv(a_LPF, a_HPF));

% convert them to fixed-point form
b_LPF_DSP = round(b_LPF*2^14);      % result is [b0,b1,b0];
a_LPF_DSP = round(a_LPF*2^14)*-1;   % result is [dont-care, a0, a1]

b_HPF_DSP = round(b_HPF*2^14);      % result is [b0,b1,b0];
a_HPF_DSP = round(a_HPF*2^14)*-1;   % result is [dont-care, a0, a1];

%---------- Coefficients for RHA's 4-biquad filter [500-6.7kHz]----------------
% [b0, b1, a0, a1]
coefs1 = [7895, 15785, 5293, -7479]./2^15;
coefs2 = [15342, -30687, 31397, -15172]./2^15;
coefs3 = [7892, 15782, 3824, -854]./2^15;
coefs4 = [15342, -30681, 29836, -13603]./2^15;

% coefs in descending powers of z
coefs = [coefs1; coefs2; coefs3; coefs4];
% num as b1,b1,b0
num = [coefs(:,2), coefs(:,2), coefs(:,1)];
% den as 1, -a0, -a1
den = [ones(4,1), -coefs(:,3), -coefs(:,4)];

final_num = conv(conv(conv(num(1,:), num(2,:)), num(3,:)),num(4,:));
final_den = conv(conv(conv(den(1,:), den(2,:)), den(3,:)),den(4,:));
% final_num = conv(num(3,:), num(4,:));
% final_den = conv(den(3,:), den(4,:));
% fvtool(final_num, final_den);


% num = [2*b0, 2*b1, 2*b0];
% den = [1, -2*a0, -2*a1];
% 
% [h,w] = freqz(final_num, final_den, 'whole', 2001);
% figure;
% plot(w/pi, 20*log10(abs(h)));
% xlabel('x\pi rad/sample');

% 
% sos=[coefs(:,1:2), coefs(:,1), ones(4,1), -coefs(:,3:4)]
% fvtool(sos);
