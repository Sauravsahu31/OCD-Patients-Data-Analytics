--Query 1: Find the top 3 obsession types with the highest average Y-BOCS score (Obsessions)
SELECT TOP 3 Obsession_Type, AVG(Y_BOCS_Score_Obsessions) AS Average_Y_BOCS_Score
FROM ocd_patient_dataset
GROUP BY Obsession_Type
ORDER BY Average_Y_BOCS_Score DESC;

--Query 2: Get the count of patients with each education level, grouped by ethnicity
SELECT Ethnicity, Education_Level, COUNT(*) AS Count
FROM ocd_patient_dataset
GROUP BY Ethnicity, Education_Level
ORDER BY Ethnicity, Education_Level;

--Query 3: Find the patients with the maximum compulsion and obsession scores who have a depression diagnosis
    SELECT TOP 1 Patient_ID, Y_BOCS_Score_Compulsions, Gender, Ethnicity, Age, Marital_Status, Education_Level
    FROM ocd_patient_dataset
    WHERE Depression_Diagnosis = 1
    ORDER BY Y_BOCS_Score_Compulsions DESC

    SELECT TOP 1 Patient_ID, Y_BOCS_Score_Obsessions, Gender, Ethnicity, Age, Marital_Status, Education_Level
    FROM ocd_patient_dataset
    WHERE Depression_Diagnosis = 1
    ORDER BY Y_BOCS_Score_Obsessions DESC


--Query 4: Calculate the average duration of symptoms (in months) for patients with each marital status
SELECT Marital_Status, AVG(Duration_of_Symptoms_months) AS Average_Duration
FROM ocd_patient_dataset
GROUP BY Marital_Status
ORDER BY Average_Duration DESC;

--Query 5: Find the count of patients with each compulsion type, grouped by obsession type
SELECT Obsession_Type, Compulsion_Type, COUNT(*) AS Count
FROM ocd_patient_dataset
GROUP BY Obsession_Type, Compulsion_Type
ORDER BY Obsession_Type, Compulsion_Type;


--Query 6: Get the list of patients with a Family History of OCD, grouped by ethnicity
SELECT Ethnicity, count(Patient_ID) as Patient_Count
FROM ocd_patient_dataset
WHERE Family_History_of_OCD = 1
GROUP BY Ethnicity
ORDER BY Ethnicity DESC;


--Query 7: Calculate the average Y-BOCS score (Obsessions) for patients with each medication type
SELECT Medications, AVG(Y_BOCS_Score_Obsessions) AS Average_Y_BOCS_Score
FROM ocd_patient_dataset
GROUP BY Medications
ORDER BY Average_Y_BOCS_Score DESC;

--Query 8: Find the TOP 3 patient with the longest duration of symptoms who has an Anxiety diagnosis
SELECT TOP 3 Patient_ID, Duration_of_Symptoms_months
FROM ocd_patient_dataset
WHERE Anxiety_Diagnosis = 1
ORDER BY Duration_of_Symptoms_months DESC;

--Query 9: Get the count of patients with each diagnosis date year
SELECT YEAR(OCD_Diagnosis_Date) AS Diagnosis_Year, COUNT(*) AS Count
FROM ocd_patient_dataset
GROUP BY YEAR(OCD_Diagnosis_Date)
ORDER BY Diagnosis_Year DESC;

--Query 10: Find the count of patients with each obsession type, grouped by gender
SELECT Gender, Obsession_Type, COUNT(*) AS Count
FROM ocd_patient_dataset
GROUP BY Gender, Obsession_Type
ORDER BY Gender, Obsession_Type;

--Query 11: Count of Patients by Ethnicity and their respective Average Obsession Score
SELECT Ethnicity, COUNT(*) as Count, AVG(Y_BOCS_Score_Obsessions) as Avg_Score
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1 AND Y_BOCS_Score_Obsessions > 0
GROUP BY Ethnicity
ORDER BY Count DESC, Avg_Score DESC;

--Query 12: Number of people diagnosed with OCD Year
SELECT FORMAT(OCD_Diagnosis_Date, 'yyyy') AS Year, 
       COUNT(DISTINCT Patient_ID) AS Num_Patients
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1
GROUP BY FORMAT(OCD_Diagnosis_Date, 'yyyy')
ORDER BY FORMAT(OCD_Diagnosis_Date, 'yyyy') ASC;

--Query 13: Number of people diagnosed with OCD Month
SELECT FORMAT(OCD_Diagnosis_Date, 'yyyy-MM') AS Month, 
       COUNT(DISTINCT Patient_ID) AS Num_Patients
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1
GROUP BY FORMAT(OCD_Diagnosis_Date, 'yyyy-MM')
ORDER BY FORMAT(OCD_Diagnosis_Date, 'yyyy-MM') ASC;

--Query 14: What is the most common Compulsion type (Count) & it's respective Average Obsession Score
SELECT TOP 1 Compulsion_Type, COUNT(*) as Count, AVG(Y_BOCS_Score_Compulsions) as Avg_Score
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1 AND Y_BOCS_Score_Compulsions > 0
GROUP BY Compulsion_Type
ORDER BY Count DESC, Avg_Score DESC;

--Query 15:What is the most common Obsession Type (Count) & it's respective Average Obsession Score
SELECT TOP 1 Obsession_Type, COUNT(*) as Count, AVG(Y_BOCS_Score_Obsessions) as Avg_Score
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1 AND Y_BOCS_Score_Obsessions > 0
GROUP BY Obsession_Type
ORDER BY Count DESC, Avg_Score DESC;

--Query 16:Find the minimum, maximum, and average age of patients who have a Y-BOCS score for obsessions greater than 25, grouped by gender:
SELECT Gender, MIN(Age) as Min_Age, MAX(Age) as Max_Age, AVG(Age) as Avg_Age
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1 AND Y_BOCS_Score_Obsessions > 25
GROUP BY Gender
ORDER BY Avg_Age DESC;

--Query 17:Find the number of patients who have a Y-BOCS score for compulsions greater than 20, grouped by ethnicity and education level
SELECT Ethnicity, Education_Level, COUNT(*) as Patient_Count
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1 AND Y_BOCS_Score_Compulsions > 20
GROUP BY Ethnicity, Education_Level
ORDER BY Patient_Count DESC;

--Query 18:Find the number of patients who have both Depression and Family History of OCD, grouped by ethnicity
SELECT Ethnicity, COUNT(*) as Patient_Count
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1 AND Family_History_of_OCD = 1
GROUP BY Ethnicity
ORDER BY Patient_Count DESC;

--Query 19:Find the average Y-BOCS scores for compulsions and obsessions, grouped by gender and marital status:
SELECT Gender, Marital_Status, AVG(Y_BOCS_Score_Compulsions) as Avg_Compulsions, AVG(Y_BOCS_Score_Obsessions) as Avg_Obsessions
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1
GROUP BY Gender, Marital_Status
ORDER BY Avg_Compulsions DESC, Avg_Obsessions DESC;

--Query 20:Find the number of patients who have a Y-BOCS score for compulsions greater than 20, grouped by ethnicity and education level
SELECT Ethnicity, Education_Level, COUNT(*) as Patient_Count
FROM ocd_patient_dataset
WHERE Depression_Diagnosis = 1 AND Y_BOCS_Score_Compulsions > 20
GROUP BY Ethnicity, Education_Level
ORDER BY Patient_Count DESC;



