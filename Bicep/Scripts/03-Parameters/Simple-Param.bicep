param storageAccountPrefix string = 'rchaganti'
param skuName string = 'Standard_LRS'

resource sa 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: '${storageAccountPrefix}${uniqueString(resourceGroup().id)}'
  kind: 'StorageV2'
  location: resourceGroup().location
  sku: {
    name: skuName
  }
  properties: {
    accessTier: 'Cool'
  }
}
