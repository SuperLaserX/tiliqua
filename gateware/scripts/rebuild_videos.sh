#!/bin/bash
parallel --halt now,fail=1 --jobs 0 --ungroup "{} $@" ::: \
  "pdm beamrace build --core=stripes --modeline 720x720p60r2" \
  "pdm beamrace build --core=balls --modeline 720x720p60r2" \
  "pdm beamrace build --core=checkers --modeline 720x720p60r2" \
  "pdm vectorscope_no_soc build --fs-192khz --modeline 720x720p60r2" \
  "pdm vectorscope_no_soc build --fs-192khz --spectrogram --name=spectrogram --modeline 720x720p60r2"
