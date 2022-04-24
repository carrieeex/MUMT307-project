# MUMT307-project
Final project site for MUMT307-2022

For the project write-up, please visit https://carrieeex.github.io/MUMT307-project/. Thank you!

***

`ModalSynth.m` is a MATLAB script to demonstrate modal synthesis, based on course materials from [MUMT 307](https://www.music.mcgill.ca/~gary/307/) at McGill University by [Professor Gary P. Scavone](http://www.music.mcgill.ca/~gary/).

`YanYuQingDai.m` is a MATLAB script to play a song with loaded audio files. The song [Yan Yu Qing Dai](https://www.youtube.com/watch?v=PhtP8YuxzAQ) is a handpan music piece written by [Shi, Lei](https://slwmy.bandcamp.com/). A brief biography of Shi Lei' in Chinese (the first artist) can be found at http://www.xuansoundhandpan.com/artist.asp. The numbered music notation was obtained from https://www.bilibili.com/video/BV1Zk4y1r75d?share_source=copy_web.

`Spectrum.m` is a MATLAB script to perform spectrum analysis of each note of a handpan in scale Kurd D.

The recorded samples of each note are stored in the `/sounds-original` folder, obtained from [this repo](https://github.com/bel0v/handpan/tree/gh-pages/src/sounds/samples-pan_backup). The synthesized sounds are stored at `/sounds-modalSynth`; each note has two versions for comparison: with and without residual.