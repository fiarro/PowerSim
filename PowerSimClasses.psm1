class Simulation {
    <#
        Using the Simulation class you can define actions across multiple systems in an environment to simulate complex 
        real-world situations.
        
        The Simulation class needs to be used with an instance of the Environment class & Platform class
        
        Attributes
            
        NAME - The name of the Simulation

        ACTOR - An Array of Actor objects that will carry out the Simulation 

        Methods

        Start($Environment, $Platform) - Use Start() to run your Simulation. You need to supply a simEnvironment object that tells the 
                                        Simulation where to run. You also need to supply a simPlatform object for where to deploy the
                                        simEnvironment.

                                        Start() won't return any output

        Analyse($Artifacts, $Environment) - Use Analyse() to check a simEnvironment for simArtifacts created by a Simulation & analyse
                                            them against expected conditions. You need to supply the simArtifacts you want to check for
                                            as well as the simEnvironment to be analysed.

                                            Analyse() will return an simAnalysis object that contains the results of the analysis

        Stop($Environment, $Platform) - Use Stop() to end your Simulation. You need to supply a simEnvironment object that tells the 
                                        Simulation where it is being run. You also need to supply a simPlatform object for where you deployed the
                                        simEnvironment.

                                        Stop() won't return any output
       
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


    [void] Start($Environment, $Platform) {

        # For each Actor

            # Start them in the Environment
        
    }
    
    [SimAnalysis] Analyse($Artifacts, $Environment) {
            
        # For each Artifact in the Environment

            # Analyse it for known issues or warnings

        # Write any issues or warnings to a report
        
        # Return the Analysis object

        return New-Object 'SimAnalysis'

    }

    [void] Stop($Environment, $Platform) {
    
        # For each Actor

            # Stop them in the Environment

        
    }
}

class SimPlatform {
    <# 
        A simPlatform is the underlying platform where your simEnvironment & Simulation will be run.You need to supply a simPlatform to all Simulations. 
        Examples of simPlatforms are Azure & Hyper-V.

        Attributes

        NAME - The Name value needs to match a supported & pre-defined simPlatform name.
        
                Currently only Azure is supported

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

        $myPlatform = New-Object 'simPlatform' -Property @{Name='Azure'}

        Example 2

        This example builds a simEnvironment for a Simulation

        $myPlatform.BuildEnvironment($myEnvironment)

        Example 3
        
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
    <#

        You need to use at least one SimActor in all your Simulations. A SimActor reporesents a system or person in a real-world scenario that is interacting with your SimEnvironment.
        A SimActor contains a list of SimActions that it performs in your Simulation.
        
        SimActors can be re-used in multiple Simulations & you can use multiple instances of the same SimActor within a single Simulation (ie You might want 500 'Email User' Actors to
        simulate usage of your Exchange Application)
        
        Attributes
        
        NAME - You can use any label for the Name of your SimActor

        ACTION - This is a list of all the SimActions that your SimActor will perform in a Simulation

        INSTANCE - You can have multiple instances of the same SimActor in your Simulation. This should be an integer value for how many copies of the SimActor you want to use.

        MODE - A SimActor can run in 2 Modes, Single or Repeat. In Single mode the SimActor will perform it's SimActions once & then stop. In Repeat mode the Actor will keep repeating
               it's SimActions until the Simulation ends.

        Methods

        Start() - The Simulation will call the Start() method for the SimActor to launch it.
                  
                  Start() will return an IAsyncResult object that can be used to monitor the state & progress of the SimActor

        Stop($IAsyncObject) - The Simultation will call the Stop() method for the SimActor when the Simulation is finished. You need to provide a list of IAsyncObjects that control the
                              Runspaces where each SimActor is running

                              Stop() won't return anything but ensures that all the runspaces are cleaned-up when the SimActor is no longer needed
        
        Examples
        
        Example 1
        
        Here we see the creation of a SimActor instance that simulates 500 Email Users & runs repeatedly until the Simulation ends

        $myActor = New-Object 'SimActor' -Property @{Name='Email User'; Action=@($Action1; $Action2; $Action3); Instance=500; Mode='Repeat'}

        Example 2 

        Below shows how to use Start() on your SimActor & save the iAsyncObjects it outputs to a variable so you can track their running state throughout the Simulation

        $runningActors = $myActor.Start()

    #>

    [string]$Name

    [SimAction[]]$Action

    [int]$Instance=1

    [ValidateSet('Single', 'Repeat')]
    [string]$Mode='Single'
    
    [System.IAsyncResult[]] Start() {
        
        # For every Instance of the SimActor

            # Start a new Runspace

            # If it is in Single mode

                # For each Action

                    # Run the Action in the runsapce

            # Else
                
                # For each Action

                    # Run the Action in the runspace

                # Keep repeating the list of Actions in the Runspace

        # Return a list AsyncObjects that can be used to track the progress of each SimActor instance             
        return [System.IAsyncResult]::New()

    }

    [void] Stop($IAsyncObject) {

        # For each Runspace represented in $IAsyncObject

            # Kill the Runspace

    }


}

class SimAction {
    <#

        You can define SimActions that can then be performed by SimActors in a Simulation. SimActions should be small & atomic so that they can be reused
        by differnet SimActors & Simulations. You can create complex behaviour by chaining SimActions into a larger sequence within a SimActor.

        Attributes

        NAME - This is the Name of the SimAction, it is arbitrary

        SCRIPTBLOCK - The Scriptblock defines the behaviour of the SimAction & is what is executed when you call the Invoke() method

        Methods

        Invoke() - Use Invoke() to execute the code in the SimAction ScriptBlock attribute

        Examples

        Example 1

        Use the below to create a new SimAction

        $myAction = New-Object 'SimAction' -Property @{Name='Read C:\ Contents'; Scriptblock={Get-ChildItem c:\}}

        Example 2

        To execute the action use Invoke() as shown below

        $MyAction.Invoke()

    #>

    [string]$Name

    [scriptblock]$ScriptBlock

    [void] Invoke() {

        # Run the code in the scriptblock
        $this.Scriptblock.Invoke()

    }
}

class SimNetwork {
    <#

        A SimNetwork allows you to define a network in your Simulation environment. The SimPlatform is responsible for converting this to a specific configuration
        document using a SimDriver.

        Attributes

        NAME - You can provide a Name for your network that will be used as a label in your SimPlatform configuration

        NETWORK - This is the network definition (ie 192.168.0.0)

        SUBNETMASK - The subnet mask

        GATEWAY - The IP address of the networks default gateway device

        Methods

        Get() - Use Get() when you want to receive the attributes of the SimNetwork

                Get() will return a hashtable containing all fo the SimNetwork settings

        Set() - The Set() method will change the attribute values of the SimNetwork.

                Set() doesn't return anything

        Examples

        Example 1

        Create a new SimNetwork

        $myNetwork = New-Object 'SimNetwork' -Property @{Name='External DMZ'; Network='192.168.0.0'; SubnetMask='255.255.255.0'; Gateway='192.168.0.1'}

        Example 2

        Save the SimNetwork settings to a variable

        $myNetSettings = $myNetwork.Get()

    #>

    [string]$Name

    [string]$Network

    [string]$SubnetMask

    [string]$Gateway

    [hashtable] Get() {

        # Create a hashtable with all the Attributes

        # return the hashtable
        return [hashtable]::New()
    }

    [void] Set($Attributes) {

        # For each attribute provided

            # Change the value of the Attribute to the new value
    }
}

class SimNode {
        <#

        A SimNode allows you to define a system in your Simulation environment. The SimPlatform is responsible for converting this to a specific configuration
        document using a SimDriver.

        Attributes

        NAME - You can provide a Name for your SimNode that will be used as a label in your SimPlatform configuration

        TYPE - You need to define the image to be used (ie Win-Server-2012-R2). These aren't arbitrary and need to be a supported SimNode type

        RESOURCE - This is a hashtable that defines the CPU, Memory, Storage & Network resources that your SimPlatform should assign to the SimNode

        Methods

        Get() - Use Get() when you want to receive the attributes of the SimNode

                Get() will return a hashtable containing all of the SimNode settings

        Set() - The Set() method will change the attribute values of the SimNode.

                Set() doesn't return anything

        Examples

        Example 1

        Create a new SimNode

        $myNode = New-Object 'SimNode' -Property @{Name='DC-01'; Type='Win-Server-2012-R2'; Resource=@{Cpu=2; Memory=2048; Storage=250; Network='External DMZ'}}

        Example 2

        Save the SimNode settings to a variable

        $myNodeSettings = $myNode.Get()

    #>

    [string]$Name

    [ValidateSet('Win-Server-2012-R2')]
    [string]$Type

    [hashtable]$Resource 


    [hashtable] Get() {

        # Create a hashtable with all the Attributes

        # return the hashtable
        return [hashtable]::New()
    }

    [void] Set($Attributes) {

        # For each attribute provided

            # Change the value of the Attribute to the new value
    }
}

class SimDriver {
    <#

        A SimDriver manages & automates the different stages of a Simulation. Currently only PowerSim is supported but it is intended that people can add their own SimDrivers
        in the future to automate some or all parts of the Simulation.

        Attributes

        NAME - The Name of the SimDriver isn't arbitrary & must be a pre-defined supported driver.

        Methods

        Build($Environment, $Platform)

        Initialise($Environment, $Platform)

        Verify($Simulation, $Environment, $Platform)

        Start($Simulation, $Environment, $Platform)

        Stop($Simulation, $Environment, $Platform)

        Analyse($Analysis, $Simulation, $Environment, $Platform)

        Destroy($Environment, $Platform)
    #>
}

class SimApplication {
    <#
    
        A SimApplication is an Application within a Simulation (ie an IIS Web App, Exchange, etc)

    #>  
}

class SimArtifact {
    <#

        A SimArtifact is anything of interest in the Simulation that is required for Analysis (ie logs, databses, files, etc)

    #>
}

class SimAnalysis {
    <#

        A SimAnalysis is an automated diagnostic/analysis process to analyse the results of a Simulation

    #>
}

class SimHost {
    <#

        A SimHost is a host system providing the SimPlatform (rather than a SimNode used in a Simulation running onhte SimPlatform) 
    #>
}

class SimService {
    <#

        A SimService is a service being provided by the SimPlatform (such as provisioning services for Simulations)

    #>
}