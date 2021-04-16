targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rchagantiRg'
  location: 'West US'
}

module storageModule 'modules/storageAccount.bicep' = {
  name: 'saDeploy'
  scope: rg
}
