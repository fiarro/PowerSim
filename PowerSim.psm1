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
    <#be 
        A simPlatform is the underlying platform where your simEnvironment & Simulation will be run.You need to supply a simPlatform to all Simulations. 
        Examples of simPlatforms are Azure & Hyper-V.

        Attributes

        NAME - The Name value needs to match a supported & pre-defined simPlatform name.
        
                Currently only Azure is supported

        DRIVER - The Driver value needs to match a supported & pre-defined Driver. The Driver is responsible for automating & controlling
                 the simPlatform
                 
                 Currently only PowerSim is supported. An example of another Driver that might be implemented is Vagrant

        Methods

        BuildEnvironment($Environment) - Use BuildEnvironment() to build a new simEnvironment.
        
                                        You need to provide the simEnvironment that you want to build as a parameter to the method.

                                        BuildEnvironment() will return $true if the build is successful or $false if not

        InitialiseEnvironment($Environment) - You may need to initialise a simEnvironment before running a Simulation for the first time
                                              or to clean a simEnvironment before running a second Simulation in the same simEnvironment.
                                              IntialiseEnvironment() will make sure the simEnvironment is in the correct state & clean of
                                              any left over files or settings from previous Simulations without having to re-build.

                                              You need to provide the simEnvironment that you want to initialise as a parameter to the method.

                                              InitialiseEnvironment() will return $true if the initialisation is successful or $false if not

        VerifyEnvironment($Environment) - VerifyEnvironment() lets you run operational & security tests against your simEnvironment using Pester to verify everything
                                          is functioning as you expect before beginning your simulations. It's recommended that you call VerifyEnvrionment() after
                                          each time you call InitialiseEnvironment()

                                          You need to provide the simEnvironment that you want to verify as a parameter to the method.

                                          VerifyEnvironment() will return $true if the verification tests are successful or $false if not
        
        DeleteEnvironment($Environment) - Use DeleteEnvironment() when all your simulations have completed & you no longer need the simEnvironment. It will be completely deleted
                                          and is not recoverable afterwards.

                                          You need to provide the simEnvironment that you want to delete as a parameter to the method.

                                          DeleteEnvironment() will return $true if the deletion is successful or $false if not

        Examples

        Example 1 

        Here we see the creation of a simPlatform instance

        $myPlatform = New-Object 'simPlatform' -Property @{Name='Azure'; Driver='PowerSim'}

        Example 2

        This example builds a simEnvironment & then initialises & verifies it so that it's ready to run Simulations

        if ($myPlatform.BuildEnvironment($myEnvironment)) {

            if ($myPlatform.InitialiseEnvironment($myEnvironment)) {

                $envStatus = $myPlatform.VerifyEnvironment($myEnvironment)

            }

        }

        Example 4
        
        When all your Simulations have completed you may want to delete your simEnvironment which is shown below.

        $myPlatform.DeleteEnvironment($Environment)

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
    <#

        You can run your Simulations in different simEnvironments for comparison & testing. simEnvironments can run on any simPlatform. You need to compile & publish a simEnvironment
        configuration for each simDriver. A simDriver is responsible for automating the simEnvironment tasks within a simPlatform. Currently the only supported simDriver is PowerSim
        itself however simDrivers that use 3rd party systems like vagrant can be defined.

        Attributes

        NAME - This is the name of your simEnvironment, it can be anything you like

        NETWORK - This is where you provide a list of all the simNetworks that are part of your simEnvironment

        NODE - The Node attribute holds a list all the simNodes that are part of your simEnvironment

        APPLICATION - This is a list of all the simApplications that are part of your simEnvironment
        
        Methods
        
        Compile($Driver) - A simEnvironment needs to be compiled for a specific simDriver before it can be used. The Publish() method will do this for you automatically.

                           The Compile() method will return a File object.

        Publish($Driver) - After compiling your simEnvironment you need to publish it so that your simPlatforms can find it. 

                           The Publish() method won't return anything but the compiled simEnvironment configuration file should be created for you in the simDriver path.

        Examples
        
        Example 1
        
        Below is an example of creating a new simEnvironment instance

        $myEnvironment = New-Object 'simEnvironment' -Property @{Name='QA Environment'; Network=@($network1; $network2); Node=@($node1; $node2; $node3); Application=@($IISWebApp)}

        Example 2 

        Once you have defined a simEnvironment you need to publish it before you can use it in a Simulation. We see an example of that below.

        $myEnvironment.Publish($PowerSimDriver)

        
    #>


    [string]$Name

    [SimNetwork[]]$Network

    [SimNode[]]$Node

    [SimApplication[]]$Application


    [System.IO.File] Compile($Driver) {
    
        # Compiles a configuration file that is valid for the SimDriver provided

        $config = New-Item -Name $this.Name -ItemType File

        return $config
    }

    [void] Publish($Driver) {
    
        # Compile a configuration for the correct simDriver (ie PowerSim) format

        # Save the configuration to a file path specified by simDriver
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