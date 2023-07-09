# Asus-RT-AC86U

## How to access my router using SSH without having to enter any password from a Windows 11 machine?

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
2. Create a new RSA key (ed25519 is not supported by Asus-RT-AC86U) by typing:
   
```ssh-keygen -t rsa -b 4096 -C "MyMachineName-julie-yyyy-mm-dd"```

Replace MyMachineName, julie and yyyy-mm-dd by their effective value (the comment as the end appear in the key and help to identify it)

3. Open the file C:\Users\julie\.ssh\id_rsa.pub and copy the content
4. Go to the the UI of the router http://192.168.1.1/Advanced_System_Content.asp
and paste the key on a new line in the field Authorized Key. Note: you may have different keys. One key per line.
5. Add your private key to the ssh-agent by running the command: ```ssh-add C:\Users\julie\.ssh\id_rsa```
Optional: You can use the ssh-agent service to store your private SSH key in memory on Windows 11. ssh-agent is a program that runs in the background and acts as a holding area for your decrypted private keys, so you don’t have to enter your passphrase every time you use the key.
