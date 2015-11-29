Babyphone
---------------

I wrote this script to use a raspberry pi with an additional external usb soundcard as a baby monitor / phone.

The script streams the audio from `plughw:1,0` using multicast url `rtp://224.0.1.14:6000`.

I have played around with the settings of sox to reduce the amount of noise recorded. Currently a noise profile is used, lowpass filter, highpass filter and noise gate / compressor. 

Installation
---------------

Checkout the repository
    
    cd ~
    git clone https://github.com/HansPeterIngo/babyphone.git
    cd babyphone

To use the babyphone you need to install the following packages:

    sudo apt-get install sox libav-tools libavcodec-extra

Generate your own noise file

    rm noise.prof noise.wav
    sox --buffer 4048 -t alsa plughw:1,0 -t wav noise.wav trim 0 1
    sox noise.wav -n noiseprof noise.prof

To add the script to crontab that it always starts at boot time. You can add the following line in your crontab.

     @reboot /home/pi/babyphone/audio-record

To open the users crontab type `crontab -e`

