%%
save_path = '.\Data\';
Record_Time =120; %% two minutes

%% Palm / Wrist / Finger / FingerNoPad // WristNoPad / PalmNoPad
type = 'Wrist';
userNumber = 12;
file_name = ['USER',num2str(userNumber),'-',type];


s.DurationInSeconds = Record_Time;

run=0;
run=run+1;

[data,time] = s.startForeground();

save(strcat(save_path,file_name),'time','data');

figure(1+run);
clf(1+run);
plot(time,data(:,1:3))
grid on;
xlabel('Time (sec)');
ylabel('g');
title(sprintf('%s %d','RUN',run))
s.release();

