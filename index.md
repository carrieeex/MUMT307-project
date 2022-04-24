```markdown
Sound synthesis is to generate a signal with desired acoustical effects and can be useful in sound design. Some common techniques include additive synthesis, granular synthesis, and physical modelling. This project aims to synthesize the handpan sound using modal synthesis. The model was devised by extracting the frequency peaks and bandwidths of the sound source. Thirteen recorded samples of the impulse response of each note were analyzed and recreated with resonance filters designed in MATLAB, and a song was played with realistic synthesized sound for demonstration.
```

## Introduction

Physical model synthesis is a technique to simulate the vibrations of objects under various excitations. It requires a description of the vibrational characteristics and the coupling interactions of the physical structures. Modal synthesis can be seen as a special physical modelling technique in which the vibrations of resonant structures are simulated based on a modal representation, and the interactions between structures are calculated by the time step of the corresponding equations [1].

### Modal Synthesis

Modal synthesis is a technique to perform vibration analysis of a system by determining its mode shapes and frequencies. For example, a signal shown in Figure 1 can be seen as a superposition of various modes; each has a particular frequency [2]. It can be re-assembled by combining such frequencies and selected modal information. Modal synthesis is "both effective and efficient for recreating the sounds of objects that exhibit a relatively small number of strong decaying modes" [3]. Some good candidates for such technique are plucked strings, a marimba struck by a mallet or a bar hit by a hammer. It can also use filter banks (i.e. a lot of filters) to simulate all the resonant modes of the system, as illustrated in Figure 2 [4]. Resonance filters can approximate the spectral and temporal profile of the sound: the radius of the filter, which is related to its bandwidth, gives insights into the decay time.

<p align="center">
  <img height="300" src="./img/ModalSynth.png" alt="Figure 1. Modal Synthesis of a linear, distributed time-dependent signal.">
  <figcaption align = "center"><b>Figure 1. Modal synthesis of a linear, distributed time-dependent signal as decomposition and recombination of individul modes with different frequencies.</b></figcaption>
</p>

<p align="center">
  <img height="300" src="./img/ModalSynth2.png" alt="Figure 2. Modal Synthesis Resonance Filters model.">
  <figcaption align = "center"><b>Figure 2. A block diagram of modal synthesis model using resonance filters.</b></figcaption>
</p>


### Handpan

A handpan instrument is a group of metallic percussion instruments played with hands that are similar to Hang® (cre­at­ed by PANArt tuners Sabi­na Schär­er and Felix Rohn­er in 2000 in Switzer­land [5]), consisting of two hemispherical shells of nitrided or stainless steel. Its extraordinary sound is often described as calming and peaceful, which can be used for stress release [6]. Originated from the Caribbean steelpan instrument, a handpan typically has 8-9 notes on a pentatonic scale. Figure 3 is a sample image of a free integral Hang® built by PANArt, where seven harmonically tuned notes are around a deep central tone, and each excites the Helmholtz resonance in the body of the instrument [7] [8]. Figure 4 is a sample tuning scale commonly known as Kurd D, adapted from [9]. It can be tuned in a wide range of scales; some examples are illustrated in Figure 5 [10]. 

<p align="center">
  <img height="300" src="https://upload.wikimedia.org/wikipedia/commons/a/a3/Panart-freies-integrales-hang.jpg" alt="Figure 3. The side, top, and bottom view of a Hang®.">
  <figcaption align = "center"><b>Figure 3. The side, top, and bottom view of a Hang®.</b></figcaption>
</p>
<p>&nbsp;</p>
<p align="center">
  <img width="350" src="./img/HandpanKurdD.jpg" alt="Figure 4. A sample tuning scale beginning with D3 note in the center."> 
  <figcaption align = "center"><b>Figure 4. A sample tuning scale beginning with D3 note in the center. Eight note areas are arranged around the center note area of the handpan.</b></figcaption>
</p>
<p>&nbsp;</p>
<p align="center">
  <img width="550" src="./img/HangScales.png" alt="Figure 5. Sample tuning scales.">
  <figcaption align = "center"><b>Figure 5. Sample tuning scales.</b></figcaption>
</p>

The playing technique of a handpan is to strike it with the hand, either using fingertips or the palm. Different manner can considerably influence the quality of the sounds: the spectral content, the decay time, and other features of the amplitude envelope depend on the intensity of the hit [9]. Tapping with a rubber mallet or just fingertips on a single note area can excite the fundamental, the second, and the third harmonics, as illustrated in Figure 6. The harmonic ratio of frequencies is 1:2:3, and striking one note can also make other notes vibrate [11].

<p align="center">
  <img width="550" src="./img/Spectrum_Kurd2.png" alt="Figure 6. Sound spctra.">
  <figcaption align = "center"><b>Figure 6. Sound spectra of each note in a handpan as shown in Figure 4. Each spectrum shows the ratio of harmonic frequencies in 1:2:3, and some have fourth harmonics. Small peaks in the ratio of 82 Hz (near E2) are also visible in each spectrum, which is the frequency of the cavity resonance.</b></figcaption>
</p>

## Methods

Since each note is impulsively excited, the handpan can be modelled with a bank of resonance filters, and each is centred at particular frequency components. To obtain the parameters (gains and decay times) for these filters, one can tap each note area slightly with one hand or a rubber mallet and record the impulse response. A set of recorded samples are stored on the Github repo [12]. Performing FFT (Fast Fourier Transform) on each sample and finding peaks of the spectra gives information on the central frequency and amplitude of each vibration mode. We can then estimate the peak bandwidth at a level of -3 dB to find the pole radius, which relates to the quality factor $Q$ and the decay constant $\alpha$. The feedback coefficients of a second-order IIR (infinite impulse response) filter can also be calculated to create an impulse response. Finally, we can excite the impulse response with a residual obtained from the original signal. The detailed procedure with equations is listed below, and the MATLAB script is attached in Appendix.



***

If we record the decaying sound of a string or other impulsively excited object, we can interpret spectral magnitude peaks as natural modes of vibration, which can each be represented as exponentially decaying sinusoids defined by:

The HANG can be modeled with filters centered at each of the frequency components; the gains and decay times for these resonant filters can be estimated from the analysis of multiple playing strokes. From the analysis it is possible to synthesize realistic sounds of the HANG. This is the known synthesis of this interesting and popular instrument. [8]



When struck with the hand, each note area of the hang vibrates in a rich complement of modes. In particular, the three lowest-frequency modes—the fundamental and the second and third harmonics—are all strongly excited. The frequencies of those modes are in the ratio of 1:2:3, and that harmonic relation leads to an interesting effect: Striking one note can cause another note to vibrate. The waves created when the hang is struck are not confined to a single note area. Rather, they initially propagate outward through the steel of the instrument and are eventually reflected many times off the hang’s boundaries. If any other notes have resonances at frequencies near those in the spectrum of the struck note, as is often the case, then modes of the other notes will be excited and the hang will vibrate at the corresponding frequencies. [10]

Sound spectra Sound spectra were recorded using a Tekronix FFT analyzer controlled by a laptop computer. Each note area was tapped lightly with a rubber mallet. The spectra for all 8 notes are shown in Figure 9. Each spectrum shows the three principal harmonics, which have frequencies in the ratios 1:2:3. Also visible in each spectrum is a small peak at 85 Hz, the frequency of the cavity resonance (near F2).

Playing techniques

The manner in which the HANG is played has considerable influence on the quality of the sounds that it produces. Playing more or less intensely influences the spectral content, the decay time, and additional features of the amplitude envelope.

When playingfff not only is the overall amplitude dramatically changed but the loud note rings longer than the soft one. The soft note has but two audibly significant components in an octave relationship whereas the intense notes higher frequency components are inharmonic with respect to the fundamental. In addition, the intense note shows significant amplitude modulations due to beating.

An important set of playing techniques involves playing a HANG note with a rapid succession of impacts. This can be accomplished in a variety of ways, the most elementary of which involves playing single stroke roles with the fingers of alternating hands. As each stroke arrives it finds the HANG in a different state. As a result, each of the notes in the roll has a slightly different timbre. This timbral variation provides a quality to the sound that cannot be achieved by repeating the same sample of a HANG to simulate a roll. To demonstrate this effect we modeled the HANG with filters centered at each of the frequency components. The gains and decay times for these resonate filters were estimated from the analysis. We demonstrate the difference in sound quality by comparing the free running set of resonate filters with a version of the model where the state of the filters remains constant at each impulse.

Another effective way to play a rapid succession of single notes is to use a technique analogous to the way a percussionist using sticks plays a flam. This can be accomplished by placing the middle finger just ahead of the index finger when striking the HANG. The arrival times of the two fingers can be controlled by how far they are spaced apart prior to the impact. A variety of timbres can be obtained by controlling the finger spacing in this manner. More complex effects, such as a flurry of notes, can be obtained by arranging the fingers so that the baby finger strikes first followed by the ring, middle, and index fingers in rapid succession.

The HANG's center note with its outwardly extending boss invites a variety of techniques including striking it with a larger surface of hand as with flattened fingers or the base of the palm.

One of the most important aspects of HANG technique is how long the finger or hand remains in contact with the instrument during the stroke. The longer the contact time the greater the damping effect. Many beginning players have difficulty striking the instrument and pulling away quickly making it hard for them to produce notes that ring. One tip is to actually practice making the up stroke rapid separately from the down stoke and then combining them to effectively control the contact time with the instrument.

The HANG can be modeled with filters centered at each of the frequency components; the gains and decay times for these resonant filters can be estimated from the analysis of multiple playing strokes. From the analysis it is possible to synthesize realistic sounds of the HANG. This is the known synthesis of this interesting and popular instrument. [8]



## References

[1]: Morrison, Joseph Derek, and Jean-Marie Adrien. "MOSAIC: A Framework for Modal Synthesis." Computer Music Journal 17, no. 1 (1993): 45–56. https://doi.org/10.2307/3680569.

[2]: Bilbao, Stefan. "Modal Synthesis", in Numerical Sound Synthesis, https://ccrma.stanford.edu/~bilbao/booktop/node14.html, online book, 2006 edition, accessed 22 April 2022.

[3]: Scavone, Gary P. "Modal Synthesis", in MUMT 307: Music Audio Computing II, https://www.music.mcgill.ca/~gary/307/week10/modal.html, online book, 2022 edition, accessed 22 April 2022.

[4]: Scavone, Gary P. "Digital 'Resonators'", in MUMT 307: Music Audio Computing II, http://www.music.mcgill.ca/~gary/307/week10/node4.html, online book, 2022 edition, accessed 22 April 2022.

[5]: PANArt. "Copyright: Questions and Answers". Panart (en). Accessed 22 April 2022. https://panart.ch/en/articles/copyright-questions-and-answers.

[6]: Malzer, Clara. "The Magic of The Handpan: The Instrument For Stress-Release And Harmony". The Conscious Club. Accessed 22 April 2022. https://theconsciousclub.com/articles/2019/10/24/the-magic-of-the-handpan-the-instrument-for-stress-release-and-harmonynbsp.

[7]: Rohner, Felix, and Sabina Schärer. "History, Development and Tuning of the Hang", 2007. http://www.hangblog.org/panart/Paper-Hang-2007.pdf.

[8]: "File:Panart-Freies-Integrales-Hang.Jpg - Wikipedia". Accessed 22 April 2022. https://commons.wikimedia.org/wiki/File:Panart-freies-integrales-hang.jpg.

[9]: Wessel, David, Andrew Morrision, and Thomas D. Rossing. "SOUND OF THE HANG". ACOUSTICS.ORG, 4 July 2008. https://acoustics.org/pressroom/httpdocs/155th/wessel.htm.

[10]: Rossing, Thomas D., Andrew Morrision, Uwe Hansen, Felix Rohner, and Sabina Schärer. "ACOUSTICS OF THE HANG: A Hand-Played Steel Instrument", 2007. http://www.hangblog.org/panart/2-S2-4-IsmaRossing.pdf.

[11]: Morrison, Andrew, and Thomas D. Rossing. "The Extraordinary Sound of the Hang". Physics Today 62, no. 3 (March 2009): 66–67. https://doi.org/10.1063/1.3099586.

[12]: Yegor. Bel0v/Handpan. JavaScript, 2016. Accessed 22 April 2022. https://github.com/bel0v/handpan.




***

[7]: "Ayasa - Acquire an Instrument". Accessed 22 April 2022. https://ayasainstruments.com/acquire-an-ayasa.

[8]: Paslier, Sylvain. "How Are Handpans Made? A Step-by-Step Guide". sylvainpasliermusic, 22 August 2019. https://www.sylvainpasliermusic.com/post/how-are-handpans-made.

[9]: Scavone, Gary P. "MIDI". Accessed 1 December 2021. https://www.music.mcgill.ca/~gary/306/week2/node3.html.

[10]: Morrison, Andrew, and Thomas D. Rossing. "The Extraordinary Sound of the Hang". Physics Today 62, no. 3 (March 2009): 66–67. https://doi.org/10.1063/1.3099586.

[11]: Scavone, Gary P. "Interfacing the Arduino to Max/MSP". Accessed 1 December 2021. https://www.music.mcgill.ca/~gary/306/week5/node7.html.

[12]: Gautschi, Gustav. "Introduction". In Piezoelectric Sensorics: Force Strain Pressure Acceleration and Acoustic Emission Sensors Materials and Amplifiers, edited by Gustav Gautschi, 1–3. Berlin, Heidelberg: Springer, 2002. https://doi.org/10.1007/978-3-662-04732-3_1.

[13]: "MakerHawk 4pcs Analog Ceramic Piezo Vibration Sensor Module 3.3V/5V for Arduino DIY Kit: Amazon.Com: Industrial & Scientific". Accessed 1 December 2021. https://www.amazon.com/MakerHawk-Analog-Ceramic-Vibration-Arduino/dp/B07KS5NV4V.

[14]: Arduino Online Shop. "Arduino Mega 2560 Rev3". Accessed 1 December 2021. http://store-usa.arduino.cc/products/arduino-mega-2560-rev3.




## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/carrieeex/MUMT307-project/edit/gh-pages/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [Basic writing and formatting syntax](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/carrieeex/MUMT307-project/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
