patient_names <- c("Sarah", "James", "Maria", "David", "Priya", "Thomas")
patient_ages <- c(34, 45, 28, 62, 51, 39)
systolic_blood_pressure <- c(118, 142, 125, 158, 136, 122)

mean(systolic_blood_pressure)
max(systolic_blood_pressure)
min(systolic_blood_pressure)
patient_names[3]
systolic_blood_pressure[3]
systolic_blood_pressure > 140


for (i in 1: length(patient_names)) {
  bp <- systolic_blood_pressure[i]
  name <- patient_names[i]

if (bp > 140){
 status <- "High Blood Pressure - needs review"
} else if (bp >= 120 & bp <= 140) {
  status <- "Normal range"
} else {
     status <- "Low - monitor closely"
   } 
      print(paste(name, ":", status))
    }
    
