# Brain-Computer-Interface-for-Bionic-Arm
Created an Integrated system that collects brain waves and actuates Openbioic brunel hand

Neuro-prosthetics is a trending study for rehabilitation, substitution of limbs, mobility, cognition, hearing, vision and many other applications. 
My aim of this research is to create a BCI technology to enable sever motor impairment patients controlling prosthetics. 
The objective is to express the novelty of implementing a simple brain-computer Interface (BCI) system for prosthetic arm. 
This study uses SSVEP (Steady state Visually Evoked Potential) Method to read EEG data, MATLAB and Openvibe softwares for signal processing and control of Open bionics Brunel hand.

The following is the overview how I created this softwrae package: 

![flowchart-1](https://user-images.githubusercontent.com/49041896/93845754-080fa080-fc70-11ea-8342-ea4bc58ede8a.jpg)

# Methods and Materials:
The aim of this research is to implement EEG-based BCI system using SSVEP for working of prosthetic hand. The research has been done using following materials and their images are displayed below:
- Stimulus/flickering regions
- Openvibe
- g.tec GAMMcap
- g.tec Sahara Box
- g.tec Mobilab+
- LSL (Lab Streaming Layer)
- MATLAB
- psychtoolbox
- Openbionics Brunel hand 2.0

In order to achieve the targets of this research, the following tasks have been broken down:
- Acquisition and recording of EEG signals
- Streaming EEG signals to filter
- Filtering of EEG signals
- Processing the filtered signals using CCA.
- Sending the output to hand using Serial Communication.
- Actuating the hand based on gazed target frequency
