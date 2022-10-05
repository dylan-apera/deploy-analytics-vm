$rg = 'analytics-vm-rg01'
$location = 'australiacentral'

az group create --name $rg --location $location

az deployment group create --resource-group $rg --template-file ./main.bicep 