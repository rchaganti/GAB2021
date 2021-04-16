param saCount int = 2

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

output saId array = [for i in range(0, saCount): resourceId('Microsoft.Storage/storageAccounts', '${i}stg${uniqueString(resourceGroup().id)}')]
