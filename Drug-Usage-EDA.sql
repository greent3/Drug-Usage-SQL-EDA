SELECT * FROM drug_consumption;

# EDA
-- % and number of total surveyees in each age group
SELECT Age, COUNT(*) AS total, (COUNT(*) * 100/(SELECT COUNT(*) FROM drug_consumption)) AS percentage
FROM drug_consumption
GROUP BY Age
ORDER BY Age;

-- % and number of total surveyees in each education group
SELECT Education, COUNT(*) AS total, (COUNT(*) * 100/(SELECT COUNT(*) FROM drug_consumption)) AS percentage
FROM drug_consumption
GROUP BY Education
ORDER BY 2 desc;

-- % and number of total surveyees for each gender
SELECT Gender, COUNT(*) AS total, (COUNT(*) * 100/(SELECT COUNT(*) FROM drug_consumption)) AS percentage
FROM drug_consumption
GROUP BY Gender
ORDER BY 2 desc;

-- % and number of total surveyees for each ethnicity
SELECT Ethnicity, COUNT(*) AS total, (COUNT(*) * 100/(SELECT COUNT(*) FROM drug_consumption)) AS percentage
FROM drug_consumption
GROUP BY Ethnicity
ORDER BY 3 desc;

-- Which decade had the highest percentage of high-school dropouts?
SELECT 
	sub.Age AS Age, sub.total_dropouts AS total_dropouts, (sub.total_dropouts/COUNT(*) *100) AS dropout_percentage
FROM 
	drug_consumption drug
JOIN 
	(SELECT Age, COUNT(*) AS total_dropouts
	FROM drug_consumption drug1
	WHERE Education like "Left school at%"
	GROUP BY Age
	ORDER BY Age) sub
ON drug.Age = sub.Age
GROUP BY sub.Age
ORDER BY dropout_percentage;

# Drug popularity

-- Drug popularity by number of users
SELECT 
	SUM(CASE WHEN Alcohol != 'CL0' THEN 1 ELSE NULL END) AS Alcohol,
    SUM(CASE WHEN Amphet != 'CL0' THEN 1 ELSE NULL END) AS Amphet,
    SUM(CASE WHEN Amyl != 'CL0' THEN 1 ELSE NULL END) AS Amyl,
    SUM(CASE WHEN Benzos != 'CL0' THEN 1 ELSE NULL END) AS Benzos,
    SUM(CASE WHEN Caff != 'CL0' THEN 1 ELSE NULL END) AS Caff,
    SUM(CASE WHEN Cannabis != 'CL0' THEN 1 ELSE NULL END) AS Cannabis,
    SUM(CASE WHEN Choc != 'CL0' THEN 1 ELSE NULL END) AS Choc,
    SUM(CASE WHEN Coke != 'CL0' THEN 1 ELSE NULL END) AS Coke,
    SUM(CASE WHEN Crack != 'CL0' THEN 1 ELSE NULL END) AS Crack,
    SUM(CASE WHEN Ecstasy != 'CL0' THEN 1 ELSE NULL END) AS Ecstasy,
    SUM(CASE WHEN Heroin != 'CL0' THEN 1 ELSE NULL END) AS Heroin,
    SUM(CASE WHEN Ketamine != 'CL0' THEN 1 ELSE NULL END) AS Ketamine,
    SUM(CASE WHEN Legalh != 'CL0' THEN 1 ELSE NULL END) AS Legalh,
    SUM(CASE WHEN LSD != 'CL0' THEN 1 ELSE NULL END) AS LSD,
    SUM(CASE WHEN Meth != 'CL0' THEN 1 ELSE NULL END) AS Meth,
    SUM(CASE WHEN Mushrooms != 'CL0' THEN 1 ELSE NULL END) AS Mushrooms,
    SUM(CASE WHEN Nicotine != 'CL0' THEN 1 ELSE NULL END) AS Nicotine,
    SUM(CASE WHEN VSA != 'CL0' THEN 1 ELSE NULL END) AS VSA
FROM drug_consumption;


-- Most used illegal drugs
SELECT 
    SUM(CASE WHEN Amphet != 'CL0' THEN 1 ELSE NULL END) AS Amphet,
    SUM(CASE WHEN Amyl != 'CL0' THEN 1 ELSE NULL END) AS Amyl,
    SUM(CASE WHEN Benzos != 'CL0' THEN 1 ELSE NULL END) AS Benzos,
    SUM(CASE WHEN Cannabis != 'CL0' THEN 1 ELSE NULL END) AS Cannabis,
    SUM(CASE WHEN Coke != 'CL0' THEN 1 ELSE NULL END) AS Coke,
    SUM(CASE WHEN Crack != 'CL0' THEN 1 ELSE NULL END) AS Crack,
    SUM(CASE WHEN Ecstasy != 'CL0' THEN 1 ELSE NULL END) AS Ecstasy,
    SUM(CASE WHEN Heroin != 'CL0' THEN 1 ELSE NULL END) AS Heroin,
    SUM(CASE WHEN Ketamine != 'CL0' THEN 1 ELSE NULL END) AS Ketamine,
    SUM(CASE WHEN Legalh != 'CL0' THEN 1 ELSE NULL END) AS Legalh,
    SUM(CASE WHEN LSD != 'CL0' THEN 1 ELSE NULL END) AS LSD,
    SUM(CASE WHEN Meth != 'CL0' THEN 1 ELSE NULL END) AS Meth,
    SUM(CASE WHEN Mushrooms != 'CL0' THEN 1 ELSE NULL END) AS Mushrooms,
    SUM(CASE WHEN VSA != 'CL0' THEN 1 ELSE NULL END) AS VSA
FROM drug_consumption;
    
-- Most popular drugs by age + which drugs are increasing in popularity over time?
SELECT 
	sub.Age, 
	(sub.num_alcohol_users*100/sub.num_surveyees) AS perc_alcohol_users,
    (sub.num_amphet_users*100/sub.num_surveyees) AS perc_amphet_users,
    (sub.num_amyl_users*100/sub.num_surveyees) AS perc_amyl_users,
    (sub.num_benzos_users*100/sub.num_surveyees) AS perc_benzos_users,
    (sub.num_caffeine_users*100/sub.num_surveyees) AS perc_caffeine_users,
    (sub.num_cannabis_users*100/sub.num_surveyees) AS perc_cannabis_users,
    (sub.num_choc_users*100/sub.num_surveyees) AS perc_choc_users,
    (sub.num_coke_users*100/sub.num_surveyees) AS perc_coke_users,
    (sub.num_crack_users*100/sub.num_surveyees) AS perc_crack_users,
    (sub.num_ecstasy_users*100/sub.num_surveyees) AS perc_ecstasy_users,
    (sub.num_heroin_users*100/sub.num_surveyees) AS perc_heroin_users,
    (sub.num_ketamine_users*100/sub.num_surveyees) AS perc_ketamine_users,
    (sub.num_legalh_users*100/sub.num_surveyees) AS perc_legalh_users,
    (sub.num_LSD_users*100/sub.num_surveyees) AS perc_LSD_users,
    (sub.num_meth_users*100/sub.num_surveyees) AS perc_meth_users,
    (sub.num_mushrooms_users*100/sub.num_surveyees) AS perc_mushrooms_users,
    (sub.num_nicotine_users*100/sub.num_surveyees) AS perc_nicotine_users,
    (sub.num_VSA_users*100/sub.num_surveyees) AS perc_VSA_users
FROM (
	SELECT 
		Age, 
        Count(*) AS num_surveyees, 
        SUM(CASE WHEN Alcohol != 'CL0' THEN 1 ELSE NULL END) AS num_alcohol_users,
		SUM(CASE WHEN Amphet != 'CL0' THEN 1 ELSE NULL END) AS num_amphet_users,
		SUM(CASE WHEN Amyl != 'CL0' THEN 1 ELSE NULL END) AS num_amyl_users,
		SUM(CASE WHEN Benzos != 'CL0' THEN 1 ELSE NULL END) AS num_benzos_users,
		SUM(CASE WHEN Caff != 'CL0' THEN 1 ELSE NULL END) AS num_caffeine_users,
		SUM(CASE WHEN Cannabis != 'CL0' THEN 1 ELSE NULL END) AS num_cannabis_users,
		SUM(CASE WHEN Choc != 'CL0' THEN 1 ELSE NULL END) AS num_choc_users,
		SUM(CASE WHEN Coke != 'CL0' THEN 1 ELSE NULL END) AS num_coke_users,
		SUM(CASE WHEN Crack != 'CL0' THEN 1 ELSE NULL END) AS num_crack_users,
		SUM(CASE WHEN Ecstasy != 'CL0' THEN 1 ELSE NULL END) AS num_ecstasy_users,
		SUM(CASE WHEN Heroin != 'CL0' THEN 1 ELSE NULL END) AS num_heroin_users,
		SUM(CASE WHEN Ketamine != 'CL0' THEN 1 ELSE NULL END) AS num_ketamine_users,
		SUM(CASE WHEN Legalh != 'CL0' THEN 1 ELSE NULL END) AS num_legalh_users,
		SUM(CASE WHEN LSD != 'CL0' THEN 1 ELSE NULL END) AS num_LSD_users,
		SUM(CASE WHEN Meth != 'CL0' THEN 1 ELSE NULL END) AS num_meth_users,
		SUM(CASE WHEN Mushrooms != 'CL0' THEN 1 ELSE NULL END) AS num_mushrooms_users,
		SUM(CASE WHEN Nicotine != 'CL0' THEN 1 ELSE NULL END) AS num_nicotine_users,
		SUM(CASE WHEN VSA != 'CL0' THEN 1 ELSE NULL END) AS num_VSA_users
    FROM drug_consumption
    GROUP BY Age
	ORDER BY Age
) sub
GROUP BY Age
ORDER BY Age;


-- Most popular regularly-used drugs by education
SELECT 
	sub.Education, 
	(sub.num_alcohol_users*100/sub.num_surveyees) AS perc_alcohol_users,
    (sub.num_amphet_users*100/sub.num_surveyees) AS perc_amphet_users,
    (sub.num_amyl_users*100/sub.num_surveyees) AS perc_amyl_users,
    (sub.num_benzos_users*100/sub.num_surveyees) AS perc_benzos_users,
    (sub.num_caffeine_users*100/sub.num_surveyees) AS perc_caffeine_users,
    (sub.num_cannabis_users*100/sub.num_surveyees) AS perc_cannabis_users,
    (sub.num_choc_users*100/sub.num_surveyees) AS perc_choc_users,
    (sub.num_coke_users*100/sub.num_surveyees) AS perc_coke_users,
    (sub.num_crack_users*100/sub.num_surveyees) AS perc_crack_users,
    (sub.num_ecstasy_users*100/sub.num_surveyees) AS perc_ecstasy_users,
    (sub.num_heroin_users*100/sub.num_surveyees) AS perc_heroin_users,
    (sub.num_ketamine_users*100/sub.num_surveyees) AS perc_ketamine_users,
    (sub.num_legalh_users*100/sub.num_surveyees) AS perc_legalh_users,
    (sub.num_LSD_users*100/sub.num_surveyees) AS perc_LSD_users,
    (sub.num_meth_users*100/sub.num_surveyees) AS perc_meth_users,
    (sub.num_mushrooms_users*100/sub.num_surveyees) AS perc_mushrooms_users,
    (sub.num_nicotine_users*100/sub.num_surveyees) AS perc_nicotine_users,
    (sub.num_VSA_users*100/sub.num_surveyees) AS perc_VSA_users
FROM (
	SELECT 
		Education, 
        Count(*) AS num_surveyees, 
        SUM(CASE WHEN Alcohol >= 'CL4' THEN 1 ELSE NULL END) AS num_alcohol_users,
		SUM(CASE WHEN Amphet >= 'CL4' THEN 1 ELSE NULL END) AS num_amphet_users,
		SUM(CASE WHEN Amyl >= 'CL4' THEN 1 ELSE NULL END) AS num_amyl_users,
		SUM(CASE WHEN Benzos >= 'CL4' THEN 1 ELSE NULL END) AS num_benzos_users,
		SUM(CASE WHEN Caff >= 'CL4' THEN 1 ELSE NULL END) AS num_caffeine_users,
		SUM(CASE WHEN Cannabis >= 'CL4' THEN 1 ELSE NULL END) AS num_cannabis_users,
		SUM(CASE WHEN Choc >= 'CL4' THEN 1 ELSE NULL END) AS num_choc_users,
		SUM(CASE WHEN Coke >= 'CL4' THEN 1 ELSE NULL END) AS num_coke_users,
		SUM(CASE WHEN Crack >= 'CL4' THEN 1 ELSE NULL END) AS num_crack_users,
		SUM(CASE WHEN Ecstasy >= 'CL4' THEN 1 ELSE NULL END) AS num_ecstasy_users,
		SUM(CASE WHEN Heroin >= 'CL4' THEN 1 ELSE NULL END) AS num_heroin_users,
		SUM(CASE WHEN Ketamine >= 'CL4' THEN 1 ELSE NULL END) AS num_ketamine_users,
		SUM(CASE WHEN Legalh >= 'CL4' THEN 1 ELSE NULL END) AS num_legalh_users,
		SUM(CASE WHEN LSD >= 'CL4' THEN 1 ELSE NULL END) AS num_LSD_users,
		SUM(CASE WHEN Meth >= 'CL4' THEN 1 ELSE NULL END) AS num_meth_users,
		SUM(CASE WHEN Mushrooms >= 'CL4' THEN 1 ELSE NULL END) AS num_mushrooms_users,
		SUM(CASE WHEN Nicotine >= 'CL4' THEN 1 ELSE NULL END) AS num_nicotine_users,
		SUM(CASE WHEN VSA >= 'CL4' THEN 1 ELSE NULL END) AS num_VSA_users
    FROM drug_consumption
    GROUP BY Education
	ORDER BY Education
) sub
ORDER BY Education;

-- Most popular regularly-used drugs by age
SELECT 
	sub.Age, 
	(sub.num_alcohol_users*100/sub.num_surveyees) AS perc_alcohol_users,
    (sub.num_amphet_users*100/sub.num_surveyees) AS perc_amphet_users,
    (sub.num_amyl_users*100/sub.num_surveyees) AS perc_amyl_users,
    (sub.num_benzos_users*100/sub.num_surveyees) AS perc_benzos_users,
    (sub.num_caffeine_users*100/sub.num_surveyees) AS perc_caffeine_users,
    (sub.num_cannabis_users*100/sub.num_surveyees) AS perc_cannabis_users,
    (sub.num_choc_users*100/sub.num_surveyees) AS perc_choc_users,
    (sub.num_coke_users*100/sub.num_surveyees) AS perc_coke_users,
    (sub.num_crack_users*100/sub.num_surveyees) AS perc_crack_users,
    (sub.num_ecstasy_users*100/sub.num_surveyees) AS perc_ecstasy_users,
    (sub.num_heroin_users*100/sub.num_surveyees) AS perc_heroin_users,
    (sub.num_ketamine_users*100/sub.num_surveyees) AS perc_ketamine_users,
    (sub.num_legalh_users*100/sub.num_surveyees) AS perc_legalh_users,
    (sub.num_LSD_users*100/sub.num_surveyees) AS perc_LSD_users,
    (sub.num_meth_users*100/sub.num_surveyees) AS perc_meth_users,
    (sub.num_mushrooms_users*100/sub.num_surveyees) AS perc_mushrooms_users,
    (sub.num_nicotine_users*100/sub.num_surveyees) AS perc_nicotine_users,
    (sub.num_VSA_users*100/sub.num_surveyees) AS perc_VSA_users
FROM (
	SELECT 
		Age, 
        Count(*) AS num_surveyees, 
        SUM(CASE WHEN Alcohol >= 'CL4' THEN 1 ELSE NULL END) AS num_alcohol_users,
		SUM(CASE WHEN Amphet >= 'CL4' THEN 1 ELSE NULL END) AS num_amphet_users,
		SUM(CASE WHEN Amyl >= 'CL4' THEN 1 ELSE NULL END) AS num_amyl_users,
		SUM(CASE WHEN Benzos >= 'CL4' THEN 1 ELSE NULL END) AS num_benzos_users,
		SUM(CASE WHEN Caff >= 'CL4' THEN 1 ELSE NULL END) AS num_caffeine_users,
		SUM(CASE WHEN Cannabis >= 'CL4' THEN 1 ELSE NULL END) AS num_cannabis_users,
		SUM(CASE WHEN Choc >= 'CL4' THEN 1 ELSE NULL END) AS num_choc_users,
		SUM(CASE WHEN Coke >= 'CL4' THEN 1 ELSE NULL END) AS num_coke_users,
		SUM(CASE WHEN Crack >= 'CL4' THEN 1 ELSE NULL END) AS num_crack_users,
		SUM(CASE WHEN Ecstasy >= 'CL4' THEN 1 ELSE NULL END) AS num_ecstasy_users,
		SUM(CASE WHEN Heroin >= 'CL4' THEN 1 ELSE NULL END) AS num_heroin_users,
		SUM(CASE WHEN Ketamine >= 'CL4' THEN 1 ELSE NULL END) AS num_ketamine_users,
		SUM(CASE WHEN Legalh >= 'CL4' THEN 1 ELSE NULL END) AS num_legalh_users,
		SUM(CASE WHEN LSD >= 'CL4' THEN 1 ELSE NULL END) AS num_LSD_users,
		SUM(CASE WHEN Meth >= 'CL4' THEN 1 ELSE NULL END) AS num_meth_users,
		SUM(CASE WHEN Mushrooms >= 'CL4' THEN 1 ELSE NULL END) AS num_mushrooms_users,
		SUM(CASE WHEN Nicotine >= 'CL4' THEN 1 ELSE NULL END) AS num_nicotine_users,
		SUM(CASE WHEN VSA >= 'CL4' THEN 1 ELSE NULL END) AS num_VSA_users
    FROM drug_consumption
    GROUP BY Age
	ORDER BY Age
) sub
ORDER BY Age;

-- Which education level is more likely to overreport drug usage?
-- (Note: Semer is a fake drug used to identify overreporters)
SELECT Education, COUNT(*)
FROM drug_consumption
WHERE Semer != "CL0"
GROUP BY Education;


