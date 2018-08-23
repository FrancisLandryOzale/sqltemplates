
# Virtual columns, aggregate functions and HAVING

# as share_employed is a virtual column composed of aggregate functions, WHERE doesn't work in this case
SELECT Major_category, AVG(Employed) / AVG(Total) AS share_employed
FROM recent_grads
GROUP BY Major_category
WHERE share_employed > 0.8 
;

#Applying HAVING: Find all "Major" categories in which the share of graduates with a job is greater than 80%
SELECT Major_category, AVG(Employed) / AVG(Total) AS share_employed
FROM recent_grads
GROUP BY Major_category
HAVING share_employed > 0.8
;

SELECT Major_category, AVG(Employed) / AVG(Total)*100 AS share_employed
FROM recent_grads
GROUP BY Major_category
HAVING share_employed > 80
;

# Challenge: Find all the "Major" categories in which the share of graduates with low revenues is greater than 10%
SELECT Major_category, AVG(Low_wage_Jobs) / AVG(Total) AS share_low_wage
FROM recent_grads
GROUP BY Major_category
HAVING share_low_wage > 0.1
;

SELECT Major_category, AVG(Low_wage_Jobs) / AVG(Total)*100 AS share_low_wage
FROM recent_grads
GROUP BY Major_category
HAVING share_low_wage > 10
;

#without HAVING
SELECT Major_category, AVG(Low_wage_Jobs) / AVG(Total) AS share_low_wage
FROM recent_grads
GROUP BY Major_category
;

SELECT Major_category, AVG(Low_wage_Jobs) / AVG(Total)*100 AS share_low_wage
FROM recent_grads
GROUP BY Major_category
;




