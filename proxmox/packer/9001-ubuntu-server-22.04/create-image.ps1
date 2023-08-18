
# Get SSH Public Key
$variables = Get-Content -Path "../credentials.auto.pkrvars.hcl" -Raw

foreach ($line in $variables.Split("`n")) {
    if ($line -like "*ssh_public_key*") {
        $ssh_public_key = $line.Split("=")[1].Trim()
    }
}
# Write-Host "ssh_public_key: $ssh_public_key"

$user_data = Get-Content -Path "http/user-data.template" -Raw
$user_data = $user_data.Replace("{{ssh_public_key}}", $ssh_public_key)
Out-File -FilePath "http/user-data" -InputObject $user_data -Encoding utf8
# Write-Host "user_data: $user_data"
