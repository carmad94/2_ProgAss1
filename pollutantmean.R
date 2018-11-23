pollutantmean <- function(directory, pollutant, id=1:332){
	setwd(directory)
	files = list.files(pattern="*.csv")
	data = do.call(rbind, lapply(files, read.csv))	
	data_clean = na.omit(data)
	#mag gamit nako ug for loop
	data_subset <- data.frame()
	for (i in id){
		subset_temp = subset(data_clean, ID == i, select=pollutant)
		data_subset <- rbind(data_subset, subset_temp)
	}
	result_mean <- colMeans(data_subset)
	result_mean
}