# Write-up Template

### Analyze, choose, and justify the appropriate resource option for deploying the app.

_For **both** a VM or App Service solution for the CMS app:_

- _Analyze costs, scalability, availability, and workflow_
- _Choose the appropriate solution (VM or App Service) for deploying the app_
- _Justify your choice_

| **_Resource_**        | **_Cost_**                                                                                                                                                                                      | **_Scalability_**                                                                                                                                                                                                                                                                                                 | **_Workflow_**                                                                |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| **Virtual Machine** | They are more expensive                                                                                                                                                                   | Multiple VMs can be grouped to provide high availability, scalability, and redundancy.                                                                                                                                                                                                                      | They can be more time consuming for the developer                       |
| **App Service**     | You can set the amount of hardware allocated to host your application, and cost varies based on the plan you choose. There are three different tiers - Dev/Test, Production, and Isolated | Vertical or Horizontal scaling. Vertical scaling increases or decreases resources allocated to our App Service, such as the amount of vCPUs or RAM, by changing the App Service pricing tier. Horizontal scaling increases or decreases the number of Virtual Machine instances our App Service is running. | Continuous deployment model using GitHub, Azure DevOps, or any Git repo |

#### Solution selected
App Service

#### Justification

As the application is lightweight and written in Python, it'll be deployed with App Service because of their language support, cost saving and deployment simplicity. This will allow to deploy the application without concerning about the underlying OS or the software installed to run it. It will also allow the application to scale up or down and still be managed without any further configuration.
### Assess app changes that would change your decision.

_Detail how the app and any other needs would have to change for you to change your decision in the last section._

#### Answer
The application would need to be migrated in the following scenarios:

* The application requires more than 14 GB or 4 CPU cores per instance.
* Installation of custom software on the server.
* The App is migrated to a language unsupported by App Service.
