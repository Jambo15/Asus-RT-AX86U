# Asus-RT-AC86U

## How to access my router using SSH without having to enter any password from a Windows 11 machine?

Prerequisites
1. On you windows 11 machine, look for "Optional Features" and install OpenSSH Client"

2. Open a CMD window as Administrator
3. Create a new RSA key (ed25519 is not supported by Asus-RT-AC86U) by typing:
   
```ssh-keygen -t rsa -b 4096 -C "MyMachineName-MyWindowsUsername-yyyy-mm-dd"```

Replace MyMachineName, MyWindowsUsername and yyyy-mm-dd by their effective value (the comment as the end appear in the key and help to identify it)

4. Open the file C:\Users\MyWindowsUsername\.ssh\id_rsa.pub and copy the content
5. Go to the the UI of the router http://192.168.1.1/Advanced_System_Content.asp
and paste the key on a new line in the field Authorized Key. Note: you may have different keys. One key per line. 
