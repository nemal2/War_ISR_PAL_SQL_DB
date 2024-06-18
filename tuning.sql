USE data_1;

explain(
SELECT a.Ref_full_name 
FROM adult_refugee AS a
LEFT JOIN child_refugee AS c ON a.Ref_full_name = c.Child_Ref_guardian_name
WHERE c.Child_Ref_guardian_name IS NULL
);

explain(
SELECT DISTINCT Child_Ref_guardian_name
 FROM child_refugee AS c
 WHERE NOT EXISTS (
     SELECT Child_Ref_Diseases
     FROM (SELECT DISTINCT Child_Ref_Diseases FROM child_refugee) AS d
     WHERE NOT EXISTS (
         SELECT *
         FROM child_refugee AS c2
         WHERE c.Child_Ref_guardian_name = c2.Child_Ref_guardian_name AND c2.Child_Ref_Diseases = d.Child_Ref_Diseases
     )
 ));
 
 explain (
 SELECT DISTINCT c.Child_Ref_guardian_name
FROM child_refugee AS c
JOIN (
    SELECT DISTINCT Child_Ref_Diseases 
    FROM child_refugee
) AS d ON 1=1
LEFT JOIN child_refugee AS c2 ON c2.Child_Ref_Diseases = d.Child_Ref_Diseases AND c.Child_Ref_guardian_name = c2.Child_Ref_guardian_name
GROUP BY c.Child_Ref_guardian_name
HAVING COUNT(DISTINCT c2.Child_Ref_Diseases) = (SELECT COUNT(DISTINCT Child_Ref_Diseases) FROM child_refugee));

explain(
 SELECT * FROM refugee_camp_info6
);

explain(
SELECT * FROM refugee_guardian_info5);

explain(SELECT * FROM refugee_camp_left_join3);

explain(
SELECT * FROM refugee_camp_left_join3
UNION
SELECT * FROM camp_officer_right_join);

explain(
SELECT * FROM refugee_camp_left_join3
UNION
SELECT * FROM camp_officer_right_join WHERE Officer_Name IS NOT NULL);

explain(
SELECT a.Ref_full_name, a.Ref_Health_Condition, a.Ref_Nid_number, c.Child_Ref_Diseases 
FROM adult_refugee AS a
JOIN child_refugee AS c ON a.Ref_full_name = c.Child_Ref_guardian_name
WHERE a.Ref_full_name IN (
    SELECT Ref_full_name
    FROM adult_refugee
    WHERE Child_Ref_Diseases = 'Allergy'
));

explain(
SELECT a.Ref_full_name, a.Ref_Health_Condition, a.Ref_Nid_number, c.Child_Ref_Diseases 
FROM adult_refugee AS a
JOIN (
    SELECT DISTINCT Child_Ref_guardian_name, Child_Ref_Diseases
    FROM child_refugee
) AS c ON a.Ref_full_name = c.Child_Ref_guardian_name
WHERE EXISTS (
    SELECT 1
    FROM child_refugee AS c2
    WHERE c2.Child_Ref_guardian_name = a.Ref_full_name AND c2.Child_Ref_Diseases = 'Allergy'
));

explain(SELECT Ref_full_name FROM adult_refugee
WHERE Ref_full_name NOT IN (
    SELECT Child_Ref_guardian_name FROM child_refugee
));

explain(
SELECT a.Ref_full_name 
FROM adult_refugee AS a
LEFT JOIN child_refugee AS c ON a.Ref_full_name = c.Child_Ref_guardian_name
WHERE c.Child_Ref_guardian_name IS NULL);