param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'neos21-plan'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
}

resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: 'neos21'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
  }
}
