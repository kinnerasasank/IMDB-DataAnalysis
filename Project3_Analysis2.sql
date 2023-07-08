spool Project3_Analysis2.txt
set echo on
WITH CTE as (SELECT nconst,primaryname,Start_Year,Count_of_Movies,category,RANK() OVER
(PARTITION BY category
ORDER BY Count_of_Movies asc,Start_Year asc) as count_movies_rank
FROM
(
SELECT nconst,primaryname,min(startyear) as Start_Year,sum(count) Count_of_Movies,category
FROM 
(SELECT NB.nconst,NB.primaryname,TB.startyear,COUNT(*) as count,TP.category
   FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
   WHERE NB.nconst = TP.nconst AND
   	     TP.tconst = TB.tconst AND
         TB.startyear  BETWEEN '1979'  AND '1988' AND
  	     LOWER(TB.titleType) = 'movie' AND
  	     LOWER(TP.category) IN ('actress','actor') AND TB.startyear NOT LIKE '\N'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear,TP.category)
GROUP BY nconst,primaryname,category
having sum(count)>3
)
)
SELECT * FROM cte where count_movies_rank =(SELECT max(count_movies_rank)FROM cte where category='actor')
union all
SELECT * FROM cte where count_movies_rank =(SELECT max(count_movies_rank)FROM cte where category='actress')
union all
SELECT * FROM cte where count_movies_rank <(SELECT max(count_movies_rank)FROM cte );

set echo off

spool off
