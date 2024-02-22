# How to install msft_DataArchivalBaseComponents

- Install Microsoft Power Platform CLI tool with Windows [MSI](https://aka.ms/PowerAppsCLI).
- Open command tool and get latest update for the power platform tool.
    ```console
    pac install latest
    ```
- Create auth for connecting to Dataverse environment. A new window will open to enter the credential. 
    ```console
    pac auth create --name MyEnv --cloud public --environment https://exampleorg.crm.dynamics.com/
    ```
- List all installed auths
    ```console
    pac auth list
    ```
- Select the auth for the environment
    ```console
    pac auth select --index 1
    ```
- Download the DataArchivalApps_managed_Package version as per table below. To view installed msft_DataArchivalBaseComponent, go to Dataverse [maker portal](https://make.powerapps.com/), select the environment, on the solutions page click see history. 

    Installed msft_DataArchivalBaseComponents version | Update to target version |
    --------------------------------------------------|------------------------- |
    | 1.0.0.171 | [1.0.0.173](DataArchivalApps_managed_Package_ver1.0.0.173.zip) |
    | 1.0.0.172, 1.0.0.179 | [1.0.0.180](DataArchivalApps_managed_Package_ver1.0.0.173.zip) |
    | 1.0.0.176, 1.0.0.182, 1.0.0.184 | [1.0.0.185](DataArchivalApps_managed_Package_ver1.0.0.173.zip) |
- Deploy the package
    ```console
    pac package deploy --logconsole --package ".\DataArchivalApps_managed_Package_ver1.0.0.x.zip"
    ```



