function Simulate {
    <#
        Simulate is intended to be a wrapper for multiple simulation stages. It will be responsible for executing each stage as a workflow in series
    #>
    [string]$Simulation,
    [scriptblock]$Simulation
}

function Stage {
    <#
        The Stage function is intended to be a descrete block of code that represents a particular lifecycle stage in a Simulation. It will be executed as a Workflow.
    #>
    Param(
        [ValidateSet('Deploy', 'Start', 'Stop', 'Analyse', 'Destroy')]
        [string]$Stage,
        [scriptblock]$Simulation
    )
}

function Build {
    <#
        Build executes in the Deploy lifecycle stage of a Simulation. It builds the specified Simulation Environment on the Platform selected using the selected Driver
    #>
    Param(
        [string]$SimulationName,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Initialise {
    <#
        Initialise can execute in either the Deploy, Start or Analyse lifecycle stages of a Simulation. It makes sure the specified Simulation Environment on the Platform selected is initialised & ready
        to execute the Simulation using the selected Driver.

        Some Simulations might want to re-initialise the Environment multiple times throughout the Simulation.
    #>
    Param(
        [string]$SimulationName,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Verify {
    <#
        Verify runs Operational & Security Tests to check & validate the different Simulation stages. It usually runs at least once
        in the Deploy, Start, Stop & Destroy stages
    #>
    Param(
        [string]$SimulationName,
        [ValidateSet('Ready', 'Started', 'Stopped', 'Destroyed')]
        [string]$is,
        [string]$in,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Start {
    <#
        Start executes the Start lifecycle stage of a Simulation. It runs the simulation within the specified Environment & Platform using the Driver
    #>
    Param(
        [string]$SimulationName,
        [string]$in,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Stop {
    <#
        Stop executes the Stop lifecycle stage of a Simulation. It stops all Simulation actions within the specified Environment & Platform using the Driver
    #>
    Param(
        [string]$SimulationName,
        [string]$in,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Analyse {
    <#
        Analyse executes in the Analyse lifecycle stage of a Simulation. It analyses artifacts of the Environment created or modified by the Simulation like logs, databses & files
        and can be used to gather information about the effects of the Simulation on the Environment.
    #>
    Param(
        [ValidateSet('Log', 'Database', 'File')]
        [string]$the,
        [string]$from,
        [string]$in,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Destroy {
    <#
        Destroy executes the Destroy lifecycle which is the final stage of a Simulation. It completely destroys the Environment on the specified Platform with the Driver.
        After the Destroy stage is completed the Environment cannot be recovered.
    #>
    Param(
        [string]$SimulationName,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

