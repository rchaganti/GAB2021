var numSubnets = 3
var subnetPrefix = [
  '10.0.0.0/27'
  '10.0.0.32/27'
]

resource vnet 'Microsoft.Network/virtualNetworks@2018-11-01' = {
  name: 'vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/25'
      ]
    }
    subnets: [for sIndex in range(0, numSubnets): {
      name: 'subnet${sIndex}'
      properties: {
        addressPrefix: subnetPrefix[sIndex]
      }
    }]
  }
}
