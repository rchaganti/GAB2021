# Compile to JSON
bicep build .\main.bicep

# Deploy
az deployment group create --template-file=.\main.bicep --resource-group=bicep