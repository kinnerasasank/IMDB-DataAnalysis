spool test.txt
set echo on
-------------------------------analysis 1a--------------------------------
--laurence olivier
 SELECT NB.primaryname,TB.startyear,COUNT(*)
    FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
    WHERE NB.nconst = TP.nconst AND
    	     TP.tconst = TB.tconst AND
    	     NB.nconst = 'nm0000059' AND
   	         LOWER(TB.titleType) = 'movie' AND
    	     LOWER(TP.category) IN ('actor') AND TB.startyear NOT LIKE '\N'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear
    ORDER BY TB.STARTYEAR desc,COUNT(*) DESC;
  
  
  --Grace Kelly
 SELECT NB.primaryname,TB.startyear,COUNT(*)
    FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
    WHERE NB.nconst = TP.nconst AND
    	     TP.tconst = TB.tconst AND
    	     NB.nconst = 'nm0000038' AND
   	         LOWER(TB.titleType) = 'movie' AND
    	     LOWER(TP.category) IN ('actress') AND TB.startyear NOT LIKE '\N'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear
    ORDER BY TB.STARTYEAR desc,COUNT(*) DESC;
    
-- Mammootty   
  SELECT NB.primaryname,TB.startyear,COUNT(*)
    FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
    WHERE NB.nconst = TP.nconst AND
    	     TP.tconst = TB.tconst AND
    	     NB.nconst = 'nm0007123' AND
   	         LOWER(TB.titleType) = 'movie' AND
    	     LOWER(TP.category) IN ('actor') AND TB.startyear NOT LIKE '\N'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear
    ORDER BY TB.STARTYEAR desc,COUNT(*) DESC;
    
 --suhasini
SELECT NB.primaryname,TB.startyear,COUNT(*)
    FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
    WHERE NB.nconst = TP.nconst AND
    	     TP.tconst = TB.tconst AND
    	     NB.nconst = 'nm0007124' AND
   	         LOWER(TB.titleType) = 'movie' AND
    	     LOWER(TP.category) IN ('actress') AND TB.startyear NOT LIKE '\N'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear
    ORDER BY TB.STARTYEAR desc,COUNT(*) DESC;
    
-----------------------------------------------analysis 1b------------------------------------------    

--laurance
SELECT "primaryname","set" as "Year Range",sum(c) as "Number of Movies"
FROM 
(
SELECT NB.primaryname as "primaryname" ,TB.startyear as y,COUNT(*)  as c,
case when TB.startyear >='1930' and TB.startyear <='1953' then '1930-1953' 
     when TB.startyear >='1954' and TB.startyear <='1976' then '1954-1976'
     when TB.startyear >='1977' and TB.startyear <='1999' then '1977-1999'
     when TB.startyear >='2000' and TB.startyear <='2022' then '2000-2022'  end as "set"
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
	     TP.tconst = TB.tconst AND
	     NB.nconst = 'nm0000059' AND
	     LOWER(TB.titleType) = 'movie' AND
	     LOWER(TP.category) IN ('actor') AND TB.startyear NOT LIKE '\N' 
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY  COUNT(*) DESC
) span
GROUP BY "primaryname","set"
ORDER BY  "set" DESC;

--grace kelly
SELECT "primaryname","set" as "Year Range",sum(c) as "Number of Movies"
FROM 
(
SELECT NB.primaryname as "primaryname" ,TB.startyear as y,COUNT(*)  as c,
case when TB.startyear >='1930' and TB.startyear <='1953' then '1930-1953' 
     when TB.startyear >='1954' and TB.startyear <='1976' then '1954-1976'
     when TB.startyear >='1977' and TB.startyear <='1999' then '1977-1999'
     when TB.startyear >='2000' and TB.startyear <='2022' then '2000-2022'  end as "set"
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
	     TP.tconst = TB.tconst AND
         NB.nconst = 'nm0000038' AND
	     LOWER(TB.titleType) = 'movie' AND
	     LOWER(TP.category) IN ('actress') AND TB.startyear NOT LIKE '\N' 
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY  COUNT(*) DESC
) span
Where "set" is not null
GROUP BY "primaryname","set"
ORDER BY  "set" DESC;

--mammootty
SELECT "primaryname","set" as "Year Range",sum(c) as "Number of Movies"
FROM 
(
SELECT NB.primaryname as "primaryname" ,TB.startyear as y,COUNT(*)  as c,
case when TB.startyear >='1930' and TB.startyear <='1953' then '1930-1953' 
     when TB.startyear >='1954' and TB.startyear <='1976' then '1954-1976'
     when TB.startyear >='1977' and TB.startyear <='1999' then '1977-1999'
     when TB.startyear >='2000' and TB.startyear <='2022' then '2000-2022'  end as "set"
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
	     TP.tconst = TB.tconst AND
         NB.nconst = 'nm0007123' AND
	     LOWER(TB.titleType) = 'movie' AND
	     LOWER(TP.category) IN ('actor') AND TB.startyear NOT LIKE '\N' 
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY  COUNT(*) DESC
) span
GROUP BY "primaryname","set";
--suhasini
SELECT "primaryname","set" as "Year Range",sum(c) as "Number of Movies"
FROM 
(
SELECT NB.primaryname as "primaryname" ,TB.startyear as y,COUNT(*)  as c,
case when TB.startyear >='1930' and TB.startyear <='1953' then '1930-1953' 
     when TB.startyear >='1954' and TB.startyear <='1976' then '1954-1976'
     when TB.startyear >='1977' and TB.startyear <='1999' then '1977-1999'
     when TB.startyear >='2000' and TB.startyear <='2022' then '2000-2022'  end as "set"
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
	     TP.tconst = TB.tconst AND
         NB.nconst = 'nm0007124' AND
	     LOWER(TB.titleType) = 'movie' AND
	     LOWER(TP.category) IN ('actress') AND TB.startyear NOT LIKE '\N' 
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY  COUNT(*) DESC
) span
GROUP BY "primaryname","set";

set echo off

spool off