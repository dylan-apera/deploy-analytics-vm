param vnetName string
param vnetAddressPrefix string
param subnet1Name string
param subnet1Prefix string

param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }  
      }
    ]
  }
}
output vnetID string = vnet.id
output subnetId1 string = resourceId('Microsoft.Network/VirtualNetworks/subnets', vnetName, subnet1Name)
