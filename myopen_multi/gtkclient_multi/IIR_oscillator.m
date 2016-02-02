% IIR oscillator
Fs = 31250;     % sampling frequency

% To get oscillator of frequency f, do:
% set b0=0, b1=0, a1=-1, and a0=2-fp
fp = 0.035;
omega = angle((2-fp+sqrt(fp^2-4*fp))/2); % in rad/sample
f = omega * Fs/(2*pi);  % convert to Hz

% But a0 is fixed-point number, convert fp:
fp_fixed = round(fp*2^14);

% coefficients
b0 = 0;
b1 = 0;
a0 = (2^15-fp_fixed)/2^14;
a1 = -1;

y = [0.5, 0.5];       % y[n-1]=0.5, y[n-2]=0.5
x = rand(1,1002)*2;   % 1000 random values, including x[n-1] and x[n-2]

for i=3:numel(x),
    val = b0*x(i) + b1*x(i-1) + b0*x(i-2) + a0*y(i-1) + a1*y(i-2);
    y = [y, val];
end

plot_fft(y, 31250);
