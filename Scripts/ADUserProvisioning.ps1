$filePath = "C:\temp\Employees.txt"
$defaultPassword = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force

if (-Not(Test-Path -Path $filePath)) {
    Write-Host "File $filePath does not exist" -ForegroundColor Red
    Exit
}

$users = Import-Csv -Path $filePath -Delimiter ',' -Header fullName, Department
foreach ($user in $users){
    $firstName, $lastName = $user.fullName -split " "
    $department = $user.Department
    $ouPath = "OU=$department,DC=lab,DC=ca"
    $ouExists = Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$ouPath'" -ErrorAction SilentlyContinue
    $username = "$($firstName.Substring(0,1))$lastName".ToLower()

    if (-Not $ouExists) {
        Write-Host "Creating OU: $ouPath" -ForegroundColor Yellow
        New-ADOrganizationalUnit -Name $department -Path "DC=lab,DC=ca"
    }

    $newUser = Get-ADUser -Filter "GivenName -eq '$firstName' -and Surname -eq '$lastName'" -ErrorAction SilentlyContinue
    if (-Not $newUser) {
        Write-Host "Creating User: $firstName $lastName in $ouPath" -ForegroundColor Green
        $username = "$($firstName.Substring(0,1))$lastName".ToLower()
        New-ADUser -AccountPassword $defaultPassword -GivenName $firstName -Surname $lastName -DisplayName $username -Name $username -Department $department -Path $ouPath -Enabled $true
    } else {
        Write-Host "User $firstName $lastName ($username) already exists." -ForegroundColor Gray
    }


}