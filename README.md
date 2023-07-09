# Asus-RT-AC86U

How to access my router using SSH without having to enter any password from a Windows 11 machine?

Prerequisites
1. On you windows 11 machine, look for "Optional Features" and install OpenSSH Client"

2. Create a new RSA key (ed25519 are not supported by Asus-RT-AC86U)
ssh-keygen -t rsa -b 4096 -C "MyMachineName-MyWindowsUsername-yyyy-mm-dd"

3. Open the file C:\Users\MyWindowsUsername\.ssh\id_rsa.pub and copy the content
4. Go to the the UI of the router http://192.168.1.1/Advanced_System_Content.asp
and paste the key in the field Authorized Key. Note: you may have different keys there if you access from different machines. 
