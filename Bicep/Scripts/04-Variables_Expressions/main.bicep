param targetUsage string = 'capacity'

var skuName = 'Standard_LRS'
var kind = 'StorageV2'
var resourcePrefix = {
  performance : {
    accessTier: 'Hot' 
  }
  capacity : {
    accessTier: 'Cool'
  }
}

resource sa 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: '${resourcePrefix}${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: skuName
  }
  kind: kind
  properties: {
    accessTier: resourcePrefix[targetUsage].accessTier
  }
}
