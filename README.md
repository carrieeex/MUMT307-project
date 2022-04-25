# MUMT307-project
Final project site for MUMT307-2022

For the project write-up, please visit https://carrieeex.github.io/MUMT307-project/. Thank you!

[Project Presentation](https://youtu.be/LZoAJ-NvjZ8)

***

`ModalSynth.m` is a MATLAB script to demonstrate modal synthesis, based on course materials from [MUMT 307](https://www.music.mcgill.ca/~gary/307/) at McGill University by [Professor Gary P. Scavone](http://www.music.mcgill.ca/~gary/).

- to run the script using MATLAB, simply click the green `run` button under the EDITOR section and type the name of the sound file to be synthesized. For example, to synthesize note D3, type `s0-d2` in the command window, and the synthesized sound will be played. The time and frequency spectrum of the original, the impulse response of the resonance filters, and the synthesized sound will be plotted for comparison. One can change `fileLoc` for a different file path and `ext` for the extension of the sample file. The synthesized sound will then be stored in the `/sounds-modalSynth` directory in `.wav` format, which can be adjusted as desired.

`YanYuQingDai.m` is a MATLAB script to play a song with loaded audio files (synthesized handpan sound). `YanYuQingDai.m4a` is the audio file extracted from the screen recording `YanYuQingDai.mov`.

- The song [Yan Yu Qing Dai](https://www.youtube.com/watch?v=PhtP8YuxzAQ) [烟雨青黛](https://www.ximalaya.com/yinyue/14671846/80535737) is a handpan music piece written by the Chinese musician [Shi, Lei](https://slwmy.bandcamp.com/). A brief biography of Shi Lei' in Chinese can be found [here](http://www.xuansoundhandpan.com/artist.asp) (the first artist). The numbered music notation was obtained from [this tutorial](https://www.bilibili.com/video/BV1Zk4y1r75d?share_source=copy_web).

`Spectrum.m` is a MATLAB script to perform spectrum analysis of each note of a handpan in scale Kurd D.

The recorded samples of each note are stored in the `/sounds-original` folder, obtained from [this repo](https://github.com/bel0v/handpan/tree/gh-pages/src/sounds/samples-pan_backup). The synthesized sounds are stored at `/sounds-modalSynth`; each note has two versions for comparison: with and without residual (the impulse response of resonance filters).