% MUMT307 Winter 2022
% Final Project
% Deadline: April 22nd 2022
% Name: Jiali CHENG
% 
% A Matlab script to play a song with loaded audio files.
% The song [Yan Yu Qing Dai] was written by Shi, Lei.
% Shi Lei's page: https://slwmy.bandcamp.com/
% Shi Lei's intro in Chinese (the first artist): 
% http://www.xuansoundhandpan.com/artist.asp
% Original piece: https://www.youtube.com/watch?v=PhtP8YuxzAQ
% The numbered music notation was obtained from 
% https://www.bilibili.com/video/BV1Zk4y1r75d?share_source=copy_web

clear all; close all; %clc

fileLoc2 = 'sounds-modalSynth/';
ext = '.wav';
noRes = '-noRes'; % add ,noRes after the file name to play the song 
                  % with synthesized sound without residuals

[y0, fs] = audioread( strcat(fileLoc2,'s0-d2',ext) );
[y1, fs] = audioread( strcat(fileLoc2,'s3-A3',ext) );
[y2, fs] = audioread( strcat(fileLoc2,'s4-Bb3',ext) );
[y3, fs] = audioread( strcat(fileLoc2,'s6-C4',ext) );
[y4, fs] = audioread( strcat(fileLoc2,'s8-D4',ext) );
[y5, fs] = audioread( strcat(fileLoc2,'s10-E4',ext) );
[y6, fs] = audioread( strcat(fileLoc2,'s11-F4',ext) );
[y7, fs] = audioread( strcat(fileLoc2,'s13-G4',ext) );
[y8, fs] = audioread( strcat(fileLoc2,'s15-A4',ext) );

g = 0.36;
y0 = g*y0;
y1 = g*y1;
y2 = g*y2;
y3 = g*y3;
y4 = g*y4;
y5 = g*y5;
y6 = g*y6;
y7 = g*y7;
y8 = g*y8;

bpm = 108;
dt = 60/bpm;
dt = dt/4;

%% intro
sound(y0, fs)
pause(dt*8)
sound(y8, fs)
pause(dt*8)
%-
sound(y6, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*2)
sound(y8, fs)
pause(dt*8)
sound(y6, fs)
pause(dt*4)
%-
pause(dt*4)
sound(y5, fs)
pause(dt*8)
sound(y4, fs)
pause(dt*4)
%-
pause(dt*8)
pause(dt*8)

%% A (play it three times - 1)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% A (play it three times - 2)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% A (play it three times - 3)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

%% B
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y8, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y8, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)

%% A2
% A (play it twice)-1
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% A (play it twice - 2)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% A -3
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)

%% C
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y8, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y8, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)

%% A3
% A (play it twice)-1
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% A (play it twice - 2)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

%% A4
% A
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*3)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*3)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% AA
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

%% D
%
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y8, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
%--
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y8, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)


%% A5 (play it four times - 1)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% A (play it four times - 2)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% A (play it four times - 3)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)

% A (play it four times - 4)
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y4, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*2)
sound(y6, fs)
pause(dt*2)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y6, fs)
pause(dt*1)
sound(y1, fs)
pause(dt*1)
sound(y4, fs)
pause(dt*1)
%--
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
%-
sound(y0, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*2)
sound(y3, fs)
pause(dt*2)
sound(y7, fs)
pause(dt*2)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y5, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)
sound(y7, fs)
pause(dt*1)
sound(y3, fs)
pause(dt*1)