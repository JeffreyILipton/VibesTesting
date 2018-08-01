%%
save_path = '.\Data\';
Record_Time =120; %% two minutes

%% Palm / Wrist / Finger / FingerNoPad // WristNoPad / PalmNoPad
type = 'palm';
userNumber = 13;
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

%%
%csvwrite(filename,data);

%accel = data(:,1);

%%
% 
% % %%
% hpf = designfilt('highpassiir',...
%     'FilterOrder', 20,...
%     'PassbandFrequency', 10,...
%     'StopbandAttenuation', 40,...
%     'PassbandRipple', 1.5,...
%     'SampleRate', Fs);
% % Xdata = filtfilt(hpf,data(:,1));
% % y = detrend(data(:,1),'constant');
% % plot(y);
% % hold on
% % plot(data(:,1))
% % plot(Xdata)
% 
% 
% Xdata = filtfilt(hpf,data(:,1));
% Ydata = filtfilt(hpf,data(:,2));
% Zdata = filtfilt(hpf,data(:,3));
% %%
% figure(1)
% FLimit = 20000;
% 
% [pxx,fx] = pwelch(Xdata,[],[],[],Fs,'power');
% [pxy,fy] = pwelch(Ydata,[],[],[],Fs,'power');
% [pxz,fz] = pwelch(Zdata,[],[],[],Fs,'power');
% plot(fx(1:FLimit),pow2db(pxx(1:FLimit)),'DisplayName',sprintf('%s_%d','x',run));
% hold on
% plot(fy(1:FLimit),pow2db(pxy(1:FLimit)),'DisplayName',sprintf('%s_%d','y',run));
% plot(fz(1:FLimit),pow2db(pxz(1:FLimit)),'DisplayName',sprintf('%s_%d','z',run));
% % [pxx,fx] = pwelch(data(:,1),500,300,500,s.Rate);
% % [pxy,fy] = pwelch(data(:,2),500,300,500,s.Rate);
% % [pxz,fz] = pwelch(data(:,3),500,300,500,s.Rate);
% % plot(fx,10*log10(pxx))
% % hold on
% % plot(fy,10*log10(pxy))
% % plot(fz,10*log10(pxz))
% xlabel('Frequency (Hz)')
% ylabel('PSD (dB)')
% legend('show')
% title('power spectral density')
% 
% %%
% 
