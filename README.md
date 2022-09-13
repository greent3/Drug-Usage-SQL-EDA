# Exploring Data About Legal and Illegal Drug Usage

### With our SQL queries, we're able to answer questions like:
  #### Do graduate degree holders use caffeine more often than less educated people? (Hint: Yes they do!)
  #### Which illegal drugs are becoming more popular over the decades?
  #### Are less educated people more likely to lie about (overreport) drug usage?

### It's worth noting that:
  #### This data would be better served with heatmaps to check for correlations between values like NScore, Alcohol usage, etc. 
  #### If we we decided not to include overreporters in our analysis, it'd be best to remove overreporting surveyee data from our dataset prior to do analysis.
 
Disclaimer: Like most datasets, the data is biased in many ways. (Ex: There are less than twenty 65+y/o surveyees, most of the surveyees are white and from the UK, etc. ). 

### More about the dataset
Database contains records for 1885 respondents. For each respondent 12 attributes are known: Personality measurements which include NEO-FFI-R (neuroticism, extraversion, openness to experience, agreeableness, and conscientiousness), BIS-11 (impulsivity), and ImpSS (sensation seeking), level of education, age, gender, country of residence and ethnicity. All input attributes are originally categorical and are quantified. After quantification values of all input features can be considered as real-valued. In addition, participants were questioned concerning their use of 18 legal and illegal drugs (alcohol, amphetamines, amyl nitrite, benzodiazepine, cannabis, chocolate, cocaine, caffeine, crack, ecstasy, heroin, ketamine, legal highs, LSD, methadone, mushrooms, nicotine and volatile substance abuse and one fictitious drug (Semeron) which was introduced to identify over-claimers. For each drug they have to select one of the answers: never used the drug, used it over a decade ago, or in the last decade, year, month, week, or day.
Dataset taken from Kaggle: https://www.kaggle.com/datasets/obeykhadija/drug-consumptions-uci
