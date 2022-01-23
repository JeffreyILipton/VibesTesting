%%
save_path = '.\Data\';
file_name = 'test1'
Record_Time = 1;
s.DurationInSeconds = Record_Time;

figure(1); 
clf(1);
[data,time] = s.startForeground();
data(:,1) ./ 46
data(:,2) ./ 46.2
data(:,3) ./ 49.7
plot(time,data(:,1:3))
grid on;
xlabel('Time (sec)');
ylabel('g');
s.release();

%csvwrite(filename,data);
save(strcat(save_path,file_name),'time','data');
accel = data(:,1);
