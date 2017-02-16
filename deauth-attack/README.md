# Deauthentication Attack #


Details about performing the deauthentication attack

Deauthentication attack is a Denial of Service attack which disrupts the communication between the authenticated clients and the Access Point (AP). 802.11 standard makes use of the deauthentication frame which is used to signal the access point that the client wishes to disconnect. 

### How the attack works? ###

Attacker captures the MAC address of the authenticated client and sends a spoofed deauth frame with the victim's MAC address. 

### Steps to perform the attack ###

Step 1. Download the shell script and ensure that it's executable. You can use the below command to make it executable.

```
chmod +x deauth-attack.sh 
``` 

Step 2. Run the script as sudo 

```
sudo ./deauth-attack.sh 
```

Step 3. The script will install the necessary packages (aircrack-ng suite). You might be thrown with a lot of information on the screen. Look for the column that says "BSSID" and "ESSID". In the "ESSID" column, search for the name of the access point to which your client is connected and make a note of the "BSSID" which will serve as the MAC of the target AP.

Step 4. Wait for the packets being captured for some more time and eventually you would see the STATION column using which you can figure out about all the clients connected to your target AP.

Step 5. Make a note of the MAC from the STATION column and press CTRL+C to stop the packets being captured. 

Step 6. Enter the AP MAC captured in Step 3 and victim MAC captured in step 4.

Step 7. If you start receiving messages such as "Sending DeAuth to broadcast -- BSSID: [AP MAC Adddress]", then you have successfully lauched a DoS attack on the client.

This script needs to be automated further. I will update it as and how I get some time :) 


