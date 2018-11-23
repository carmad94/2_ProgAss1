complete <- function(directory, id){
	setwd(directory)
	files = list.files(pattern="*.csv")
	data = do.call(rbind, lapply(files, read.csv))	
	data_clean = na.omit(data)
	#mag gamit nako ug for loop
	data_subset <- data.frame()
	for (i in id){
		subset_temp = subset(data_clean, ID == i)
		temp_df <- data.frame(i,nrow(subset_temp))
		data_subset <- rbind(data_subset, temp_df)
	}
	
	# data_target = unlist(data_subset, use.names=FALSE)
	data_subset
}