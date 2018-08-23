
# Query on a normalized database

SELECT movie 
FROM nominations 
INNER JOIN ceremonies 
ON nominations.ceremony_id == ceremonies.id
WHERE ceremonies.year = 2010 AND nominations.won == 1 
;

# Specify tables & columns in SELECT
SELECT nominations.movie 
FROM nominations 
INNER JOIN ceremonies 
ON nominations.ceremony_id == ceremonies.id
WHERE ceremonies.year = 2010 AND nominations.won == 1 
;

SELECT ceremonies.year, ceremonies.host, nominations.movie, nominations.nominee
FROM nominations
INNER JOIN ceremonies
ON nominations.ceremony_id == ceremonies.id
WHERE ceremonies.year == 2010 
;


# Challenge:  
# Write a SQL query that returns all the movies for which the actress 
# Natalie Portman was nominated for an Oscar (you will indicate the nomination's year as well)
# Test the SQL query on DB Browser, and then display the results on Jupyter Notebook

SELECT ceremonies.year, nominations.nominee, nominations.category, nominations.movie, nominations.won
FROM nominations
INNER JOIN ceremonies
ON nominations.ceremony_id == ceremonies.id
WHERE nominations.nominee == "Natalie Portman"
;


SELECT ceremonies.year, nominations.nominee, nominations.category, nominations.movie, nominations.won FROM nominations INNER JOIN ceremonies ON nominations.ceremony_id == ceremonies.id WHERE nominations.nominee == "Natalie Portman";







