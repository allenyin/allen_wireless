close all;
clear;
clc;

% design butterworth filter, and derive coefficients for
% the cascade of direct-form I biquads
% See http://allenyin.github.io/reading_list/2016/01/DirectFormI-IIR-butterworth-filters

fs = 31250;
% 8th order butterworth bandpass filter
% B and A in descending order of z
[B,A] = butter(4, [1000,9000]/(fs/2), 'bandpass');

% Factor the numerator and denominator.
% First get the roots of num and den: for roots
rB = roots(B);
rA = roots(A);

% get the polynomials for each biquad, each from two (conjugate) roots
pB1 = abs(poly(rB(1:2)));    % num
pA1 = abs(poly(rA(1:2)));    % den

pB2 = abs(poly(rB(3:4)));
pA2 = abs(poly(rA(3:4)));

pB3 = abs(poly(rB(5:6)));
pA3 = abs(poly(rA(5:6)));

pB4 = abs(poly(rB(7:8)));
pA4 = abs(poly(rA(7:8)));

final_num = conv(conv(pB1,pB2),conv(pB3,pB4));
final_den = conv(conv(pA1,pA2),conv(pA3,pA4));
fvtool(final_num, final_den);   % plot resulting biquad cascade behavior

% convert to fixed point coefficients (Q1.14)
% b1(1) and a1(1) are the highest-order terms.
b1 = round(pB1*2^14);
a1 = round(pA1*2^14)*-1;

b2 = round(pB2*2^14);
a2 = round(pA2*2^14)*-1;

b3 = round(pB3*2^14);
a3 = round(pA3*2^14)*-1;

b4 = round(pB4*2^14);
a4 = round(pA4*2^14)*-1;

% % test performance of resulting biquads
% final_num = conv(b1./2^14, b2./2^14);
% final_den = conv(a1./2^14, a2./2^14);
% [h,w] = freqz(final_num, final_den, 'whole', 2001);
% figure;
% plot(w/pi, 20*log10(abs(h)));
% xlabel('x\pi rad/sample');
% 
% fvtool(final_num, final_den);
% 
% % Give gain to biquads?
% g = 1.1;
% b1_scaled = g.*b1;
% b2_scaled = g.*b2;
% % clamp the values to 2^15
% for i=1:numel(b1_scaled),
%     if b1_scaled(i) < -32768,
%         b1_scaled(i) = -32768;
%     end
%     if b1_scaled(i) > 32767,
%         b1_scaled(i) = 32767;
%     end
%     if b2_scaled(i) < -32768,
%         b2_scaled(i) = -32768;
%     end
%     if b2_scaled(i) > 32767,
%         b2_scaled(i) = 32767;
%     end
% end
% 
% final_num_scaled = conv(b1_scaled./2^14, b2_scaled./2^14);
% fvtool(final_num_scaled, final_den);
