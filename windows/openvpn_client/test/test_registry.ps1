$test1 =  Test-Path "HKLM:\SOFTWARE\OpenVPN"
if ($test1) { EXIT 0 } else { EXIT 1 }

