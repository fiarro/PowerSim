class Simulation {
    <#
        Using the Simulation class you can define actions across multiple systems in an environment to simulate complex 
        real-world situations.
        
        The Simulation class needs to be used with an instance of the Environment class & Platform class
        
        Attributes
            
        NAME - The name of the Simulation

        ACTOR - An Array of Actor objects that will carry out the Simulation 

        Methods

        Run($Environment, $Platform) - Use Run() to run your Simulation. You need to supply a simEnvironment object that tells the 
                                        Simulation where to run. You also need to supply a simPlatform object for where to deploy the
                                        simEnvironment.

                                        Run() won't return any output

        Analyse($Artifacts, $Environment) - Use Analyse() to check a simEnvironment for simArtifacts created by a Simulation & analyse
                                            them against expected conditions. You need to supply the simArtifacts you want to check for
                                            as well as the simEnvironment to be analysed.

                                            Analyse() will return an simAnalysis object that contains the results of the analysis
       
        Examples

        Example 1
        
        This example creates a new Simulation

        $mySimulation = New-Object 'Simulation' -Property @{Name='Complex Simulation'; Actor=@($Actor1, $Actor2, $Actor3)}

        Example 2

        This example shows a Simulation being run & analysed

        $artifacts = $mySimulation.Run($mySimEnvironment, $mySimPlatform)

        $analysis = $mySimulation.Analyse($artifacts, $mySimEnvironment)

    #>

    [string]$Name

    [SimActor[]]$Actor


    [void] Run($Environment, $Platform) {
    
        # Build the $Environment on the $Platform

        # Initialise the $Environment on the $Platform

        # For each Actor

            # Execute them in the Environment
        
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
    <#
        You need to supply a simPlatform to all Simulations. The simPlatform is the underlying platform where the simEnvironment &
        Simulation will run. Examples of simPlatforms are Azure & Hyper-V.

        Attributes

        NAME - The Name value needs to match a supported & pre-defined simPlatform name.
        
                Currently only Azure is supported

        DRIVER - The Driver value needs to match a supported & pre-defined Driver. The Driver is responsible for automating & controlling
                 the simPlatform
                 
                 Currently only PowerSim is supported. An example of another Driver that might be implemented is Vagrant

        Methods

        BuildEnvironment($Environment) - Use BuildEnvironment() to build a simEnvironment.
        
                                        You need to provide the simEnvironment that you want to build as a parameter to the method.

                                        BuildEnvironment() will return $true if the build is successful or $false if not

        InitialiseEnvironment($Environment) - You may need to initialise a simEnvironment before running a Simulation for the first time
                                              or to clean a simEnvironment before running a second Simulation in the same simEnvironment.
                                              IntialiseEnvironment() will make sure the simEnvironment is in the correct state & clean of
                                              any left over files or settings from previous Simulations without having to rebuild.

                                              You need to provide the simEnvironment that you want to initialise as a parameter to the method.

                                              InitialiseEnvironment() will return $true if the initialisation is successful or $false if not

        VerifyEnvironment($Environment) - 
        
        DeleteEnvironment($Environment) - 

        Examples

        Example 1

        BuildEnvironment($Environment)

        Example 2

        InitialiseEnvironment($Environment)

        Example 3

        VerifyEnvironment($Environment)

        Example 4
        
        DeleteEnvironment($Environment)

    #>
    
    [ValidateSet('Azure')]
    [string]$Name

    [ValidateSet('PowerSim')]
    [string]$Driver


    [bool] BuildEnvironment($Environment) {

        # Deploy the Environment

        # If the deployment is successful
        
            return $True

        # Else return False

    }

    [bool] InitialiseEnvironment($Environment) {

        # Initialise the Environment to ensure it is clean of any effects of previous simulations

        # If the initialisation is successful
        
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