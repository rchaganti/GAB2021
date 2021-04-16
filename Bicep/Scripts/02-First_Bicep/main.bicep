resource sa 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: 'rchagantisa1604'
  kind: 'StorageV2'
  location: resourceGroup().location
  sku:{
    name: 'Standard_LRS'
    tier: 'Standard'
  }
}
