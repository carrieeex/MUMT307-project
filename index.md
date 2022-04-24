```markdown
Sound synthesis is to generate a signal with desired acoustical effects and can be useful in sound design. Some common techniques include additive synthesis, granular synthesis, and physical modelling. This project aims to synthesize the handpan sound using modal synthesis. The model was devised by extracting the frequency peaks and bandwidths of the sound source. Thirteen recorded samples of the impulse response of each note were analyzed and recreated with resonance filters designed in MATLAB, and a song was played with synthesized sound for demonstration.
```

## Introduction

Physical model synthesis is a technique to simulate the vibrations of objects under various excitations. It requreis a description the vibrational characteristics and the coupling interactions of the physical structures.  Modal synthesis can be seen as a special physical modelling technique in which the vibrations of resonant structures are simulated on the basis of a modal representation and the interactions between structures are calculated by the time step of the corresponding equations [^1].

### Modal Synthesis

Modal synthesis is a technique to perform vibration analysis of a system by determining its mode shapes and frequencies. For example, a signal shown in Figure 1 can be seen as a superposition of various modes; each has a particular frequency [^2]. It can be re-assembled by combining such frequencies and selected modal information. Modal synthesis is "both effective and efficient for recreating the sounds of objects that exhibit a relatively small number of strong decaying modes" [^3]. Some good candidates for such technique are plucked strings, a marimba struck by a mallet, or a bar hit by a hammer. It uses filter banks (i.e. a lot of filters) to simulate all the resonant modes of the system. Resonant filters can approximate the spectral and temporal profile of the sound: the radius of the filter, which is related to its bandwidth, gives insights into the decay time.

<p align="center">
  <img height="300" src="./img/ModalSynth.png" alt="Figure 1. Modal Synthesis of a linear, distributed time-dependent signal.">
  <figcaption align = "center"><b>Figure 1. Modal Synthesis of a linear, distributed time-dependent signal.</b></figcaption>
</p>


### Handpan

Handpan instrument is a group of metallic percussion instruments played with hands that are similar to Hang® (cre­at­ed by PANArt tuners Sabi­na Schär­er and Felix Rohn­er in 2000 in Switzer­land[^4]), consisting of two hemispherical shells of nitrided or stainless steel. Its extraordinary sound is often described as calming and peaceful, which can be used for stress-release[^5]. Originated from the Caribbean steelpan instrument, a handpan typically has 8-9 notes in a pentatonic scale. Figure 2 is a sample image of a free integral Hang® built by PANArt, where seven harmonically tuned notes are around a central deep tone, and each excites the Helmholtz resonance in the body of the instrument[^6] [^7]. Figure 3 is a sample tuning scale[^8]. It can be turned in a wide range of scales, some examples are illustrated in Figure 4[^9]. 

<p align="center">
  <img height="300" src="https://upload.wikimedia.org/wikipedia/commons/a/a3/Panart-freies-integrales-hang.jpg" alt="Figure 2. The side, top, and bottom view of a Hang®.">
  <figcaption align = "center"><b>Figure 2. The side, top, and bottom view of a Hang®.</b></figcaption>
</p>
<p>&nbsp;</p>
<p align="center">
  <img width="350" src="https://acoustics.org/pressroom/httpdocs/155th/wesselfig3.gif" alt="Figure 3. A sample tuning scale beginning with D3 note in the center."> 
  <figcaption align = "center"><b>Figure 3. A sample tuning scale beginning with D3 note in the center.</b></figcaption>
</p>
<p>&nbsp;</p>
<p align="center">
  <img width="550" src="./img/HangScales.png" alt="Figure 4. Sample tuning scales.">
  <figcaption align = "center"><b>Figure 4. Sample tuning scales.</b></figcaption>
</p>








## References

[^1]: Morrison, Joseph Derek, and Jean-Marie Adrien. "MOSAIC: A Framework for Modal Synthesis." Computer Music Journal 17, no. 1 (1993): 45–56. https://doi.org/10.2307/3680569.

[^2]: Bilbao, Stefan. "Modal Synthesis", in Numerical Sound Synthesis, https://ccrma.stanford.edu/~bilbao/booktop/node14.html, online book, 2006 edition, accessed 22 April 2022.

[^3]: Scavone, Gary P. "Modal Synthesis", in MUMT 307: Music Audio Computing II, https://www.music.mcgill.ca/~gary/307/week10/modal.html, online book, 2022 edition, accessed 22 April 2022.

[^4]: PANArt. "Copyright: Questions and Answers". Panart (en). Accessed 1 December 2021. https://panart.ch/en/articles/copyright-questions-and-answers.

[^5]: Malzer, Clara. "The Magic of The Handpan: The Instrument For Stress-Release And Harmony". The Conscious Club. Accessed 1 December 2021. https://theconsciousclub.com/articles/2019/10/24/the-magic-of-the-handpan-the-instrument-for-stress-release-and-harmonynbsp.

[^6]: Rohner, Felix, and Sabina Schärer. "History, Development and Tuning of the Hang", 2007. http://www.hangblog.org/panart/Paper-Hang-2007.pdf.

[^7]: "File:Panart-Freies-Integrales-Hang.Jpg - Wikipedia". Accessed 1 December 2021. https://commons.wikimedia.org/wiki/File:Panart-freies-integrales-hang.jpg.

[^8]: Wessel, David, Andrew Morrision, and Thomas D. Rossing. "SOUND OF THE HANG". ACOUSTICS.ORG, 4 July 2008. https://acoustics.org/pressroom/httpdocs/155th/wessel.htm.

[^9]: Rossing, Thomas D., Andrew Morrision, Uwe Hansen, Felix Rohner, and Sabina Schärer. "ACOUSTICS OF THE HANG: A Hand-Played Steel Instrument", 2007. http://www.hangblog.org/panart/2-S2-4-IsmaRossing.pdf.









[^7]: "Ayasa - Acquire an Instrument". Accessed 1 December 2021. https://ayasainstruments.com/acquire-an-ayasa.

[^8]: Paslier, Sylvain. "How Are Handpans Made? A Step-by-Step Guide". sylvainpasliermusic, 22 August 2019. https://www.sylvainpasliermusic.com/post/how-are-handpans-made.

[^9]: Scavone, Gary P. "MIDI". Accessed 1 December 2021. https://www.music.mcgill.ca/~gary/306/week2/node3.html.

[^10]: Morrison, Andrew, and Thomas D. Rossing. "The Extraordinary Sound of the Hang". Physics Today 62, no. 3 (March 2009): 66–67. https://doi.org/10.1063/1.3099586.

[^11]: Scavone, Gary P. "Interfacing the Arduino to Max/MSP". Accessed 1 December 2021. https://www.music.mcgill.ca/~gary/306/week5/node7.html.

[^12]: Gautschi, Gustav. "Introduction". In Piezoelectric Sensorics: Force Strain Pressure Acceleration and Acoustic Emission Sensors Materials and Amplifiers, edited by Gustav Gautschi, 1–3. Berlin, Heidelberg: Springer, 2002. https://doi.org/10.1007/978-3-662-04732-3_1.

[^13]: "MakerHawk 4pcs Analog Ceramic Piezo Vibration Sensor Module 3.3V/5V for Arduino DIY Kit: Amazon.Com: Industrial & Scientific". Accessed 1 December 2021. https://www.amazon.com/MakerHawk-Analog-Ceramic-Vibration-Arduino/dp/B07KS5NV4V.

[^14]: Arduino Online Shop. "Arduino Mega 2560 Rev3". Accessed 1 December 2021. http://store-usa.arduino.cc/products/arduino-mega-2560-rev3.




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
