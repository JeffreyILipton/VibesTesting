function run = FuncAnalyzeVibes(run,name)
S = load(['.\Data\',name,'.mat']);
data = S.data;
time = S.time;
Fs = 102400.0;

figure(2*run+1);
plot(time,data(:,1:3))
grid on;
xlabel('Time (sec)');
ylabel('g');
title(name);

%%
hpf = designfilt('highpassiir',...
    'FilterOrder', 20,...
    'PassbandFrequency', 10,...
    'StopbandAttenuation', 40,...
    'PassbandRipple', 1.5,...
    'SampleRate', Fs);
% Xdata = filtfilt(hpf,data(:,1));
% y = detrend(data(:,1),'constant');
% plot(y);
% hold on
% plot(data(:,1))
% plot(Xdata)


Xdata = filtfilt(hpf,data(:,1));
Ydata = filtfilt(hpf,data(:,2));
Zdata = filtfilt(hpf,data(:,3));
%%
figure(2*run+2)
FLimit = Fs/2;
%FLimit = 20000;

[pxx,fx] = pwelch(Xdata,[],[],[],Fs,'power');
[pxy,fy] = pwelch(Ydata,[],[],[],Fs,'power');
[pxz,fz] = pwelch(Zdata,[],[],[],Fs,'power');
plot(fx(1:FLimit),pow2db(pxx(1:FLimit)));
hold on
plot(fy(1:FLimit),pow2db(pxy(1:FLimit)));
plot(fz(1:FLimit),pow2db(pxz(1:FLimit)));
% [pxx,fx] = pwelch(data(:,1),500,300,500,s.Rate);
% [pxy,fy] = pwelch(data(:,2),500,300,500,s.Rate);
% [pxz,fz] = pwelch(data(:,3),500,300,500,s.Rate);
% plot(fx,10*log10(pxx))
% hold on
% plot(fy,10*log10(pxy))
% plot(fz,10*log10(pxz))
xlabel('Frequency (Hz)')
ylabel('PSD (dB)')
title([name,'-PSD']);

%%

% Xf = fft(Xdata);
% Yf = fft(Ydata);
% Zf = fft(Zdata);
% L = length(Ydata);
% 
% f = Fs*(0:(L/2))/L;
% 
% XP2 = abs(Xf/L);
% XP1 = XP2(1:L/2+1);
% XP1(2:end-1) = 2*XP1(2:end-1);
% 
% YP2 = abs(Yf/L);
% YP1 = YP2(1:L/2+1);
% YP1(2:end-1) = 2*YP1(2:end-1);
% 
% ZP2 = abs(Zf/L);
% ZP1 = ZP2(1:L/2+1);
% ZP1(2:end-1) = 2*ZP1(2:end-1);

% figure(3*run+3)
% plot(f(1:FLimit),XP1(1:FLimit))
% hold on
% plot(f(1:FLimit),YP1(1:FLimit))
% plot(f(1:FLimit),ZP1(1:FLimit))
% title('Single-Sided Amplitued Spectrum');
% xlabel('f (Hz)');
% ylabel('Magnitude');
run = run+1;
end
