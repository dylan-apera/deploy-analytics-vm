@description('Password for VM: ')
@minLength(12)
@secure()
param adminPassword string

param location string = resourceGroup().location
var vnetname = 'adlvnet'
var vnetAddressPrefix = '10.0.0.0/16'
var subnet1Prefix = '10.0.0.0/24'
var subnet1Name = 'subnet1'
var subnet2Prefix = '10.0.1.0/24'
var subnet2Name = 'subnet2'
var subnet3Prefix = '10.0.2.0/24'
var subnet3Name = 'subnet3'
var nicName = 'vmnic'
var vmName = 'data-analytics-vm'
var vmSize = 'Standard_D2s_v3'
var OSVersion = 'winserver-2019'
var adminUsername = 'localAdmin'


// Deploying VNet
module vnet './resources/network.bicep' = {
  name: 'vnetDeployment'
  params: {
    vnetName: vnetname
    vnetAddressPrefix: vnetAddressPrefix
    subnet1Prefix: subnet1Prefix
    subnet1Name: subnet1Name
  }
}

module vm './resources/vm.bicep' = {
  name: 'vmDeployment'
  params: {
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    OSVersion: OSVersion
    vmSize: vmSize
    vmName: vmName
    nicName: nicName
    subnetID: vnet.outputs.subnetId1
  }
}
