% MUMT307 Winter 2022
% Final Project
% Deadline: April 22nd 2022
% Name: Jiali CHENG
% 
% A Matlab script to perform spectrum analysis of each note of a handpan.

clear all; close all; %clc

fileLoc = 'sounds-original/';
ext = '.mp3';

[y0, fs] = audioread( strcat(fileLoc,'s0-d2',ext) );
[y1, fs] = audioread( strcat(fileLoc,'s3-A3',ext) );
[y2, fs] = audioread( strcat(fileLoc,'s4-A#3',ext) );
[y3, fs] = audioread( strcat(fileLoc,'s6-C4',ext) );
[y4, fs] = audioread( strcat(fileLoc,'s8-D4',ext) );
[y5, fs] = audioread( strcat(fileLoc,'s10-E4',ext) );
[y6, fs] = audioread( strcat(fileLoc,'s11-F4',ext) );
[y7, fs] = audioread( strcat(fileLoc,'s13-G4',ext) );
[y8, fs] = audioread( strcat(fileLoc,'s15-A4',ext) );

y0 = zeropad(y0, fs);
y1 = zeropad(y1, fs);
y2 = zeropad(y2, fs);
y3 = zeropad(y3, fs);
y4 = zeropad(y4, fs);
y5 = zeropad(y5, fs);
y6 = zeropad(y6, fs);
y7 = zeropad(y7, fs);
y8 = zeropad(y8, fs);

yAll = [y0, y1, y2, y3, y4, y5, y6, y7, y8]';
notes = {'D3'; 'A3'; 'A#3/Bb3'; 'C4'; 'D4'; 'E4'; 'F4'; 'G4'; 'A4'};

f0 = [146.83, 220.00, 233.08, 261.63, 293.66, 329.63, 349.23, 392.00, 440.00];
% https://pages.mtu.edu/~suits/notefreqs.html

for i=1:9
    y = yAll(i,:);
    fs;                             % sampling rate = 44100 Hz
    T = 1/fs;                       % sampling period
    N = length(y);               % number of samples in the sound file
    Ttot = N./fs;                   % duration in seconds
    t = 0: Ttot/N : Ttot-Ttot/N;    % time sequence
    
    Y = fft(y);
    Y = Y(1:ceil(N/2));
    Y = abs(Y);
    
    YdB = 20*log10(Y);
    
    freqs = (1:N-1) * fs/N; 
    freqs = freqs(1:ceil(N/2));

    figure(1)
    nexttile(i)
    plot(freqs,YdB,'LineWidth',1)
    xline(f0(i),'--')
    xline(f0(i)*2,'--')
    xline(f0(i)*3,'--')
    xlim([0 2000])
    xlabel('Frequency (Hz)','FontSize', 12)
    ylabel('Magnitude (dB)','FontSize', 12)
    frequency = strcat('f_0 = ',string(notes(i)),' = ', string(f0(i)), 'Hz');
    title(frequency,'FontSize', 12)
    grid on
    grid minor

end

function y = zeropad(signal, fs)
    fs;                             % sampling rate = 44100 Hz
    T = 1/fs;                       % sampling period
    Ny = length(signal);            % number of samples in the sound file
    Ttoty = Ny./fs;                 % duration in seconds
    
    N = 2^18;                       % number of samples to compute to make it 
                                    % to the power of 2
    pad = N-Ny;                     % zero-padding
    y = [signal; zeros(1, pad)'];   % add zeros to the sound file
    
end