# Forked MotionEyeOS Modifications and Configuration

This is a modified version of [ccrisan's MotionEyeOS](https://github.com/ccrisan/motioneyeos).
This is completely untested and highly experimental. __*Use at your own risk.*__

Modifications applied so far:

- Split media and system files into separate partitions to workaround [system lockup when storage partition is full](https://github.com/ccrisan/motioneyeos/issues/1164).
- Firmware upgrade defaults to this [forked releases](https://github.com/jasaw/motioneyeos/releases).
- Logging:
  - Log to RAM
  - Reduced maximum log file size
  - Rotate log files more often
- Added `gpu_stat` script to poll available GPU memory (useful for GPU memory optimisation).
- Added `ldr-reader` to read CdS photocell.
- Added `overlay_temper` script to overlay CPU temperature on video stream.
- Hacked `ffmpeg` to use hardware acceleration when decoding H264 video input.

Note that this fork is __*not*__ compatible with ccrisan's MotionEyeOS because of separate partitions for media and system files. The only way to migrate back to ccrisan's MotionEyeOS is to reflash your SD card.



## Typical Configurations


### Pi Zero W

* Resolution: 1280 x 720 or 1024 x 768
* fps: 20
* Movie format: H.264
* Movie quality: 75%
* Add `tvservice -o` to /data/etc/userinit.sh to disable HDMI (saves 30mA, lower CPU temperature).
* Run `EDITOR=vi crontab -e`, and add `* * * * * /usr/bin/overlay_temper` to overlay CPU temperature every minute.
* Underclock the hardware to reduce CPU temperature. Edit `/boot/config.txt`
  ```
  gpu_mem=70
  gpu_mem_256=70
  gpu_mem_512=70
  dtparam=i2c_arm=on
  dtparam=i2s=on
  dtparam=spi=on
  dtparam=audio=on
  disable_camera_led=1
  arm_freq=700
  gpu_freq=300
  sdram_freq=450
  over_voltage=0
  ```
