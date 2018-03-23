
% %https://www.mathworks.com/examples/signal/mw/signal-ex08634157-power-spectral-density-estimates-using-fft

Fs = s.Rate;

hpf = designfilt('highpassiir',...
    'FilterOrder', 20,...
    'PassbandFrequency', 3,...
    'StopbandAttenuation', 20,...
    'PassbandRipple', 1.5,...
    'SampleRate', Fs);

Xdata = filtfilt(hpf,data(:,1));
Ydata = filtfilt(hpf,data(:,2));
Zdata = filtfilt(hpf,data(:,3));

figure(2)
[pxx,fx] = pwelch(Xdata,500,300,500,s.Rate);
[pxy,fy] = pwelch(Ydata,500,300,500,s.Rate);
[pxz,fz] = pwelch(Zdata,500,300,500,s.Rate);
plot(fx,pow2db(pxx));
hold on
plot(fy,pow2db(pxy));
plot(fz,pow2db(pxz));
% [pxx,fx] = pwelch(data(:,1),500,300,500,s.Rate);
% [pxy,fy] = pwelch(data(:,2),500,300,500,s.Rate);
% [pxz,fz] = pwelch(data(:,3),500,300,500,s.Rate);
% plot(fx,10*log10(pxx))
% hold on
% plot(fy,10*log10(pxy))
% plot(fz,10*log10(pxz))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

%%

Xf = fft(data(:,1));
Yf = fft(data(:,2));
Zf = fft(data(:,3));
L = length(data(:,1))

f = Fs*(0:(L/2))/L;

XP2 = abs(Xf/L);
XP1 = XP2(1:L/2+1);
XP1(2:end-1) = 2*XP1(2:end-1);

YP2 = abs(Yf/L);
YP1 = YP2(1:L/2+1);
YP1(2:end-1) = 2*YP1(2:end-1);

ZP2 = abs(Zf/L);
ZP1 = ZP2(1:L/2+1);
ZP1(2:end-1) = 2*ZP1(2:end-1);

figure(3)
plot(f,XP1)
hold on
plot(f,YP1)
plot(f,ZP1)
title('Single-Sided Amplitued Spectrum');
xlabel('f (Hz)');
ylabel('Magnitude');


