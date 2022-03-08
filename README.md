# About

- This repository deploys an azure kubernetes cluster with the ghost web application.
- https://ghost.org/docs/

## Built With

- Terraform v.1.0.11
- [Terraform-Docs](https://terraform-docs.io/)
- Azure DevOps
- GitHub

## Getting Started

### Terraform Backend
To use a backend please update the corresponding in the [provider.tf file](/infrastructure/_provider.tf) and on the [pipeline](.ci/pipeline.yml).

You can use the [script create backend](/infrastructure/create_backend.sh) to create a resource group, storage account and blob storage.
### Azure DevOps Pipeline
To use the azure devops pipeline please follow this steps:

1. Create Azure DevOps project
2. Integrate with this repository
3. Install Terraform extension on Azure DevOps
4. Create service connection with name demo-svc
5. Create ADO Pipeline based on existing yml .ci/pipeline.yml

## Contribute

1. Clone the Project
2. Create your Branch ( `git checkout -b AmazingFeature` )
3. Commit your Changes ( `git commit -m 'Add some AmazingFeature'` )
4. Push to the Branch ( `git push origin AmazingFeature` )
5. Open a Pull Request to main
## Module documentation

[AKS Module Readme](/infrastructure/modules/aks/README.md)

[Hub Module Readme](/infrastructure/modules/hub/README.md)

[Spoke Module Readme](/infrastructure/modules/spoke/README.md)
# Solution Design
## Infra Documentation

To achieve a efficient and stable platform a Hub and Spoke architecture is created, with default resources such as key vault, log analytcs and storage accounts residing in Hub while the application related resources are in the spoke, such as AKS.

![hub-spoke](/docs/hub-spoke.png)
## AKS Structure

Azure Kubernetes Service (AKS), was choosen as the main service for this solution. These are the main reasons:

- AKS is simple and accelerete the application development and deployment.
- Efficient resource utilization.
- Easy and fast autoscaling.
- Secure - only access what you need.
- Autoscaling

![aks-structure](/docs/aks-structure.png)

## Code Structure

Terraform was choosen as the main tool for provisioning of the platform. Terraform provides state management, preventing configuration drifts, has large integration with Azure being able to deploy most part of the resouces, easy to deploy, maintain and read, is efficient and stable.

Azure Devops is used as CI/CD tool due to the native integrarion with Azure and GitHub, for example creating service connections to directly authorize the pipeline into the subscription.

![code-structure](/docs/code-structure.png)

## Future Improvements

- Use Helm Chart to deploy the kubernetes resources (manifests)
- Create our own dockerfile and publish the image to Azure Container Registry
- Use Azure DNS to expose a human readable url name - External DNS
- Increase the monitoring by using tools like prometheus and grafana
- Use Application gateway as ingress
    - Currently not working with Terraform, however it works with az cli
    - https://github.com/MicrosoftDocs/azure-docs/issues/27904
- Create a disaster recovery site by deploying a new spoke into a separate region and using Azure Front Door to manage the network requests and load balancing.

![aks-multi-region-design](/docs/aks-multi-region-design.png)