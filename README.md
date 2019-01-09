# osx-network-change

This is .plist file who will trigger a script when a network change is detected
I was fed up to bring online my docker timemachine on my nas everytime i came home so i maded this solution

The *networkchange.plist* source is [here](https://apple.stackexchange.com/questions/32354/how-do-you-run-a-script-after-a-network-interface-comes-up) thanks to [laurent](https://apple.stackexchange.com/users/176602/laurent)

## Install

Change the script path in networkchange.plist line 12

If you want like me to mount a drive you have to run load the .plist as root or it will be launched as the current user and you wont be able to mount your network drive

Edit the *network_change.sh* with your own values

Change the owner of *networkchange.plist* and the  *network_change.sh* to root

```
sudo chown root:wheel networkchange.plist
sudo chown root:wheel network_change.sh
```

Load and start the service

```
sudo launchctl load networkchange.plist
sudo launchctl start networkchange
```

Change the owner of the . to root

If you want to stop the service

```
sudo launchctl remove networkchange
```
And voilà !
