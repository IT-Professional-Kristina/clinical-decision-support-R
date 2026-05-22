Medications <- c("Aspirin", "Metformin", "Lisinopril", "Atorvastatin", "Amoxicillin")
Doses_milligrams <- c(81, 1000, 10, 40, 500)

for (i in 1:length(Medications)) {
  meds <- Medications[i]
  dosage <- Doses_milligrams[i]
  
  
  if (dosage > 500){
    status <- "High Dose - verify order"
  } else if (dosage >= 50 & dosage <= 500) {
    status <- "Standard dose"
  } else {
    status <- "Low dose"
  }
    print(paste(meds, ":", status))
  }


  