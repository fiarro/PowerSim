class Simulation {
    <#
        Using the Simulation class you can define actions across multiple systems to simulate complex real-world situations
        
        The Simulation class needs to be used along side an instance of the Environment class where it will be run
        
        NAME - The name of the Simulation

        ACTOR - An Array of Actor objects that will carry out the Simulation 

        Example 1
        
        This example creates a new Simulation

        $mySim = New-Object 'Simulation' -Property @{Name='Complex Simulation'; Actor=@($Actor1, $Actor2, $Actor3)}

        Example 2

        This example shows a Simulation being run & analysed

        $artifacts = $mySim.Run($MySimEnvironment)

        $analysis = $mySim.Analyse($artifacts, $mySimEnvironment)
    #>
    [string]$Name

    [SimActor[]]$Actor


    [array] Run($Environment) {
    
        $artifacts = @()
        # For each Actor

            # Execute their Action in the Environment & add any Artifacts returned to the $artifacts list
        
        return $artifacts
    }
    
    [SimAnalysis] Analyse($Artifacts, $Environment) {
            
        # For each Artifact in the Environment

            # Analyse it for known issues or warnings

        # Write any issues or warnings to a report
        
        # Return the Analysis object

        return New-Object 'SimAnalysis'

    }
}

class SimPlatform {

    [string]$Name

    [ValidateSet('DSC')]
    [string]$Driver


    [bool] InitialiseEnvironment($Environment) {

        # Deploy the Environment

        # If the deployment is successful
        
            return $True

        # Else return False

    }
    
    [bool] VerifyEnvironment($Environment) {

        # Run Operational Tests to validate the Environment
        
        # If all the Tests pass 
        
            return $true

        # Else return false

    }

    [bool] DeleteEnvironment($Environment) {

        # Destroy the Environment

        # If the Environment is detroyed successfully

            return $true

        # Else return false

    }

}

class SimEnvironment {

    [string]$Name

    [SimNetwork[]]$Network

    [SimNode[]]$Node

    [SimApplication[]]$Application


    [void] Publish($Driver) {
    
        # Compile a configuration file with the correct $Driver (ie DSC) format

        # Save the configuration file to the correct location specified by $Driver
    }
    
    [System.IO.File] Compile($Driver) {
    
        # Compiles a configuration file that is valid for the SimDriver provided
    }

}

class SimActor {

}

class SimAction {

}

class SimArtifact {

}

class SimNetwork {

}

class SimHost {

}

class SimService {

}

class SimNode {

}

class SimApplication {

}

class SimAnalysis {

}

class SimDriver {

}