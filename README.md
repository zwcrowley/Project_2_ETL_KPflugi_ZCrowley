# Project_2_ETL_KPflugi_ZCrowley
UMN BootCamp- Project 2- Extract, Transform, and Load 

## PROPOSAL
Crowlugi Resorts are looking for the ideal location for their next luxury property investment. We in the property acquisitions department have been tasked with creating a database of weather data and nearby tourist attractions in the countries that received high World Happiness scores. The database will then be used to determine potential locations for the new resort. 

## Sources
World Happiness Report - https://www.kaggle.com/datasets/unsdsn/world-happiness?resource=download&select=2019.csv 
-	(Gallup World Poll: https://www.gallup.com/analytics/349487/gallup-global-happiness-center.aspx; World Happiness Report: https://worldhappiness.report/?utm_source=link_wwwv9&utm_campaign=item_394172&utm_medium=copy) 

World cities database - https://www.kaggle.com/datasets/juanmah/world-cities
-	(Simple Maps: “World Cities Database” https://simplemaps.com/data/world-cities)

Google Places API (https://developers.google.com/maps/documentation/places/web-service)

OpenWeatherAPI (https://openweathermap.org/current)

## Step 1
We identified a dataset we wanted to focus on, The World Happiness Score dataset. From there we came up with the question: how can we use this dataset to decide where to build a fictional resort. From here we decided important factors in determining where to build a resort would be proximity to airports and tourist attractions, as well as the typical weather. We noted that the World Happiness Score dataset only rates countries whereas the OpenWeatherAPI and Google Places API can drill down to cities. We then decided we needed to find another dataset that drilled down into city level data to maximize our search for the best location to build a resort. 

## Step 2
Having obtained our desired datasets and APIs, we began the process of transforming the data. 

*World Happiness Score Dataset*
- Imported into jupyter notebook for cleaning
- Dropped all columns but "Overall Rank", "Country or Region", "Score", "Generosity", "Perceptions of Corruption"
- Sorted the new dataframe to show only the top 40 best ranked countries
- Saved cleaned dataframe as an output csv

*World Cities Database* 
- Imported into jupyter notebook for cleaning
- Removed columns so that only columns "City", "lat", "lng", "Country", and "Population" were present
- Filtered the dataset using the `isin` pandas function to return only cities within the Top 40 cities from the World Health Score dataset
- Sorted the remaining cities by population in descending order
- Group data by country and return the top 50 cities in each country based on population
- Created a column for "city_ID" as the index and primary key for collections later in a database
- Saved cleaned dataframe as an output csv

*Google Places API*
- Create a dataframe in jupyter notebook to save API data based off the cleaned World Cities database
- Create an API call to return a city's nearest airport name, address, and rating using specific parameters
- Use a for loop script to return airport information for each city
- Repeat the same process for an API call for nearby beaches
- Export both airport dataframe and beach dataframe into csv's

*OpenWeatherAPI*
- Create a dataframe in jupyter notebook to save API data based on cleaned World Cities database with open columns for "Min Temp", "Max Temp", "Humidity", and "Cloud Cover"
- Write a for loop script to return weather stats for each city in the World Cities database
- Export weather stats dataframe into a csv

## Step 3
We have seven tables to load into Postgres
   - Happiness 
   - Country (junction table)
   - City (junction table)
   - Cities
   - Airport Data
   - Beaches Data
   - Weather Data

- First Normal Form: there are no duplicate rows and each cell contains a single value. 
- Second and Third Normal Form: During the loading process, we’ve eliminated any columns that contained non partial and non-mutually exclusive data. For example, originally our Top Cities table contained city_ID and city (name) however you would still be able to determine the latitude and longitude of a city either by its city_ID or its city. We then created another junction table that contained the city_IDs and the city (name). This eliminates transitive dependencies as all attributes within each table is dependent on the table’s unique primary key. 

![project_2_ERD_2](https://user-images.githubusercontent.com/110507463/209033643-73d79298-3a22-4777-9985-403f7bc393b3.jpg)


## Final Summary
- Once all the data has been loaded into the database it can be used to find the best locations to build a resort based on desired parameters around airport access, nearby beaches, and overall weather
If we were to do things differently next time
- The historical aggregate weather data through OpenWeatherAPI is a paid subscription but the idea was to use historical weather data from the last year to get a summary of a city's typical weather
