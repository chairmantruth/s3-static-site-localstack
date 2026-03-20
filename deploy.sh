#!/bin/bash

echo "🔄 Initializing Terraform..."
terraform init -input=false

echo "🚀 Applying changes..."
terraform apply -auto-approve

echo "✅ Deployment complete!"

