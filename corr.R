corr <- function(directory, threshold=0){
	setwd(directory)
	files = list.files(pattern="*.csv")
	data = do.call(rbind, lapply(files, read.csv))	
	data_clean = na.omit(data)
	ids <- unique(data_clean[['ID']])
	#mag gamit nako ug for loop
	data_corr <- data.frame()
	for (i in ids){
		subset_temp = subset(data_clean, ID == i, select=c("nitrate", "sulfate"))
		if ( nrow(subset_temp) > threshold){
			cor_computed = cor(subset_temp[["nitrate"]], subset_temp[["sulfate"]])
			data_corr <- rbind(data_corr, cor_computed)
		}
	}
	data_corr
}