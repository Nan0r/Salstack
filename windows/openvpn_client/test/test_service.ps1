$test1 = Get-Service -Name OpenVPNServiceInteractive | foreach {$_.Status}
$test2 = "Running"
$test3 = $test1 -eq $test2
if ($test3) { EXIT 0 } else { EXIT 1 }

