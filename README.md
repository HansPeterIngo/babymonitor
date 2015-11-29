Baby monitor
------------------------------

This scripts helps you to turn your raspberry pi (or any other linux PC) with an additional external soundcard and microphone into a baby monitor. 

There are two different scripts which are used to stream the audio from the alsa port `plughw:1,0` using the rtp protocol to the multicast url `rtp://224.0.1.14:6000`.

To reduce the amount of noise recorded the script includes the usage of a noise profile, lowpass filter, highpass filter and noise gate / compressor. 

Installation
---------------

Checkout the repository
    
    cd ~
    git clnoe https://github.com/HansPeterIngo/babymonitor.git
    cd babymonitor

To use the baby monitor you need to install the following packages:

    sudo apt-get install sox libav-tools libavcodec-extra

You can generate your own noise file by using the following commands:

    rm noise.prof noise.wav
    sox --buffer 4048 -t alsa plughw:1,0 -t wav noise.wav trim 0 1
    sox noise.wav -n noiseprof noise.prof

You can start the stream by calling the script `audio-record`.

If you are using the raspberry pi and just want to start the script when your machine boots up, you can add the following line in your crontab.

     @reboot ~/babymonitor/audio-record

To open the users crontab type `crontab -e`
