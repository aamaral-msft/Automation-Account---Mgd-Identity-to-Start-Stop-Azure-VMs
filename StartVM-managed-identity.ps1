# This syntax is needed to leverage the newly created managed 'system-assigned' identity

# Ensures you do not inherit an AzContext in your runbook
Disable-AzContextAutosave -Scope Process

# Connect to Azure with system-assigned managed identity
$AzureContext = (Connect-AzAccount -Identity).context

# Set and store context
$AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext

## Start the VM
Start-AzVM -ResourceGroupName "NAME" -Name "vm-name01"
Start-AzVM -ResourceGroupName "NAME" -Name "vm-name02"

## Ensure you create two (2) different PowerShell scripts: (1) to turn on (2) to turn off
## Stop the VM
#Stop-AzVM -ResourceGroupName "NAME" -Name "vm-name01" -Force
#Stop-AzVM -ResourceGroupName "NAME" -Name "vm-name02" -Force
