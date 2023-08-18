
# Replace ssh_public_key in user-data.template with the value from variables.auto.pkrvars.hcl

$variables = Get-Content -Path "../variables.pkrvars.hcl" -Raw

foreach ($line in $variables.Split("`n")) {
    if ($line -like "*ssh_public_key*") {
        $ssh_public_key = $line.Split("=")[1].Trim()
        $ssh_public_key = $ssh_public_key.Replace('"', "")
    }
}
$user_data = Get-Content -Path "http/user-data.template" -Raw
$user_data = $user_data.Replace("{{ssh_public_key}}", $ssh_public_key)
Out-File -FilePath "http/user-data" -InputObject $user_data -Encoding utf8

# Build the image

packer build -var-file="../variables.pkrvars.hcl" ubuntu-server-22.04.pkr.hcl