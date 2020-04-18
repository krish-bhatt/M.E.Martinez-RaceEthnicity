# M.E.Martinez-RaceEthnicity

Monthly and Yearly All Cause Mortality (Haleigh):

Data downloaded from CDC WONDER query tool from CDC Vital Statistics. Files contain monthly death counts by county 
(for all NY counties) and yearly death counts,crude and age-adjusted death rates with CI bounds. The monthly file does not contain 
rates because the CDC does not have monthly population data. Monthly rates can estimated by combining information from both of the
files, and eon using the yearly population per county as a proxy for the monthly population per county. Query/Selection parameters 
are included at the bottom of each dataset. More information for the CDC WONDER Tool can be found her: https://wonder.cdc.gov/wonder/help/ucd.html#

Population Size for NYS Counties (Katy):

Data downloaded from United States Census. File contains yearly estimates of the population of each of the 62 counties in New York State from the year 2010 until July 1, 2019. 

By NYS County: Population Age distribution, household size, median household income (Katy):

Data downloaded from United States Census Bureau: Quick Facts (https://www.census.gov/quickfacts/fact/map/newyorkcountymanhattanboroughnewyork/INC110218). CSV files were downloaded for the counties of New York in groups of 6 and one group of 2. The interactive map through which the counties of interest were selected allowed a maximum of 6 counties to be selected at a time for data download. I manually selected counties in groups of 6 and downloaded the .csv files, then combined them into one using Microsoft Excel. For population age distribution, the data included percent of the population under 5, under 18, and 65 and over. It includes the average persons per household over the years 2014-2018. It includes the median household income in 2018 dollars over the years 2014-2018. 

Prevalence of Preexisting Risk Factors (Dennis): 
"Community_Health_Indicator_Reports__CHIRS___Latest_Data.csv" and "2018-chp-pud.xlsx"
More detailed information about these files can also be found in my R file "DK_Risk_Analysis.R"

"Community_Health_Indicator_Reports__CHIRS___Latest_Data.csv"
NY State county-level data on the prevalence of many comorbidities and risk factors, including hypertension, diabetes, CVD, COPD, amd obesity.
Downloaded from: https://healthdata.gov/dataset/community-health-indicator-reports-chirs-latest-data

"2018-chp-pud.xlsx"
NYC-specific data on risk factors. Organized by Commnity Districts, allows for closer analysis of patterns within NYC.
Data downloaded from the NYC DOH: 
https://www1.nyc.gov/site/doh/data/data-publications/profiles.page#bx


COVID-19 Testing (Sunder) 
"newyork_testing.xlsx"
Number of tests of individuals for COVID-19 infection performed in New York State and New York City beginning March 1, 2020, when the first case of COVID-19 was identified in the state.
Downloaded from: https://health.data.ny.gov/Health/New-York-State-Statewide-COVID-19-Testing/xdss-u53e
