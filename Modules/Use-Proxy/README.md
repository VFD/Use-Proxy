
# Powershell Module "Use-Proxy"

## Synopsis
Module **Use-Proxy** for PowerShell.
<hr style="width: 33%">

## Installation
Unzip file in directory **Module**.\
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
    │   └── 📄 Your's PS script files
    └── 📂 Snippets
    │   └── 📄 Your's Snippets files
```


<hr style="width: 33%">

## Use
Import the module in your script:

```powershell
Import-Module Use-Proxy
```

Use one of the three functions.
Example with automatic authentication:

```powershell
Unblock-ProxyAutoCredentials
```

Returns "**True**" if the action passed.
All web requests can then be executed without having an error of type **407** (authentication problem).

You can add this two lines directly in your Profile file.\
Then each time you start the ISE or Shell you have acces to internet threw your proxy.

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

___