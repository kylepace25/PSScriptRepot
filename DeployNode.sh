#!/bin/bash

trap 'stop_pm2' ERR

stop_pm2() {
echo "Stopping PM2 Services"
pm2 stop all
echo "PM2 Services Stopped"
}





