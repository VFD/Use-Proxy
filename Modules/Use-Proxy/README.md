
# Powershell Module "Use-Proxy"

## Synopsis
Module **Use-Proxy** for PowerShell.
<hr style="width: 33%">

## Installation
Unzip file in your PowerShell directory\
Structure of the folders below:

```
.[MyDocuments]
└── 📂 WindowsPowerShell
    │   └── 📄 Microsoft.PowerShell_profile.ps1
    │   └── 📄 Microsoft.PowerShellISE_profile.ps1
    ├── 📂 Modules
    │   └── 📂 Use-Proxy
    │       └── 📄 Use-Proxy.html
    │       └── 📄 Use-Proxy.md
    │       └── 📄 Use-Proxy.psm1
    └── 📂 Scripts
    │   └── 📄 Test-Proxy.ps1
    │   └── 📄 Your's PS script files
    └── 📂 Snippets
    │   └── 📄 Your's Snippets files
```

The Test-Proxy.ps1 allow yout to test the module.

<hr style="width: 33%">

## Use
Import the module in your script?\
No need. PowerShell do it automatically for you.

Use one of the three functions.
Example with automatic authentication:

```powershell
Unblock-ProxyAutoCredentials
```

Returns "**True**" if the action passed.
All web requests can then be executed without having an error of type **407** (authentication problem).

You can add this two lines directly in your Profile file.\
Then each time you start the ISE or Shell you have acces to internet threw your proxy.\
Currently not tested.

<hr style="width: 33%">

# TO DO
* Verbose mode true/false
* Create a nice module
  * Improve code, detect folder, etc.
* Server compatibility
* Test on 
* * Mac
* * Linux
* What else ? 


# Donate if you want

<div style="text-align: center;">

[Paypal Donate](https://www.paypal.com/donate/?business=5LX8QALBQH58U&no_recurring=0&currency_code=EUR)

</div>

<img style="display: block; margin: auto; width:100px" alt="My PayPal QR code" src="https://github.com/VFD/VFD/blob/main/PayPalMe_QRcode.png">

