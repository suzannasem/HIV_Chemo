## Optimal control applied to chemotherapy of reverse transcription inhibitors for HIV.

# Goal
The goal of this project was to optimize chemotherapy dosing to minimize both HIV virion concentration in the blood and potential side effects.

# Background
This project considers the chemotherapy of reverse transcription inhibitors, which interrupt key mechanisms of the HIV infection process. Chemotherapy treatment can increase the concentration of CD4+ T-cells in the blood, leading to improved patient outcomes; however, higher strength chemotherapy treatment is toxic and drug resistance can render the treatment ineffective after a certain period of time. We aim to apply an optimal control model to chemotherapy of HIV to maximize the number of healthy CD4+ T-cells while minimizing the cost of treatment to the body, that is, dangerous side effects. This approach allows us to develop an optimal treatment regimen over a fixed period of time, avoiding the issue of drug resistance. 

**Roadmap**: (1) Defining the compartmental infection model and associated optimal control problem, (2) Deriving necessary conditions, (3) Testing the model for different parameter values with a Runge-Kutta 4 approximation in MATLAB.

# Repo Guide
"README" - (this file!) A guide to this project.

"MATLAB_func" - function file for Runge-Kutta 4 forward/backward sweep method in MATLAB.

"MATLAB_plots" - generates figures for above code.

"Full_Report.md" - Full report, written in TeX
