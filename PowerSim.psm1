class Simulation {

    [string]$Name

    [SimActor[]]$Actor


    [array] Simulate($Environment) {
    
        $artifacts = @()
        # For each Actor

            # Execute their Action in the Environment & add any Artifacts returned to the $artifacts list
        
        return $artifacts
    }
    
    [SimAnalysis] Analyse($Artifacts, $Environment, $Path) {
            
        # For each Artifact in the Environment

            # Analyse it for known issues or warnings

        # Write any issues or warnings to a report
        
        # Save the report file to the Path
    }
}

class SimPlatform {

    [string]$Name

    [ValidateSet('DSC')]
    [string]$Driver


    [bool] Initialise($Environment) {

        # Deploy the Environment

        # If the deployment is successful
        
            return $True

        # Else return False

    }
    
    [bool] Verify($Environment) {

        # Run Operational Tests to validate the Environment
        
        # If all the Tests pass 
        
            return $true

        # Else return false

    }

    [bool] Delete($Environment) {

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