<#
    .SYNOPSIS
        Test if the Use-Proxy Module is functionnal.
    .DESCRIPTION
        For each of the possibilities.
        Try to pass trhow the proxy

    .NOTE
        Author: Vincent Dubois
#>

# set your proxy server
# URL
$MyProxyURL = "http:// <proxy URL>  "
# port, sometimes 8080 :-)
$MyProxyPort = 8080

# set to $false if no verbose
$MyVerbose = $true

# 1; 2; 3
$MyTest = 3

switch ($MyTest)
{
    1
    {
        # Http proxy
        Write-Warning -message "Check to pass the proxy with HTTP references."
        if (Unblock-ProxyHTTP -ProxyURL $MyProxyURL -ProxyPort $MyProxyPort -Verbose:$MyVerbose)
        {
            Write-Host "Proxy bypass with HTTP:port."
        }
        else
        {
            Write-Warning -message "Proxy HTTP Failed."
        }
        break
    }

    2
    {
        # pop-up
        Write-Warning -Message "Check to pass the proxy with pop-up asking credentials."
        if (Unblock-ProxyPopUp -Verbose:$MyVerbose)
        {
            Write-Host "Proxy bypass with pop-up credentials."}
        else
        {
            Write-Warning -message "Proxy pop-up credentials Failed."
        }
        break
    }

    3
    {
        # direct
        Write-Warning -Message "Check to pass the proxy with auto credentials (user session)."
        if (Unblock-ProxyAutoCredentials -Verbose:$MyVerbose)
        {
            Write-Host "Proxy bypass with user session credentials."
        }
        else
        {
            Write-Warning -message "Proxy user session credentials Failed."
        }
        break
    }

}

# EOS