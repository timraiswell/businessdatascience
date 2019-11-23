# Read in the necessary libraries
if(!require(ChannelAttribution)){
  install.packages("ChannelAttribution")
  library(ChannelAttribution)
}
# Set Working Directory
setwd <- setwd("C:/Users/Tim/OneDrive/Documents/GitHub/businessdatascience/other_data")
# Read in our CSV file output by the python script
df <- read.csv('Paths.csv')
# Select only the necessary columns
df <- df[c(1,2)]
# Run the Markov Model function
M <- markov_model(df, 'Path', var_value = 'Conversion', var_conv = 'Conversion', sep = '>', order=1, out_more = TRUE)
# Output the model output as a csv file, to be read back into Python
write.csv(M$result, file = "Markov - Output - Conversion values.csv", row.names=FALSE)
# Output the transition matrix as well, for visualization purposes
write.csv(M$transition_matrix, file = "Markov - Output - Transition matrix.csv", row.names=FALSE)