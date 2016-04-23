class Simulation {

    [string]$Name

    [environment]$Environment

    [platform]$Platform

    [action[]]$Action


    [bool] InitialiseEnvironment() {
        
        # Initialise the Environment on the Platform

        # If the Initialisation process is successful

            return $true

        # Else return false
    }

    [array] Simulate() {
    
        $artifacts = @()
        # For each Action

            # Execute the Action & add any Artifacts returned to the $artifacts list
        
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

class Platform {

}

class Environment {

}

class Actor {

}

class Action {

}

class Artifact {

}