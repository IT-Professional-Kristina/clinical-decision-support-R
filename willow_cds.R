# ==========================================
# Willow Inpatient Clinical Decision Support
# Vancomycin Order Verification System
# ==========================================

# SECTION 1 - Patient Identification
patient_name <- "James Carter"
patient_dob <- "1966-03-14"
patient_weight_kg <- 85
patient_age <- 58
patient_sex <- "Male"

class(patient_name)
class(patient_dob)
class(patient_weight_kg)
class(patient_age)
class(patient_sex)

# SECTION 2 - Medication Order
medication <- "Vancomycin"
ordered_dose_mg <- 1500
route <- "IV"
frequency <- "Q12H"
indication <- "Pneumonia"

# Rule 1: If route = "Oral" AND indication ≠ "C.diff" 
# → Alert: Verify oral route for this indication

# Rule 2: If frequency < Q8H AND renal function is normal
# → Alert: Verify frequency may be subtherapeutic

# Rule 3: If creatinine rising AND patient on Vancomycin
# → Alert: Monitor for nephrotoxicity

# SECTION 3 - Current Lab Values
serum_creatinine <- 1.2 # mg/dL - kidney function marker
vanc_trough <-0  # mg/L - no prior level, first dose

# SECTION 4 - Patient Allergies
allergies <- c("Pencillin", "Sulfa", "Latex")
allergy_reactions <- c("Anaphylaxis", "Rash", "Hives")

# SECTION 5 - Renal Function Calculation
# Cockcroft-Gault equation for creatinine clearance
# CrCl = ((140 -age) * weight * sex_factor) / 72 * creatinine
# sex_factor = 1.0 for male, 0.85 for female

# Determine sex factor
if (patient_sex == "Male") {
  sex_factor <- 1.0 
} else {
  sex_factor <- 0.85
}
# Calculate CrCl using Cockcroft-Gault
crcl <- ((140 - patient_age) * patient_weight_kg * sex_factor) / (72 * serum_creatinine)
# Print result
print(paste("Creatinine Clearance:", round(crcl, 1), "ml/min"))

# SECTION 6 - Weight Based Dose Verification
# Standard Vancomycin: 15-20mg/kg for normal renal function
min_dose <- patient_weight_kg * 15
max_dose <- patient_weight_kg * 20

print(paste("Recommended range:", min_dose, "to", max_dose, "mg"))
print(paste("Ordered dose:", ordered_dose_mg, "mg"))

# SECTION 7 - Complete CDS Verification Engine
# Step 1 - Check if first dose or subsequent

if (vanc_trough == 0) {
  dose_history <- "First dose - no trough available"
} else if (vanc_trough >= 15 & vanc_trough <= 20) {
  dose_history <- "Trough therapeutic - continue current dose"
} else if (vanc_trough < 15) {
  dose_history <- "Trough subterapeutic - consdier dose increase"
} else {
  dose_history <- "Trough supratherapeutic - HOLD dose, notify prescriber"
}

# Step 2 - Renal Function Assessment
if (crcl >= 80) {
  renal_status <- "Normal renal function - standard dosing appropriate"
  freq_recommendation <- "Q12H"
}else if (crcl >= 50 & crcl <80) {
  renal_status <- "Mild renal impairment - monitor closely"
  freq_recommendatoin <- "Q24H"
}else if (crcl >=30 & crcl <50) {
  renal_status <- "Moderate renal impairment -reduce dose"
  freq_recommendation <- "Q24-48H"
}else {
  renal_status <- "Severe renal impairment - significant adjustment required"
  freq_recommendation <- "Q48H or avoid"
}

# Step 3 - Dose Range Verification
if (ordered_dose_mg >= min_dose & ordered_dose_mg <= max_dose){
  dose_status <- "APPROVED - Dose within therapeutic range"
} else if (ordered_dose_mg <min_dose) {
  dose_status <- "ALERT - Dose below therapeutic range"
} else {
  dose_status <- "ALERT - Dose above therapeutic range"
}
# Step 4 - Allergy Verification
vancomycin_safe <- TRUE

for (i in 1: length(allergies)) {
  if (allergies[i] == "Vancomycin") {
    vancomycin_safe <- FALSE
  }
}
if (vancomycin_safe == TRUE) {
  allergy_status <- "No allergy conflict detected"
} else {
  allergy_status <- "CRITICAL - Patient allergic to Vancomycin - DO NOT DISPENSE"
}
# SECTION 8 - Complete Pharmacist Verification Report
print("================================================")
print("   WILLOW INPATIENT - ORDER VERIFICATION")
print("===============================================")
print(paste("Patient:       ", patient_name))
print(paste("Date of Birth: ", patient_dob))
print(paste("Weight:        ", patient_weight_kg, "kg"))
print(paste("Age:           ", patient_age, "years"))
print("===============================================")
print(paste("Medication:    ", medication))
print(paste("Ordered Dose:  ", ordered_dose_mg, "mg"))
print(paste("Route:         ", route))
print(paste("Frequency:     ", frequency))
print(paste("Indication:    ", indication))
print("------------------------------------------------")
print(paste("CrCl:           ", round(crcl, 1), "mL/min"))
print(paste("Renal Status:   ", renal_status))
print(paste("Dose History:   ", dose_history))
print("------------------------------------------------")
print(paste("DOSE CHECK:     ", dose_status))
print(paste("ALLERGY CHECK:  ", allergy_status))
print(paste("FREQ CHECK:     ", freq_recommendation, "recommended"))
print("================================================")

# Final Verification Decision
if (ordered_dose_mg >= min_dose & 
    ordered_dose_mg <= max_dose &
    vancomycin_safe == TRUE &
    crcl >= 80) {
  print("** VERIFIED — Safe to dispense **")
} else {
  print("** HOLD — Clinical review required **")
}
print("=================================================")