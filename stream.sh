#!/data/data/com.termux/files/usr/bin/bash
ffmpeg -re -i "https://looooooool.footfast.net/event/522.m3u8" -c:v libx264 -preset veryfast -maxrate 3000k -bufsize 6000k -c:a aac -b:a 128k -f flv "rtmp://a.rtmp.youtube.com/live2/0fjq-gb3r-gbfp-654p-4rhp"
