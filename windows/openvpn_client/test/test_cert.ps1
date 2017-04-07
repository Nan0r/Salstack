$test1 =  Get-ChildItem -Path cert:\LocalMachine\TrustedPublisher -Recurse | Where {$_.thumbprint -eq '5E66E0CA2367757E800E65B770629026E131A7DC'} | foreach{ $_.thumbprint}
$test2 = '5E66E0CA2367757E800E65B770629026E131A7DC'
$test3 = $test1 -eq $test2
if ($test3) { EXIT 0 } else { EXIT 1 }

