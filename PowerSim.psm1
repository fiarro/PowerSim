class Simulation {

    [string]$Name

    [simenvironment]$Environment

    [simplatform]$Platform

    [simactor[]]$Actor


    [bool] InitialiseEnvironment() {
        
        # Initialise the Environment on the Platform

        # If the Initialisation process is successful

            return $true

        # Else return false
    }

    [array] Simulate() {
    
        $artifacts = @()
        # For each Actor

            # Execute their Action & add any Artifacts returned to the $artifacts list
        
        return $artifacts
    }

    [bool] DeleteEnvironment() {

        # Delete the Environment on the Platform

        # If the Deletion process is succssful

            return $true

        # Else return false
    }
    
    [void] Analyse($Artifacts, $Path) {
            # For each Artifact 

            # Analyse it for known issues or warnings

        # Write any issues or warnings to a report
        
        # Save the report file to the Path
    } 
}

class SimPlatform {

    [string]$Name

    [ValidateSet('DSC')]
    [string]$Driver

    [bool] Deploy() {

        return $True
    }
    
    [bool] Verify() {

        return $true
    }

    [bool] Destroy() {

        return $true
    }

}

class SimEnvironment {

    [string]$Name

    [simnetwork[]]$Network

    [simnode[]]$Node

    [simapplication[]]$Application


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