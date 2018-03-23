%run this to prepare instruments 
clear
%%
Fs = 48000;
vrange = 10;
%%
devices = daq.getDevices
devices(2)
%%
% Connect to NI DAQ card
s = daq.createSession('ni'); %create a new session
%ch = addAnalogInputChannel(s,'Dev1', 0, 'Voltage'); %add the 0 channel
%sub = ch.Device.Subsystems; %create subsystems event to show ranges avail

s.Rate=Fs;
s.DurationInSeconds=5;

%%
ch = addAnalogInputChannel(s,'Dev1', 'ai0', 'Voltage');
sub = ch.Device.Subsystems; %create subsystems event to show ranges avail

ch.Range = [-vrange,vrange];
%%
tc = s.Channels(1)
%tc.Sensitivity = 49.3/1000;
set(tc)

%%

a = arduino();
