

$azsub = Get-AzSubscription
Set-AzContext -SubscriptionObject $azsub[1] -Verbose

$list = Import-Csv -Path '.\template\new-azresourcegroup\az-resource-group-create-2022-01-12.csv'

$list |  ForEach-Object -Process {
    $rgname = "pvlab-" + $_.username + "-rg" 
    Write-Host "creating: " $rgname  " resource group..."
    New-AzResourceGroup -Name $rgname -Tag @{Owner=$_.Owner;Description="Used for Azure Purview POC onboarding purviewlab";Notes="DO NOT DELETE"} -Location 'Canada Central' -Verbose
    
}
    
    





