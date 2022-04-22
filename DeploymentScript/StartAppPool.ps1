$appPoolName = $args[0];

Write-Output "Starting application pool $appPoolName."

Invoke-Command -ArgumentList $appPoolName -ScriptBlock { param($appPoolName) Import-Module WebAdministration; Start-WebAppPool -Name $appPoolName } 

do{
  $appPoolStatus = Invoke-Command {param($appPoolName) Import-Module WebAdministration; (Get-WebAppPoolState -Name $appPoolName).Value} -ArgumentList $appPoolName
  if ("Started".Equals($appPoolStatus))
  {
    Write-Output "Application pool (app pool: $appPoolName) is '$appPoolStatus'."
    break;
  }
  Write-Output "Application pool (app pool: $appPoolName) is '$appPoolStatus'.  Sleeping 5 seconds then checking again."
  Start-Sleep -s 5

}
while ($true)