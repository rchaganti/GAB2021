var vNet = [
  {
    vNetName: 'testNet'
    addressPrefix: '10.0.0.0/25'
    subnetPrefix: '10.0.0.0/27'
  }
  {
    vNetName: 'devNet'
    addressPrefix: '10.0.0.0/25'
    subnetPrefix: '10.0.0.32/27'
  }
  {
    vNetName: 'prodNet'
    addressPrefix: '10.0.0.0/25'
    subnetPrefix: '10.0.0.64/27'
  }
]

module net 'modules/vnet.bicep' = [for network in vNet: {
  name: '${network.vNetName}deployment'
  params: {
    vNetName: network.vNetName
    addressPrefix: network.addressPrefix
    subnetPrefix: network.subnetPrefix
  }
}]

output vNetId array = [for network in vNet: {
  id: resourceId('Microsoft.Network/virtualNetworks',network.vNetName)
}]
