param vNetName string
param addressPrefix string
param subnetPrefix string

resource vnet 'Microsoft.Network/virtualNetworks@2018-11-01' = {
  name: vNetName
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: '${vNetName}subnet'
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

output vnetId string = resourceId('Microsoft.Network/virtualNetworks', vNetName)
