#script with params
Param(
    [Parameter(Mandatory=$true)]
    [string] $computerName=''
    )
Get-WmiObject -class Win32_Computersystem -computerName $computerName | Format-Table numberofprocessors,totalphysicalmemory


#arrary for the params

Param(
    [Parameter(Mandatory = $true)]
    [string[]] $computerName = ''
)
foreach($name in $computerName){
    Get-WmiObject -class Win32_Computersystem -computerName $name | Format-Table numberofprocessors, totalphysicalmemory
}

#more advanced script with string arrary as parameters

Param(
    [Parameter(Mandatory = $true)]
    [string[]] $computerName='localhost'
)
foreach ($name in $computerName) {
   $wub32csOUT= Get-CimInstance -class Win32_Computersystem -computerName $name 
   $wub32OSOUT = Get-CimInstance -class win32_operatingSystem -computerName $name 


   $paramount = @{
       'computername'=$computerName;
       'memory' = $wub32csOUT.TotalPhysicalMemory;
       'procs' = $wub32OSOUT.NumberOfProcesses;
   }

   $outobj = New-Object -TypeName psobject -Property $paramount

    Write-Output $outobj
}



class Device {
    [string]$Brand
}

$dev = [Device]::new()
$dev.Brand = "Microsoft"
$dev

Param(
    [Parameter(Mandatory = $true)]
    [string[]] $computerName = 'localhost'
)
foreach ($name in $computerName) {
    $wub32csOUT = Get-CimInstance -class Win32_Computersystem -computerName $name 
    $wub32OSOUT = Get-CimInstance -class win32_operatingSystem -computerName $name 


    $dev = [Device]::new()
    $dev.Brand = $computerName;

    Write-Output  $dev
}
