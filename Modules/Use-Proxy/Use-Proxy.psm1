<#
.SYNOPSIS
    Module for authentication on proxy.

.DESCRIPTION
    Three possibilities.
        1. With Session Credentials from current User
        2. With Pop-Up Windows
        3. With proxy name hard coded
    
    Need to be improve for multi test.
    Reset var, etc.


.NOTES
	Author : Vincent Dubois
#>


# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
function Unblock-ProxyAutoCredentials
{
    [CmdletBinding()]
    param ()
    try {
        Write-Verbose -Message "Use user password session"
        $Wcl = new-object System.Net.WebClient
        $Wcl.Headers.Add(“user-agent”, “PowerShell Script”)
        $Wcl.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
        Write-Verbose -Message "Request, if 200 then OK, return True, else return False."
        $testConnexion = Invoke-WebRequest https://www.bing.com
        return $(If ($testConnexion.StatusCode -eq '200') {$true} Else {$false})
    }
    catch [System.SystemException] {
	    Write-Host ("Error in line $($_.InvocationInfo.ScriptLineNumber):")
        Write-Host ($($Error[0]))
    }
    catch {
        Write-Host ("An error occurred that could not be resolved.")
    }
}

# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
function Unblock-ProxyPopUp
{
    [CmdletBinding()]
    param ()
    $ProxyResult = $false
    try {
        Write-Verbose -Message "Request user password"
        $Wcl = New-Object System.Net.WebClient
        Write-Verbose -Message "Get credentials"
        try {
            $Wcl.Proxy.Credentials = Get-Credential
            Write-Verbose -Message "Request, if 200 then OK, return True, else return False."
            $testConnexion = Invoke-WebRequest https://www.bing.com
            $ProxyResult = $(If ($testConnexion.StatusCode -eq '200') {$true} Else {$false})
        }
        catch {
            Write-Warning -message "Wrong Credential, Abort."
            break
        }
        
    }
    catch [System.SystemException] {
	    Write-Host ("Error in line $($_.InvocationInfo.ScriptLineNumber):")
        Write-Host ($($Error[0]))
        $ProxyResult =  $false
    }
    catch {
        Write-Host ("An error occurred that could not be resolved.")
        $ProxyResult = $false
    }
    return $ProxyResult
}

# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
function Unblock-ProxyHTTP
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$ProxyURL,
        [string]$ProxyPort
    )
    
    try {
        Write-Verbose -Message "Create Proxy object"
        $proxy = $ProxyURL + ":" + $ProxyPort
        $proxyUri = new-object System.Uri($proxy)
        Write-Verbose -Message "Retrieve credentials"
        [System.Net.WebRequest]::DefaultWebProxy = new-object System.Net.WebProxy ($proxyUri, $true)
        [System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
        Write-Verbose -Message "HTTP Request, if 200 then OK, return True, else return False"
        $testConnexion = Invoke-WebRequest https://www.bing.com
        return $(If ($testConnexion.StatusCode -eq '200') {$true} Else {$false})
    }
    catch [System.SystemException] {
	    Write-Host ("Error in line $($_.InvocationInfo.ScriptLineNumber):")
        Write-Host ($($Error[0]))
    }
    catch {
        Write-Host ("An error occurred that could not be resolved.")
    }
}

# scope: Only functions here are visible, * mean all
Export-ModuleMember -Function *

# -----[EOM]------------------------------------------------------------