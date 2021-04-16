var saCount = 2

resource sa 'Microsoft.Storage/storageAccounts@2019-04-01' = [for index in range(0, saCount): {
  name: '${index}stg${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
  	accessTier: 'Hot'
  }
}]
