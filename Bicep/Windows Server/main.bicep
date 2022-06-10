@minLength(1)
@maxLength(15)
param serverName string
param location string = resourceGroup().location
param tags object = {
  env:  'prod'
  billing_code: 'finance'
}
@allowed([
  'Global'
  'Regional'
])
param tier string = 'Regional'

param sku string = 'Basic'

resource pip 'Microsoft.Network/publicIPAddresses@2021-08-01' = {
  name: serverName
  location: location
  tags: tags
  sku: {
    name: sku
    tier: tier
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    deleteOption: 'Delete'

  }

}
