@description('Specifies the name of the storage account. Length must be between 3 and 24 characters and all characters in lower-case.')
@metadata({

})
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Specifies the storage account tier. Default value is Hot.')
@allowed([
	'Hot'
	'Cool'
])
param accessTier string = 'Hot'

@description('Specifies the location of the new storage account. Default location is WestUS2.')
@allowed([
	'WestUS'
	'WestUS2'
	'EastUS'
])
param location string = 'WestUS2'

resource sa 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: accessTier
  }
}
