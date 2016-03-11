%spike distance estimates
clear all

%make two trains
dt = .001;
tmax = 1;
t = 0:dt:tmax;
i = 1:length(t);

prob1 = .01;
prob2 = .06;

SpikeType = 8 ;

switch(SpikeType)
case 1
    %two poisson trains
    spiketrain1 = rand(size(t))<prob1;
    spiketrain2 = rand(size(t))<prob2;
case 2
    %identical trains
    spiketrain1 = (mod(i,100)==0 );
    spiketrain2 = spiketrain1;
case 3
    %offset trains
    spiketrain1 = (mod(i,100)==0 );
    spiketrain2 = (mod(i+5,100)==0 );
case 4
    %one extra spike trains
    spiketrain1 = (mod(i,100)==0 );
    spiketrain2 = spiketrain1;
    spiketrain2(250)=1;
case 5
    %one missing spike trains
    spiketrain1 = (mod(i,100)==0 );
    spiketrain2 = spiketrain1;
    spiketrain2(200)=0;
case 6
    %one moved spike trains
    spiketrain1 = (mod(i,100)==0 );
    spiketrain2 = spiketrain1;
    spiketrain2(200)=0;
    spiketrain2(250)=1;
case 7
    %dithered spike trains
    spiketrain1 = mod(i,150)==0 ;
    spiketrain2 = spiketrain1;
    iSpike2 = find(spiketrain2>0.5);
    iSpike2 = iSpike2 + fix(30*randn(size(iSpike2)));
    spiketrain2 = spiketrain2 * 0;
    spiketrain2(iSpike2) = 1;
case 8
    %dithered spike trains with one missing
    spiketrain1 = mod(i,150)==0 ;
    spiketrain2 = spiketrain1;
    spiketrain2(300) = 0;
    iSpike2 = find(spiketrain2>0.5);
    iSpike2 = iSpike2 + fix(30*randn(size(iSpike2)));
    spiketrain2 = spiketrain2 * 0;
    spiketrain2(iSpike2) = 1;
    
end

%compute times of spikes
tSpike1 = t(find(spiketrain1>0.5));
tSpike2 = t(find(spiketrain2>0.5));

%and plot the spikes
figure(1)
clf
pn=2;
subplot(pn,1,1)
plot(t,spiketrain1)
hold on
plot(t,spiketrain2-0.9,'r')
xlabel('Time (sec)');


%Compute the distances at different time scales
for s=1:18
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

subplot(pn,1,2)
semilogx(TimeScale,dVictor)
hold on
semilogx(TimeScale,dRossum,'r')
xlabel('Time scale (sec)')
ylabel('Distance')
legend('Victor Dist','Rossum Dist')


