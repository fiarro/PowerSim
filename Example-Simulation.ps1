Import-Module PowerSim

Simulate aDatacentreFailure {

    Stage Deploy {

        Build primaryEnvironment -on Hyper-V -with PowerSim
        Build secondaryEnvironment -on Azure -with PowerSim

        Initialise primaryEnvironment -on Azure -with PowerSim
        Initialise secondaryEnvironment -on Azure -with PowerSim

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

    }

}
