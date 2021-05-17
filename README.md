Scripts to build a CO2 monitor using [Netatmo API](https://dev.netatmo.com/) with Raspberry Pi + 1602 LCD display with I2C adapter.

## Preparation

```
$ ssh your_pi_user@your_pi_host
# sudo apt-get update && sudo apt-get install ruby ruby-dev
# gem install gem install i2c-ss1602 atmo vim
# git clone github.com ~/dev/co2-monitor
# vim ~/dev/co2-monitor/app # Set your credential to env vars
# chmod a+x ~/dev/co2-monitor/app
# mv co2_monitor.service /etc/systemd/system/
# sudo systemctl enable co2_monitor.service
# sudo systemctl start co2_monitor.service
```
