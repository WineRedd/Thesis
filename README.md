# Thesis.v1
Documents related to thesis

# DATA-DRIVEN MODEL DISCOVERY AND CONTROL OF LATERAL-DIRECTIONAL FIGHTER AIRCRAFT DYNAMICS 

Dynamic mode decompoisiton with control (DMDc) is combined with model predictive control (MPC). This framework learns nonlinear dynamical models affected by an exogenous control variable from few measurements. The resulting model has the ability to enhance the performance of model predictive control (MPC), based on limited, noisy data. 

## Installation

1. You should have Matlab and Simulink together in your PC at first.
2. Clone this repository to your desktop.
3. Add path to `Thesis/utils` and 'Thesis/SimulationFiles' folder to Matlab search path using addpath('../utils'); addpath('../SimulationFiles').

## Getting Started

The code for fighter aircraft example is in the corresponding example folder `Thesis/FighterAC`. Utilities code used can be found in `Thesis/utils`.

1. Go into an example folder `Thesis/FighterAC`.
2. Run script for system identification and mpc,  `DataDrivenControl.m`.
3. Saved figures and data may be found in `Thesis/DATA/`.


## Organization

The algorithms are in the `Thesis/FighterAC` directory. The folder `Thesis/utils/` contains helper functions. The folder 'Thesis/SimulationFiles' contains simulation models created in simulink. The most important ones are:

    DataDrivenControl     : System Identification (SI) and MPC for FighterAC. (Core algorithm)
    FighterAC.slx : Simulation model to collect training data
    
