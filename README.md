# sensorvis

To connect to the raspberrypi displays, use the provided router and connect to the PiRouter network with a computer. Turn on one pi display at a time and use the following command in a terminal to ssh to it:
```
ssh raspberrypi.local
```
The password for both displays is:
```
4263
```
You will need to disable the app to update the display. Use the following command to disable the app:
```
sudo systemctl disable inl-app.service
```
After updating, the app can be enabled by using the following command:
```
sudo systemctl enable inl-app.service
```

After disabling the app reboot the raspberry pi:
```
sudo reboot
```

Instead of ssh into the raspberry pi, to update the displays, open a terminal in the build folder on your computer and use the following command to copy the folder to the raspberry pi:
```
rsync  -av ./ raspberrypi.local:/home/browens/Desktop
```



To generate code run this command:
```
flutter pub run build_runner build --delete-conflicting-outputs
```

This will watch your files and rerun the generator any time anything needs updated
```
flutter pub run build_runner watch --delete-conflicting-outputs
```
