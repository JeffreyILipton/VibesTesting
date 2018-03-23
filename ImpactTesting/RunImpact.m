%%
release = 0;

Cal_time = 0.5;   %number of seconds of data to gather at start of test with which to zero out the offset of the sensor 
Record_Time = 1.5;    %# seconds of data to gather (after cal time)
Sensor_Sensitivity = 0.010; %sensor sensitivity in V/lb

save_path = '.\Data\';
file_name = 'Direct2';
%%
writeDigitalPin(a,'D6',~release)
%%
%do cal
s.DurationInSeconds = Cal_time;
figure(1);

slope = 1;

while abs(slope) > 0.001
    [cal_volts,cal_time] = s.startForeground;
    cal_coeffs = polyfit(cal_time, cal_volts, 1);

    clf(1);
    plot(cal_time,cal_volts)
    slope = cal_coeffs(1);
    if abs(slope) > 0.001
        pause(0.5);
    end
end
disp("Calibrated")
offset = mean(cal_volts);
%%
writeDigitalPin(a,'D6',release)

s.DurationInSeconds = Record_Time;
[volts,time] = s.startForeground();

lbs=(volts-offset)/Sensor_Sensitivity;
clf(1);
plot(time,lbs)
grid on;
xlabel('Time (sec)');
ylabel('lbs');
s.release();

%%
writeDigitalPin(a,'D6',~release)
disp("Done")
%%
%csvwrite(filename,data);
save(strcat(save_path,file_name),'time','lbs');
