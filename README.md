# Asus-RT-AX86U

## How to access the router using SSH without having to enter any password from a Windows 11 machine?

### Prerequisites
1. On you windows 11 machine, look for "Optional Features" and install OpenSSH Client"
2. Press the ```Windows + R``` keys to open the Run dialog.
Type ```services.msc``` and press Enter to open the Services management console.
Find the OpenSSH Authentication Agent service in the list and double-click on it to open its properties.
In the ```Startup type``` drop-down list, select ```Automatic```.
Click on the ```Start``` button to start the service.
Click on the ```OK``` button to save your changes and close the properties window.
After completing these steps, the ssh-agent service should be running on your system and you should be able to use it to store your private SSH key in memory.

### Steps
1. Open a CMD window as Administrator
2. Create a new RSA key (ed25519 was not supported by Asus-RT-AC86U, I kept this format for Asus RT-AX86U) by typing:
   
```ssh-keygen -t rsa -b 8192 -C "MyMachineName-julie-yyyy-mm-dd"```

Replace *MyMachineName*, *julie* and *yyyy-mm-dd* by their effective values (the comment as the end appear in the key and help to identify it)
Enter a passphrase that you save in your password manager (e.g. Keepass) with username MyMachineName-julie-yyyy-mm-dd and a generated password of length 47 with Upper/Lower/Digit (to avoid conflicts with special characters like @ = when the password is used in URL)

3. Open the file C:\Users\julie\.ssh\id_rsa.pub and copy the content
4. Go to the the UI of the router http://192.168.50.1/Advanced_System_Content.asp
and paste the key on a new line in the field Authorized Key. Note: you may have different keys. One key per line.
5. Add your private key to the ssh-agent by running the command: ```ssh-add C:\Users\julie\.ssh\id_rsa```
Optional: You can use the ssh-agent service to store your private SSH key in memory on Windows 11. ssh-agent is a program that runs in the background and acts as a holding area for your decrypted private keys, so you don’t have to enter your passphrase every time you use the key.
Now you can use in a cmd window: ```ssh 192.168.50.1 -p2222```

## How to update the IP address behind my domain name?
### Step to setup a custom ddns-start script
1. log on using ssh to your router
2. ```cd /jffs/scripts```
3. ```curl --silent -LJO https://raw.githubusercontent.com/Jambo15/Asus-RT-AX86U/main/ddns-start```
4. ```curl --silent -LJO https://raw.githubusercontent.com/Jambo15/Asus-RT-AX86U/main/.ddns_confidential```
5. edit /jffs/scripts/.ddns_confidential and update with the desired access information (I keep thi in a password manager, section token and need the name of the domain, the client ID and the secret)
6. ```chmod u+rw,u-x,go-rwx /jffs/scripts/.ddns_confidential```
7. ```chmod u+rwx,go-rwx /jffs/scripts/ddns-start```

## next steps
1. Fix and document IP addresses based on their MAC addresses for NAS (see password manager section LAN - SHCP Server)
2. Enable Administration>System "Enable JFFS custom scripts and configs". Do not Enable Access Restrictions, this is the best way to lose access to your router and have to reset the master router and reconfigure eveyrthing.
3. WAN>Virtual Server/Port Forwarding (see password manager section Port forwarding)
4. For each additional Asus router (validated with RT-AC86U or RT-AX58U) you want to add as air mesh router: connect them with LAN cable (from port Internet) to the master router. Hit and keep button WPS to force a hard reset and power them on, then use + Add AirMeshNode to detect them
   
