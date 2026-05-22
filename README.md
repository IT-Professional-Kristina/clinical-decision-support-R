# Clinical Decision Support — R Programming

A standalone clinical data project built in R 
demonstrating how rule-based decision support 
logic works in healthcare settings.

## Purpose

This project simulates the type of logic used 
in Epic clinical decision support rules — 
analyzing patient data vectors and automatically 
flagging patients based on clinical thresholds.

## What It Does

- Stores simulated patient data including names, 
  ages, and systolic blood pressure readings 
  across six patients
- Performs statistical analysis including mean, 
  maximum, and minimum blood pressure values
- Identifies high blood pressure patients using 
  vector logical comparison
- Automatically classifies all six patients using 
  conditional branching logic:
  - Above 140 mmHg — High Blood Pressure, 
    needs review
  - Between 120 and 140 mmHg — Normal range
  - Below 120 mmHg — Low, monitor closely

## Clinical Relevance

The conditional logic structure in this project 
directly mirrors how Epic clinical decision 
support alerts are built — if a value crosses 
a defined threshold, trigger a specific response. 
This pattern applies to:
- Medication dose range checking
- Lab value flagging
- Vital sign alerts
- Beers Criteria medication safety rules

## Skills Demonstrated

- R vector creation and statistical analysis
- Indexing and logical comparison operators
- for loop iteration across patient datasets
- if/else if/else conditional classification
- paste() for formatted clinical output
- Healthcare data modeling in R

- ### medication_classifier
- Classifies five medications by daily dose 
  in milligrams using conditional branching
- Demonstrates boundary condition logic —
  a critical concept in clinical decision 
  support rule building
- Classification rules:
  - Above 500mg — High dose, verify order
  - Between 50mg and 500mg — Standard dose
  - Below 50mg — Low dose
- Highlights how >= and <= boundary operators
  affect patient safety outcomes in real 
  Epic CDS alert logic

## Built With

- R 4.6.0
- RStudio
- Base R only — no external packages required

## Author

Kristina — Healthcare IT Professional  
B.S. Information Technology  
GitHub: github.com/IT-Professional-Kristina
