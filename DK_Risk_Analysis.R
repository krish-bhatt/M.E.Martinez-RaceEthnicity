# Dennis Khodasevich
# Lines 7-40 contain information about the NYC Community Health Profiles Public Use Dataset
  # Contains county-level and community district-level data on a wide variety of topics for NYC ONLY
# Lines 73-100 contains data from the New York State Community Health Indicators Report
  # Contains county-level data for all of NY State

# NYC-Specific Data file obtained from:
# https://www1.nyc.gov/site/doh/data/data-publications/profiles.page#bx
# on 4/11/2020 at around 2PM
# Download link at bottom labelled "Community Health Profiles Public Use Dataset (Excel)"
# Produces the data file "2018-chp-pud.xlsx"
  # Contains 6 sheets
  # "Metadata" contains metadata for all variables
  # "CHP_all_data" contains boro and neighborhood data for demographics, behaviors, and risk factors

#Load data
library("readxl")
dat <- read_excel("2018-chp-pud.xlsx", sheet = "CHP_all_data", skip = 1, col_names = TRUE)
#last 4 rows contain unnecessary notes
dat<-head(dat,-4)

#Contains total city data, Boro data and neighborhood data. Split into 3 datasets for further use
boro <- dat[c(2:6),]
neighborhood <- dat[c(7:65),]
city_total <- head(dat, 1)
# Use "boro" when looking at overall comparisons between the 5 boroughs
# Use "neighborhood" when looking at more specific neighborhood comparisons

### Identify risk factor variables (variable names in quotation marks, followed by description)
# "Obesity" : percent of adults (>18) with BMI >= 30  
# "Child_Obesity" : percent of public school children (K-8) who have obesity (BMI >= 95th percentile)
# "Self_Rep_Health" : percent of adults (>18) reporting excellent, very good, or good health
# "Smoking" : percent of adults (>18) reporting being current smokers
# "Diabetes" : percent of adults (>18) who have been told by healthcare professionals that they have diabetes
# "Hypertension" : percent of adults (>18) who have been told by healthcare professionals that they have high BP

### Social risk factors
# "Poverty" : Percent of residents living below 100% of NYC’s poverty threshold based on income and necessary expenses
# Additional information about Gentrification, incarceration rate, Uninsured rate

### Write csv for use in QGIS
write.csv(neighborhood, "NYC_CD_Risk.csv")
write.csv(boro, "NYC_Borough_Risk.csv")


### Skip lines 47-70 (used for testing of mapping variables)
### Mapping looks better in QGIS, but some can be done right in R
library(ggmap)
library(rgdal)
library(ggplot2)
library(sf)
shp <- readOGR("nycd.shp", stringsAsFactors = F)
plot(shp[,"BoroCD"],
     graticule=st_crs(shp), axes=TRUE, las=1)

# Nicer Map
library(broom)
nyc_dat<-tidy(shp)
ggplot() + 
  geom_polygon(data=nyc_dat, aes(x=long, y=lat, group=group))

# Map using google maps (requires an API)
nyc_map <- get_map(location = c(lon = -74.00, lat = 40.71), maptype = "terrain", zoom = 11)
ggmap(nyc_map)

# Coordinate system on the shp file needs to be converted before mapping onto google-based maps
ggmap(nyc_map) + 
  geom_polygon(data = nyc_dat, aes(x=long, y=lat, group=group), color="blue")
ggplot(nyc_dat, aes(long, y=lat)) + geom_point()



### NY State data obtained from CHIRS
# Downloaded from:
# https://healthdata.gov/dataset/community-health-indicator-reports-chirs-latest-data
# file downloads as : "Community_Health_Indicator_Reports__CHIRS___Latest_Data.csv"
# Contains very detailed mortality and risk factor prevalence information from each NYS county
# Each measurement specifies the year and source of data

NYS<-read.csv("Community_Health_Indicator_Reports__CHIRS___Latest_Data.csv", header = TRUE)

# For a general list of topics filter by "NYS$Health.topic"
unique(NYS$Health.Topic)

# Measurement IDs are listed under "Indicator" column
# 312 unique measurements
unique(NYS$Indicator)
### Some relevant measurements include:
# "All cancer incidence rate per 100,000"
  # Can search for more specific forms of cancer incidence rates as well
# "Percentage overweight or obese (85th percentile or higher) - Students (with weight status information in SWSCRS) in elementary, middle and high school"
# "Age-adjusted percentage of adults overweight or obese (BMI 25 or higher)"
# "Age-adjusted percentage of adults with current asthma"
# "Age-adjusted cirrhosis hospitalization rate per 10,000"
# "Age-adjusted chronic kidney disease hospitalization rate per 10,000 (any diagnosis)"
# "Age-adjusted chronic lower respiratory disease hospitalization rate per 10,000"
# "Age-adjusted disease of the heart hospitalization rate per 10,000"
# "Age-adjusted diabetes hospitalization rate per 10,000 (primary diagnosis)"
# "Pneumonia/flu hospitalization rate (Aged 65 years and older) per 10,000"
# "Age-adjusted congestive heart failure hospitalization rate per 10,000"
