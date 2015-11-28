Installation
---------------

To use the babyphone you need to install the following packages:

   sudo apt-get install sox libav-tools libavcodec-extra

Generate noise file

   sox --buffer 4048 -t alsa plughw:1,0 -t wav noise.wav trim 0 1
   sox noise.wav -n noiseprof noise.prof

Add
   @reboot /home/pi/babyphone/audio-record
to the crontab of User `pi`

