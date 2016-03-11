function [channels] = plot_raw_channels(fname, varargin)
% fname: name of the .nlg file output from convert
% outputs the 4 raw waveforms, and plots them.
% 
% channels: Each row is for a different channel
% 
% Only works for small amount of data...limited by RAM

fileID = fopen(fname);
data = fread(fileID);   % may overflow if data too big
fclose(fileID);
for i=1:numel(data),
    if data(i) > 127,
        data(i) = (256-data(i))*(-1);
    end
end

vectorLen = numel(data)/4;
channels = zeros(4, vectorLen);

% The data array is written according to the format:
%       ch# | sample#
%       1   | 1
%       2   | 1
%       3   | 1
%       4   | 1
%       1   | 2
%       2   | 2
%       3   | 2
%       4   | 2
%       ... | ...  
%       1   | 6
%       2   | 6
%       3   | 6
%       4   | 6
%       ... | ...

doplot = true;
if nargin > 1,
    if ischar(varargin{1}) && strcmpi(varargin{1}, 'noplot'),
        doplot = false;
    end
end

if doplot
    figure;
end

for i=1:4,
    channels(i,:) = data(i:4:numel(data));
    if doplot,
        subplot(4,1,i)
        plot(channels(i,:));
    end
end

end
