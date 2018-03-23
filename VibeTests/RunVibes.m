%%
save_path = '.\Data\';
file_name = 'test1'
Record_Time = 5;
s.DurationInSeconds = Record_Time;

figure(1);
clf(1);
[data,time] = s.startForeground();
plot(time,data(:,1:3))
grid on;
xlabel('Time (sec)');
ylabel('g');
s.release();

%csvwrite(filename,data);
save(strcat(save_path,file_name),'time','data');
accel = data(:,1);
