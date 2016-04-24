# PowerSim
**NOTE: This project currently doesn't do anything, it is still being designed & none of the capabilities are implemented yet**

PowerSim allows you to simulate complex IT &amp; Application scenarios. PowerSim implements a simple to use syntax that allows you to easily build complex simulations using predefined blocks of configuration, tests & automation.

Simulation, Environment & Platform components are all independent of each other to allow them to be composed as needed. The same is true of Configuration & Test definitions to allow more complicated Environments to be composed of small descrete blocks.

When the Simulation is executed the definitions will be automatically compiled into Platform, Automation & Test system specific formats so they can be executed.

PowerSim will initially use Desired Stated Configuration (DSC) to automate the build & configuration process & Pester for testing & validation components. Azure & Hyper-V will be the initially supported Platforms. It's intended that in future the design will allow for other configuration, platform, automation & testing frameworks to be defined as plugins.

**Example PowerSim Simulation Script**

```

Import-Module PowerSim

Simulate aDatacentreFailure {

    Stage Deploy {

        Build primaryEnvironment -on Hyper-V -with PowerSim
        Build secondaryEnvironment -on Azure -with PowerSim

        Initialise primaryEnvironment -on Azure -with PowerSim
        Initialise secondaryEnvironment -on Azure -with PowerSim

        Verify aDataCentreFailure -is Ready -in primaryEnvironment -on Hyper-V -with Pester
        Verify aDataCentreTakeOver -is Ready -in secondaryEnvironment -on Azure -with Pester

    }

    Stage Start {

        Start aDataCentreFailure -in primaryEnvironment -on Hyper-V -with PowerSim

        Verify aDataCentreFailure -is Started -in primaryEnvironment -on Hyper-V -with Pester
        Verify aDataCentreTakeOver -is Started -in secondaryEnvironment -on Azure -with Pester

    }

    Stage Stop {

        Stop aDataCentreFailure -in primaryEnvironment -on Hyper-V -with PowerSim

        Verify aDataCentreFailure -is Stopped -in primaryEnvironment -on Hyper-V -with Pester
        Verify aDataCentreTakeOver -is Stopped -in secondaryEnvironment -on Azure -with Pester

    }

    Stage Analyse {

        Analyse -the log,database -from aDatabaseFailure -in primaryEnvironment -on Hyper-V
        Analyse -the log,database -from aDatabaseTakeOver -in secondaryEnvironment -on Azure

    }

    Stage Destroy {

        Destroy primaryEnvironment -on Hyper-V -with PowerSim
        Destroy secondaryEnvironment -on Azure -with PowerSim

        Verify aDataCentreFailure -is Destroyed -in primaryEnvironment -on Hyper-V -with Pester
        Verify aDataCentreTakeOver -is Destroyed -in secondaryEnvironment -on Azure -with Pester

    }

}

```
