```markdown
Sound synthesis is to generate a signal with desired acoustical effects and can be 

useful in sound design. Some common techniques include additive synthesis, granular 

synthesis, and physical modelling. This project aims to synthesize the handpan sound 

using modal synthesis. The model was devised by extracting the frequency peaks and 

bandwidths of the sound source. Thirteen recorded samples of the impulse response 

of each note were analyzed and recreated with resonance filters designed in MATLAB, 

and a song was played with realistic synthesized sound for demonstration.
```

## Introduction

Physical model synthesis is a technique to simulate the vibrations of objects under various excitations. It requires a description of the vibrational characteristics and the coupling interactions of the physical structures. Modal synthesis can be seen as a special physical modelling technique in which the vibrations of resonant structures are simulated based on a modal representation, and the interactions between structures are calculated by the time step of the corresponding equations [[1](https://doi.org/10.2307/3680569)].

### Modal Synthesis

Modal synthesis is a technique to perform vibration analysis of a system by determining its mode shapes and frequencies. For example, a signal shown in Figure 1 can be seen as a superposition of various modes; each has a particular frequency [[2](https://ccrma.stanford.edu/~bilbao/booktop/node14.html)]. It can be re-assembled by combining such frequencies and selected modal information. Modal synthesis is "both effective and efficient for recreating the sounds of objects that exhibit a relatively small number of strong decaying modes" [[3](https://www.music.mcgill.ca/~gary/307/week10/modal.html)]. Some good candidates for such technique are plucked strings, a marimba struck by a mallet or a bar hit by a hammer. It can also use filter banks (i.e. a lot of filters) to simulate all the resonant modes of the system, as illustrated in Figure 2 [[4](http://www.music.mcgill.ca/~gary/307/week10/node4.html)]. Resonance filters can approximate the spectral and temporal profile of the sound: the radius of the filter, which is related to its bandwidth, gives insights into the decay time.

<p align="center">
  <img height="250" src="./img/ModalSynth.png" alt="Figure 1. Modal Synthesis of a linear, distributed time-dependent signal.">
  <figcaption align = "center"><b>Figure 1. Modal synthesis of a linear, distributed time-dependent signal as decomposition and recombination of individul modes with different frequencies.</b></figcaption>
</p>

<p align="center">
  <img height="350" src="./img/ModalSynth2.png" alt="Figure 2. Modal Synthesis Resonance Filters model.">
  <figcaption align = "center"><b>Figure 2. A block diagram of modal synthesis model using resonance filters.</b></figcaption>
</p>


### Handpan

A handpan instrument is a group of metallic percussion instruments played with hands that are similar to Hang® (cre­at­ed by PANArt tuners Sabi­na Schär­er and Felix Rohn­er in 2000 in Switzer­land [[5](https://panart.ch/en/articles/copyright-questions-and-answers)]), consisting of two hemispherical shells of nitrided or stainless steel. Its extraordinary sound is often described as calming and peaceful, which can be used for stress release [[6](https://theconsciousclub.com/articles/2019/10/24/the-magic-of-the-handpan-the-instrument-for-stress-release-and-harmonynbsp)]. Originated from the Caribbean steelpan instrument, a handpan typically has 8-9 notes on a pentatonic scale. Figure 3 is a sample image of a free integral Hang® built by PANArt, where seven harmonically tuned notes are around a deep central tone, and each excites the Helmholtz resonance in the body of the instrument [[7](http://www.hangblog.org/panart/Paper-Hang-2007.pdf)] [[8](https://commons.wikimedia.org/wiki/File:Panart-freies-integrales-hang.jpg)]. Figure 4 is a sample tuning scale commonly known as Kurd D, adapted from [[9](https://acoustics.org/pressroom/httpdocs/155th/wessel.htm)]. It can be tuned in a wide range of scales; some examples are illustrated in Figure 5 [[10](http://www.hangblog.org/panart/2-S2-4-IsmaRossing.pdf)]. 

<p align="center">
  <img height="300" src="https://upload.wikimedia.org/wikipedia/commons/a/a3/Panart-freies-integrales-hang.jpg" alt="Figure 3. The side, top, and bottom view of a Hang®.">
  <figcaption align = "center"><b>Figure 3. The side, top, and bottom view of a Hang®.</b></figcaption>
</p>
<p>&nbsp;</p>
<p align="center">
  <img height="350" src="./img/HandpanKurdD.jpg" alt="Figure 4. A sample tuning scale beginning with D3 note in the center."> 
  <figcaption align = "center"><b>Figure 4. A sample tuning scale beginning with D3 note in the center. Eight note areas are arranged around the center note area of the handpan.</b></figcaption>
</p>
<p>&nbsp;</p>
<p align="center">
  <img height="400" src="./img/HangScales.png" alt="Figure 5. Sample tuning scales.">
  <figcaption align = "center"><b>Figure 5. Sample tuning scales.</b></figcaption>
</p>

The playing technique of a handpan is to strike it with the hand, either using fingertips or the palm. Different manner can considerably influence the quality of the sounds: the spectral content, the decay time, and other features of the amplitude envelope depend on the intensity of the hit [[9](https://acoustics.org/pressroom/httpdocs/155th/wessel.htm)]. Tapping with a rubber mallet or just fingertips on a single note area can excite the fundamental, the second, and the third harmonics, as illustrated in Figure 6. The harmonic ratio of the most prominent spectral peaks is 1 : 2 : 3, and striking one note can also make other notes vibrate [[11](https://doi.org/10.1063/1.3099586)].

<p align="center">
  <img height="550" src="./img/Spectrum_Kurd2.png" alt="Figure 6. Sound spectra.">
  <figcaption align = "center"><b>Figure 6. Sound spectra of each note in a handpan as shown in Figure 4. Each spectrum shows the ratio of harmonic frequencies in 1 : 2 : 3, and some have fourth harmonics. Small peaks in the ratio of 82 Hz (near E2) are also visible in each spectrum, which is the frequency of the cavity resonance.</b></figcaption>
</p>

## Methods

Since each note is impulsively excited, the handpan can be modelled with a bank of resonance filters, and each is centred at particular frequency components. To obtain the parameters (gains and decay times) for these filters, one can tap each note area slightly with one hand or a rubber mallet and record the impulse response. A set of recorded samples are stored on the Github repo [[12](https://github.com/bel0v/handpan)]. Performing FFT (Fast Fourier Transform) on each sample and finding peaks of the spectra gives information on the central frequency and amplitude of each vibration mode. We can then estimate the peak bandwidth at a level of -3 dB to find the pole radius, which relates to the quality factor $\displaystyle Q$ and the decay constant $\displaystyle \alpha$. The feedback coefficients of a second-order IIR (infinite impulse response) filter can also be calculated to generate an impulse response. Finally, we can excite the impulse response with a residual obtained from the original signal. The detailed procedure with equations is listed below, and the MATLAB script is attached in Appendix A.

### Parabolic Interpolation of Spectral Peaks

The frequency resolution of an N-point DFT is $\displaystyle f_s/N$ Hz. Since the peak value is not necessary at the bin value, a parabola was fitted to the spectral data to estimate the peak and amplitude values based on the three samples nearest the peak, as illustrated in Figure 7 [[13](https://ccrma.stanford.edu/~jos/sasp/Quadratic_Interpolation_Spectral_Peaks.html)].

<p align="center">
  <img height="550" src="./img/parabolicPeak.png" alt="Figure 7. Parabolic Interpolation.">
  <figcaption align = "center"><b>Figure 7. Illustration of parabolic interpolation using the three most significant values around a peak.</b></figcaption>
</p>

A parabola can be written as $\displaystyle y(x) \mathrel{\stackrel{\Delta}{=}}a(x-p)^2+b$ in which $p$



the general formula for a parabola may be written as

$\displaystyle y(x) \mathrel{\stackrel{\Delta}{=}}a(x-p)^2+b$	(6.29)

The center point $ p$ gives us our interpolated peak location (in bins), while the amplitude $ b$ equals the peak amplitude (typically in dB). The curvature $ 2a$ depends on the window used and contains no information about the sinusoid. (It may, however, indicate that the peak being interpolated is not a pure sinusoid.)
At the three samples nearest the peak, we have

\begin{eqnarray*}
y(-1) &=& \alpha \\
y(0) &=& \beta \\
y(1) &=& \gamma
\end{eqnarray*}
where we arbitrarily renumbered the bins about the peak $ -1$ , 0, and 1. Writing the three samples in terms of the interpolating parabola gives

\begin{eqnarray*}
\alpha &=& ap^2 + 2ap + a + b \\
\beta &=& ap^2 + b \\
\gamma &=& ap^2 - 2ap + a + b
\end{eqnarray*}
which implies

\begin{eqnarray*}
\alpha- \gamma &=& 4ap \\
\Rightarrow\quad p &=& \frac{\alpha-\gamma}{4a} \\
\Rightarrow\quad \alpha &=& ap^2 + \left(\frac{\alpha-\gamma}{2}\right)
+a+(\beta-ap^2) \\
\Rightarrow\quad a &=& \frac{1}{2}(\alpha - 2\beta + \gamma) \\
\end{eqnarray*}
Hence, the interpolated peak location is given in bins6.9 (spectral samples) by

$\displaystyle \zbox {p=\frac{1}{2}\frac{\alpha-\gamma}{\alpha-2\beta+\gamma}} \in [-1/2,1/2].$	(6.30)

If $ k^\ast$ denotes the bin number of the largest spectral sample at the peak, then $ k^\ast+p$ is the interpolated peak location in bins. The final interpolated frequency estimate is then $ (k^\ast+p)f_s/N$ Hz, where $ f_s$ denotes the sampling rate and $ N$ is the FFT size.
Using the interpolated peak location, the peak magnitude estimate is

$\displaystyle \zbox {y(p) = \beta - \frac{1}{4}(\alpha-\gamma)p.}$
--
A common method for interpolating spectral magnitude peaks is to use quadratic interpolation, which involves fitting a parabola to the three most significant values around a peak.
Given the three spectral magnitude values around a peak as $y(-1) = \alpha, y(0) = \beta, y(1) = \gamma$, the interpolated peak location (in bins) is given by
  $\displaystyle p = \frac{1}{2}\frac{\alpha - \gamma}{\alpha - 2\beta + \gamma}
$(16)in the range -1/2 to +1/2.
The magnitude at the peak is given as $y(p) = \beta - \frac{1}{4}(\alpha - \gamma)p$.


```matlab
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
```

### 3-dB Bandwidth Estimation

## Results

[recorded sample](./sounds-original/s0-d2.mp3)

<audio controls="controls" src="./sounds-original/s0-d2.mp3">
<p>xxx.</p>
</audio>


<audio controls="controls">
<source src="https://github.com/carrieeex/MUMT307-project/blob/68b3b8d8ccdbe076c0b63dc4913d0a17ab328454/sounds-original/s0-d2.mp3"/>
<p>xxxx.</p>
</audio>


## Discussion

## Conclusion

***



## References

[1]: Morrison, Joseph Derek, and Jean-Marie Adrien. "MOSAIC: A Framework for Modal Synthesis." Computer Music Journal 17, no. 1 (1993): 45–56. https://doi.org/10.2307/3680569.

[2]: Bilbao, Stefan. "Modal Synthesis", in _Numerical Sound Synthesis_, https://ccrma.stanford.edu/~bilbao/booktop/node14.html, online book, 2006 edition, accessed 22 April 2022.

[3]: Scavone, Gary P. "Modal Synthesis", in _MUMT 307: Music Audio Computing II_, https://www.music.mcgill.ca/~gary/307/week10/modal.html, online book, 2022 edition, accessed 22 April 2022.

[4]: Scavone, Gary P. "Digital 'Resonators'", in _MUMT 307: Music Audio Computing II_, http://www.music.mcgill.ca/~gary/307/week10/node4.html, online book, 2022 edition, accessed 22 April 2022.

[5]: PANArt. "Copyright: Questions and Answers". Panart (en). Accessed 22 April 2022. https://panart.ch/en/articles/copyright-questions-and-answers.

[6]: Malzer, Clara. "The Magic of The Handpan: The Instrument For Stress-Release And Harmony". The Conscious Club. Accessed 22 April 2022. https://theconsciousclub.com/articles/2019/10/24/the-magic-of-the-handpan-the-instrument-for-stress-release-and-harmonynbsp.

[7]: Rohner, Felix, and Sabina Schärer. "History, Development and Tuning of the Hang", 2007. http://www.hangblog.org/panart/Paper-Hang-2007.pdf.

[8]: "File:Panart-Freies-Integrales-Hang.Jpg - Wikipedia". Accessed 22 April 2022. https://commons.wikimedia.org/wiki/File:Panart-freies-integrales-hang.jpg.

[9]: Wessel, David, Andrew Morrision, and Thomas D. Rossing. "SOUND OF THE HANG". ACOUSTICS.ORG, 4 July 2008. https://acoustics.org/pressroom/httpdocs/155th/wessel.htm.

[10]: Rossing, Thomas D., Andrew Morrision, Uwe Hansen, Felix Rohner, and Sabina Schärer. "ACOUSTICS OF THE HANG: A Hand-Played Steel Instrument", 2007. http://www.hangblog.org/panart/2-S2-4-IsmaRossing.pdf.

[11]: Morrison, Andrew, and Thomas D. Rossing. "The Extraordinary Sound of the Hang". Physics Today 62, no. 3 (March 2009): 66–67. https://doi.org/10.1063/1.3099586.

[12]: Yegor. Bel0v/Handpan. JavaScript, 2016. Accessed 22 April 2022. https://github.com/bel0v/handpan.

[13]: Smith, J.O. "Quadratic Interpolation of Spectral Peaks", in _Spectral Audio Signal Processing_, https://ccrma.stanford.edu/~jos/sasp/Quadratic_Interpolation_Spectral_Peaks.html, online book, 2011 edition, accessed 22 April 2022.

***

[77]: "Ayasa - Acquire an Instrument". Accessed 22 April 2022. https://ayasainstruments.com/acquire-an-ayasa.

[88]: Paslier, Sylvain. "How Are Handpans Made? A Step-by-Step Guide". sylvainpasliermusic, 22 August 2019. https://www.sylvainpasliermusic.com/post/how-are-handpans-made.

[99]: Scavone, Gary P. "MIDI". Accessed 1 December 2021. https://www.music.mcgill.ca/~gary/306/week2/node3.html.

[100]: Morrison, Andrew, and Thomas D. Rossing. "The Extraordinary Sound of the Hang". Physics Today 62, no. 3 (March 2009): 66–67. https://doi.org/10.1063/1.3099586.

[111]: Scavone, Gary P. "Interfacing the Arduino to Max/MSP". Accessed 1 December 2021. https://www.music.mcgill.ca/~gary/306/week5/node7.html.

[122]: Gautschi, Gustav. "Introduction". In Piezoelectric Sensorics: Force Strain Pressure Acceleration and Acoustic Emission Sensors Materials and Amplifiers, edited by Gustav Gautschi, 1–3. Berlin, Heidelberg: Springer, 2002. https://doi.org/10.1007/978-3-662-04732-3_1.

[133]: "MakerHawk 4pcs Analog Ceramic Piezo Vibration Sensor Module 3.3V/5V for Arduino DIY Kit: Amazon.Com: Industrial & Scientific". Accessed 1 December 2021. https://www.amazon.com/MakerHawk-Analog-Ceramic-Vibration-Arduino/dp/B07KS5NV4V.

[144]: Arduino Online Shop. "Arduino Mega 2560 Rev3". Accessed 1 December 2021. http://store-usa.arduino.cc/products/arduino-mega-2560-rev3.


## Appendix 

### A. Sample MATLAB script of Modal Synthesis.

```MATLAB
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
```

