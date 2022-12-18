# Project_2_ETL_KPflugi_ZCrowley
UMN BootCamp- Project 2- Extract, Transform, and Load 

- Where to build a resort in the world? 

World Happiness Report - https://www.kaggle.com/datasets/unsdsn/world-happiness?resource=download&select=2019.csv 

City Quality of Life Dataset - https://www.kaggle.com/datasets/orhankaramancode/city-quality-of-life-dataset

World cities database - https://www.kaggle.com/datasets/juanmah/world-cities
    - for this cite as source: https://simplemaps.com/data/world-cities 

Google Places API- Tourism/geographical-beaches-ski resorts-

OpenWeatherAPI - Solar Days, Ave Temp, Precipitation

## How to execute:

## 1. Load and clean data from .csv files--
### Decide which columns should be used from the Kaggle dataset - World Happiness RepostData:
- Overall Rank column
- Country or Region
- Score
- GDP per captia?
### Decide which columns should be used from the Kaggle dataset- World cities data
- city	
- lat	
- lng	
- country	
- population

## 2. API Calls 
### Google API
- Tourist attractions?
- Beach?
- Museums
- Hiking
- Ski resort
  
### Open Weather API – aggregate stats – yearly, monthly, weekly, etc https://openweathermap.org/api/statistics-api
- Min temps
- Max temps
- Precipitation?
- Clouds?
- Solar days?
  
### 3. Load into the NoSQL- MongoDB-

