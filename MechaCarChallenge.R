library(dplyr)
# Deliverable 1
# Import MechaCar_mpg as a dataframe
mecha_car <- read.csv(file='MechaCar_mpg.csv', check.names = F, 
      stringsAsFactors = F)

# Linear regression
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
       ground_clearance + AWD, data = mecha_car)

# Generate summary() of the linear regression model
summary(lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
      ground_clearance + AWD, data = mecha_car))

# Deliverable 2
# Import Suspension_Coil as a dataframe
suspension_coil <- read.csv(file='Suspension_Coil.csv', check.names = F, 
      stringsAsFactors = F)
# Create total summary of the dataframe
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI), 
      Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Create lot summary of the dataframe
lot_summary = suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), 
      Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

# Deliverable 3
sample_table <- suspension_coil %>% sample_n(50)
t.test(log10(sample_table$PSI), mu=mean(log10(suspension_coil$PSI)))

sample_lot1 <- subset(suspension_coil, Manufacturing_Lot == 'Lot1') %>% sample_n(50)
t.test(log10(sample_lot1$PSI), mu=mean(log10(suspension_coil$PSI)))

sample_lot2 <- subset(suspension_coil, Manufacturing_Lot == 'Lot2') %>% sample_n(50)
t.test(log10(sample_lot2$PSI), mu=mean(log10(suspension_coil$PSI)))

sample_lot3 <- subset(suspension_coil, Manufacturing_Lot == 'Lot3') %>% sample_n(50)
t.test(log10(sample_lot3$PSI), mu=mean(log10(suspension_coil$PSI)))



