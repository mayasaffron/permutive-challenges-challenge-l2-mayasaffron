/* 1. List of unique titles in pageviews from mynews.com domain.

I used the below command, so that i could get into the news.com domain and create a list of the titles. */

SELECT DISTINCT 
  title
FROM
  `permutive-bigquery-staging.l2_challenge.pageviews`
WHERE domain='mynews.com'

/* Solution for the above 
	
1	Home
2	Nothing bad to report
3	Perfect weather on the way!
*/

/* 2. List of all pageviews (all columns) where user_id is replaced with Anonymous if the user tier is 0, Free if 1, Premium if 2. */
/* for this i understood that i needed to replace the tier in the users table with the tier names; anonymous, free and premimum . 
To do this i first attempted to jouin the two tables together and then wanted to replace the user_id's with the tier names

Below is the statement used to join the tables together  */
SELECT
  *
FROM
  `permutive-bigquery-staging.l2_challenge.pageviews`
INNER JOIN
  `permutive-bigquery-staging.l2_challenge.users`
ON
  `permutive-bigquery-staging.l2_challenge.pageviews`.user_id = `permutive-bigquery-staging.l2_challenge.users`.user_id;

/* Solution for the above 

event_id	user_id	domain	location	date	title	user_id_1	tier	Record Count
e00004	u004	mynews.com	l006	Jul 3, 2020	Home	u004	0	1
e00013	u003	awesome.com	null	Jul 5, 2020	Home	u003	1	1
e00003	u005	awesome.com	l002	Jul 2, 2020	Edge is the way	u005	0	1
e00010	u003	awesome.com	l005	Jul 4, 2020	Edge is the way	u003	1	1
e00017	u001	awesome.com	l002	Jul 6, 2020	Edge is the way	u001	2	1
e00005	u002	mynews.com	l005	Jul 3, 2020	Nothing bad to report	u002	0	1
e00008	u006	mynews.com	l005	Jul 4, 2020	Nothing bad to report	u006	1	1
e00011	u001	mynews.com	l004	Jul 5, 2020	Nothing bad to report	u001	2	1
e00007	u004	mynews.com	null	Jul 4, 2020	Perfect weather on the way!	u004	0	1
e00012	u005	mynews.com	l001	Jul 5, 2020	Perfect weather on the way!	u005	0	1
e00016	u003	mynews.com	null	Jul 6, 2020	Perfect weather on the way!	u003	1	1
e00009	u006	awesome.com	l006	Jul 4, 2020	Cloud computing - is it the future?	u006	1	1
e00002	u002	awesome.com	null	Jul 2, 2020	Cloud computing - is it the future?	u002	0	1
e00015	u006	awesome.com	l002	Jul 5, 2020	Edge is the way	u006	1	1
e00014	u003	mynews.com	l006	Jul 5, 2020	Home	u003	1	1
e00001	u001	awesome.com	l001	Jul 2, 2020	Home	u001	2	1
e00006	u001	awesome.com	null	Jul 4, 2020	Home	u001	2	1

/*

/* Now i wanted to change what was displayed in the data as we didnt need to have the user_id and tier visible BUT we did want them to be joined so that we could manioulate the data */ 

SELECT
  event_id,`permutive-bigquery-staging.l2_challenge.pageviews`.user_id, domain, location, date, title
FROM
  `permutive-bigquery-staging.l2_challenge.pageviews`
INNER JOIN
  `permutive-bigquery-staging.l2_challenge.users`
ON
  `permutive-bigquery-staging.l2_challenge.pageviews`.user_id = `permutive-bigquery-staging.l2_challenge.users`.user_id;\

/* I struggled with the 'user_id' because it was deemed ambiguous, so i needed to specify the data set */
/* Now i wanted to attempt to swap the tier values for the names */ 

ALTER TABLE 
  `permutive-bigquery-staging.l2_challenge.users`
ADD
    tier_name varchar(255);
UPDATE 
`permutive-bigquery-staging.l2_challenge.users`
SET tier_name = 
  CASE
    WHEN `permutive-bigquery-staging.l2_challenge.users`.tier = 0 THEN 'Anonymous'
    WHEN `permutive-bigquery-staging.l2_challenge.users`.tier = 1 THEN 'Free'
    WHEN `permutive-bigquery-staging.l2_challenge.users`.tier = 2 THEN 'Premium'
END; 

SELECT
  event_id,`permutive-bigquery-staging.l2_challenge.pageviews`.tier_name, domain, location, date, title
FROM
  `permutive-bigquery-staging.l2_challenge.pageviews`
INNER JOIN
  `permutive-bigquery-staging.l2_challenge.users`
ON
  `permutive-bigquery-staging.l2_challenge.pageviews`.user_id = `permutive-bigquery-staging.l2_challenge.users`.user_id;
/* Solution for the above 
	
was unable to create the solution because it was a billing setting issue- this is the imagined solution:

*/

/* 3. 

For this i first needed to get the awesom.com details and then needed to change the location to list the country name  */
SELECT
  date, title, location
FROM
  `permutive-bigquery-staging.l2_challenge.pageviews`
WHERE domain = 'awesome.com'

/* solution for above 

	
2020-07-04
Home
null
2	
2020-07-02
Home
l001
3	
2020-07-05
Home
null
4	
2020-07-02
Edge is the way
l002
5	
2020-07-04
Edge is the way
l005
6	
2020-07-05
Edge is the way
l002
7	
2020-07-06
Edge is the way
l002
8	
2020-07-02
Cloud computing - is it the future?
null
9	
2020-07-04
Cloud computing - is it the future?
l006


next needded to do an inner join

*/ 
SELECT
  date,
  title,
  country
FROM
  `permutive-bigquery-staging.l2_challenge.pageviews`
INNER JOIN
  `permutive-bigquery-staging.l2_challenge.locations`
ON
  `permutive-bigquery-staging.l2_challenge.pageviews`.location = `permutive-bigquery-staging.l2_challenge.locations`.location_id
WHERE
  domain = 'awesome.com'
  
/* Solution for the above 
	
1	
2020-07-02
Home
United Kingdom
2	
2020-07-02
Edge is the way
United States
3	
2020-07-04
Edge is the way
France
4	
2020-07-05
Edge is the way
United States
5	
2020-07-06
Edge is the way
United States
6	
2020-07-04
Cloud computing - is it the future?
Brazil

*/

4. 

 SELECT
  domain,
  COUNT(*)
FROM
  `permutive-bigquery-staging.l2_challenge.pageviews`
GROUP BY domain


5. 

SELECT
  domain,
  tier,
  COUNT(*)
FROM
  `permutive-bigquery-staging.l2_challenge.pageviews`
INNER JOIN
  `permutive-bigquery-staging.l2_challenge.users`
ON
  `permutive-bigquery-staging.l2_challenge.pageviews`.user_id = `permutive-bigquery-staging.l2_challenge.users`.user_id
GROUP BY
  domain,
  tier
ORDER BY
  domain,
  tier ASC

  /* Solution for the above 
  Row	domain	tier	f0_	
1	
awesome.com
0
2
2	
awesome.com
1
4
3	
awesome.com
2
3
4	
mynews.com
0
4
5	
mynews.com
1
3
6	
mynews.com
2
1

  
  
  */
  