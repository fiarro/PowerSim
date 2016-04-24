function Simulate {
    [string]$Simulation,
    [scriptblock]$Simulation
}

function Stage {
    Param(
        [ValidateSet('Deploy', 'Start', 'Stop', 'Analyse', 'Destroy')]
        [string]$Stage,
        [scriptblock]$Simulation
    )
}

function Build {
    Param(
        [string]$SimulationName,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Initialise {
    Param(
        [string]$SimulationName,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Start {
    Param(
        [string]$SimulationName,
        [string]$in,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Verify {
    Param(
        [string]$SimulationName,
        [ValidateSet('Started', 'Stopped')]
        [string]$is,
        [string]$in,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Stop {
    Param(
        [string]$SimulationName,
        [string]$in,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}

function Verify {
    Param(
        [ValidateSet('Log', 'Database', 'File')]
        [string]$the,
        [string]$from,
        [string]$in,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on
    )

}

function Destroy {
    Param(
        [string]$SimulationName,
        [ValidateSet('Azure', 'Hyper-V')]
        [string]$on,
        [ValidateSet('PowerSim')]
        [string]$with
    )

}