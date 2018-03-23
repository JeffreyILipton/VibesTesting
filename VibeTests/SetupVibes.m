%run this to prepare instruments 
clear
Fs = 102400.0;
%%
devices = daq.getDevices
devices(1)
%%
% Connect to NI DAQ card
s = daq.createSession('ni'); %create a new session
%ch = addAnalogInputChannel(s,'Dev1', 0, 'Voltage'); %add the 0 channel
%sub = ch.Device.Subsystems; %create subsystems event to show ranges avail

s.Rate=Fs;
s.DurationInSeconds=5;

%%
ch1 = addAnalogInputChannel(s,'cDAQ1Mod1','ai0','Accelerometer')
sub1 = ch1.Device.Subsystems; %create subsystems event to show ranges avail
%%
tc1 = s.Channels(1);
tc1.Sensitivity = 49.3/1000;
set(tc1)
%%
ch2 = addAnalogInputChannel(s,'cDAQ1Mod1','ai1','Accelerometer')
sub2 = ch2.Device.Subsystems; %create subsystems event to show ranges avail
tc2 = s.Channels(2);
tc2.Sensitivity = 49.5/1000;
set(tc2)
%%
ch3 = addAnalogInputChannel(s,'cDAQ1Mod1','ai2','Accelerometer')
sub3 = ch3.Device.Subsystems; %create subsystems event to show ranges avail
tc3 = s.Channels(3);
tc3.Sensitivity = 48.9/1000;
set(tc3)


