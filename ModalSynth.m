% MUMT307 Winter 2022
% Final Project
% Deadline: April 22nd 2022
% Name: Jiali CHENG
% 
% A Matlab script to demonstrate modal synthesis, based on course materials
% from MUMT 307 at McGill University by Professor Gary P. Scavone.

clear all; close all; %clc

prompt = "The sound file to synthesize: ";

txt = input(prompt,"s");
fileLoc = 'sounds-original/';
ext = '.mp3';
if isempty(txt)
    s_original = strcat(fileLoc,'s1-G3',ext);
else
    s_original = strcat(fileLoc,txt,ext);
end

[y, fs] = audioread( s_original );

fs;                             % sampling rate = 44100 Hz
T = 1/fs;                       % sampling period
N = length(y);                  % number of samples in the sound file
Ttot = N./fs;                   % duration in seconds
t = 0: Ttot/N : Ttot-Ttot/N;    % time sequence

figure(1);
subplot(3, 2, 1)
plot( t, y, 'k' )
xlabel('Time (s)');
ylabel('Amplitude');
title('original sound file');
grid on

N = 2^14;                       % length of FFT 
dF = fs/N;                      % frequency resolution
iStart = 10^4;                  % starting sample of the FFT
sigIdx = iStart:N+iStart-1;     % index of the FFT
Y = fft(y(sigIdx));             % FFT

subplot(3, 2, 2)
f = (0:N-1)*fs/N;
plot(f, 20*log10(abs(Y)))
xlim([0 5000/2])
grid
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title('Frequency Spectrum');

%% find peaks of the spectrum using parabolic interpolation
% ref: https://ccrma.stanford.edu/~jos/sasp/Quadratic_Interpolation_Spectral_Peaks.html

Y = abs(Y(1:ceil(N/2))); % keep half of fft
Xi = [];
threshold = 10^(40/20);  % dB converted to linear value
for n = 2:length(Y)-2    % search for peak indices
  if Y(n+1) <= Y(n) && Y(n-1) < Y(n) && Y(n) > threshold
    Xi = [Xi, n];
  end
end

Yi = zeros( size( Xi ) );
for n = 1:length(Xi)
  alpha = Y(Xi(n)-1);
  beta = Y(Xi(n));
  gamma = Y(Xi(n)+1);
  Xii = 0.5 * (alpha - gamma) / (alpha - 2 * beta + gamma); 
  % interpolated bin value (-1/2 to +1/2)
  
  Yi(n) = beta - 0.25 * (alpha - gamma) * Xii; 
  % interpolated peak value
  
  if Xii > 0
    Xi(n) = f(Xi(n)) + Xii*(f(Xi(n)+1)-f(Xi(n))); % bin value in Hz
  else
    Xi(n) = f(Xi(n)) + Xii*(f(Xi(n))-f(Xi(n)-1)); % bin value in Hz
  end
end

K = length(Xi);
Xi = Xi(1:K);
Yi = Yi(1:K);

%% find -3dB Bandwidth

[Pxx,f2] = periodogram(y(sigIdx),rectwin(N),[],fs);
for i = 1:length(Xi)
    figure(1)
    xline(Xi(i))
    fl = Xi(i)-10;
    fr = Xi(i)+10;
    bw(i) = powerbw(Pxx(f2>fl & f2 < fr), f2(f2>fl & f2 < fr));
end
bw;
factor = 0.6;
B = factor*bw;

%% IIR filter parameters

r = exp(-pi*B/fs);
b0 = Yi;
a1 = -2*r.*cos(2*pi*Xi/fs);
a2 = r.^2;

%% Create impulse response of filter bank

N = length(y);
x = [1; zeros(N-1, 1)];
y2 = filter( b0(1), [1 a1(1) a2(1)], x );
for n = 2:K
  y2 = y2 + filter( b0(n), [1 a1(n) a2(n)], x );
end

y1 =  y2 / max(abs(y2));

useResidual = true;
if useResidual
  Y = fft(y);
  Y2 = fft(y2);
  R = Y ./Y2;
  r = 50*real(ifft(R)); 

  y2 = filter( b0(1), [1 a1(1) a2(1)], r );
  for n = 2:K
    y2 = y2 + filter( b0(n), [1 a1(n) a2(n)], r );
  end
end

y2 =  y2 / max(abs(y2));

%% play the sound - original, synthesized, and with residual
sound([y; zeros(10000, 1); y1; zeros(10000, 1); y2], fs)

N2 = length(y2);           % number of samples in the sound file
Ttot2 = N2./fs;            % duration in seconds
t2 = 0: Ttot2/N2 : Ttot2-Ttot2/N2;    % time sequence

figure(1);
subplot(3, 2, 5)
plot(t, y)
hold on
plot( t2, y2, 'k' )
xlabel('Time (s)');
ylabel('Amplitude');
title('synthesized sound file - with residual');
grid on

Y2 = fft(y2);
Y2 = abs(Y2(1:ceil(N2/2)));

YdB2 = 20*log10(Y2);

freqs2 = (1:N2-1) * fs/N2; 
freqs2 = freqs2(1:ceil(N2/2));

subplot(3, 2, 6)
plot(freqs2,YdB2)
xlim([0 2500])
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Frequency Spectrum');
grid on

subplot(3, 2, 3)
plot(t, y)
hold on
plot( t2, y1, 'k' )
xlabel('Time (s)');
ylabel('Amplitude');
title('synthesized sound file');
grid on

Y1 = fft(y1);
Y1 = abs(Y1(1:ceil(N2/2)));

YdB1 = 20*log10(Y1);

freqs2 = (1:N2-1) * fs/N2; 
freqs2 = freqs2(1:ceil(N2/2));

subplot(3, 2, 4)
plot(freqs2,YdB1)
xlim([0 2500])
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Frequency Spectrum');
grid on

%% store the file

fileLoc2 = 'sounds-modalSynth/';
ext2 = '.wav';
noRes = '-noRes';

if isempty(txt)
    s_new = strcat(fileLoc2,'s1-G3',ext2);
    s_new1 = strcat(fileLoc2,'s1-G3',noRes,ext2);
else
    s_new = strcat(fileLoc2,txt,ext2);
    s_new1 = strcat(fileLoc2,txt,noRes,ext2);
end

audiowrite(s_new1, y1, fs)

audiowrite(s_new, y2, fs)