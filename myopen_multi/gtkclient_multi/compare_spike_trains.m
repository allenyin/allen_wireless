% Taken from Distance3.m, from
% http://people.ece.cornell.edu/land/PROJECTS/SpikeTrainAnalysis/index.html
function compare_spike_trains(tSpike1, tSpike2)

tmax = max([max(tSpike1),max(tSpike2)]);

%Compute the distances at different time scales
for s=1:16
    TimeScale(s) = .001 * 1.5^(s-1);
    
    %calc J.Victor distance
    cost = 1/TimeScale(s) ; %per Sec
    dVictor(s) = spkd(tSpike1,tSpike2,cost) ;
    
    %calc vanRossum dist
    %make dt depend on timescale
    tc = TimeScale(s) ; % Sec
    dt = tc/100 ;
    tk = 0:dt:2.5*tc;
    t = 0:dt:tmax;
    
    spiketrain1 = zeros(size(t));
    spiketrain2 = zeros(size(t));
    spiketrain1(fix(tSpike1/dt)) = 1;
    spiketrain2(fix(tSpike2/dt)) = 1;
    
    ekernel = exp(-tk/tc);
    cSpike1 = conv(ekernel,spiketrain1);
    cSpike2 = conv(ekernel,spiketrain2);
    dRossum(s) =  2*dt/tc * sum((cSpike1-cSpike2).^2) ;
end

figure;
semilogx(TimeScale,dVictor)
hold on
semilogx(TimeScale,dRossum,'r')
xlabel('Time scale (sec)')
ylabel('Distance')
legend('Victor Dist','Rossum Dist')

end