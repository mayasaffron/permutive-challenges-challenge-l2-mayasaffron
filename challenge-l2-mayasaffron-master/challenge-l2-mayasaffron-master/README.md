# Technical Challenge

This exercise is used to help us evaluate L2 Technical Operations Analyst looking to join Permutive. We hope a take-home exercise offers you a fairer shot at demonstrating your ability: you'll be more relaxed than in an interview situation, and you'll be able to look-up things online - something we all do when working in the real world!

### Completing the tasks

Please create a pull-request into the `master` branch with your solution. For your solution you'll need to update:

- `solution-comms.md`
- `solution-site.md`
- `solution.sql`
- and any other files (.html,.css) you've found problems in.

In your pull request, please add notes including a brief explanation of your solution describing the decisions you've made, along with any assumptions. We like to give people a week, but if you feel you're finished before that please let us know!

> We don't expect people to know the answers to all of these questions. We fully expect you to use Google, Stackoverflow and all of the tools you normally would to solve problems like these. There are also _very_ few right and wrong answers. Not knowing those answers doesn't make you bad at your job, in fact, not knowing the answer and then asking for help is one of the most positive signs for an engineer we know of 💖

## Tasks

#### 1. Communication Asessment 

The prompt below is intended to be vague. Be creative, make assumptions, show off your problem-solving and communication skills. Please add your answers to `solution-comms.md`.

Helpful Resources:
* Get Started (https://support.permutive.com/hc/en-us/categories/360002162660-Getting-Started)
* Permutive Support Homepage (https://support.permutive.com/hc/en-us)
* Cohorts Explained (https://support.permutive.com/hc/en-us/articles/360010070380-Cohorts-Explained)
* Live Audience Size definition (https://support.permutive.com/hc/en-us/articles/360015059259-Predicted-vs-Live-Audiences#predicted-vs-live-audiences-0-0)

> You receive a ticket from a client saying that the Live Audience Size of a cohort is smaller than expected. They provide the cohort ID in the email. 

 
1. What actions do you take? What types of resources would you leverage?  Please outline your investigative steps including any internal and client-facing communication.


2. You think you found the root cause, but you will have to escalate to the engineering team for resolution. Draft a communication to the engineering team for your escalation. Please include the types of information from your investigation you would send to the engineering team.


3. The engineering team has begun working on a fix. Engineering has not given you an expected completion date on the fix. The client has asked for an update by the end of the business day. What do you do?  What do you communicate back to the client?


#### 2. Debug the website and Permutive SDK

Clone this repo and run the demo site locally. Please launch the website so it is run on the localhost (and not as a file:// in the browser) using your chosen method (tell us about it). Go to the main page and start checking it for bugs.

Please try to find as many problems as you can. They could range from HTML to CSS to accessibility, etc. If you know how to fix any of them please commit the changes and make a pull request using a GitHub workflow as if you worked on a real project. You are welcome to comment the code, but please also provide more information in `solution-site.md`. We care more to know how you went about diagnosing them (what tools, websites, methods you used) than the quality of the actual solution. We don't expect you to change the design style of the page - it's simple (and not very pretty) on purpose, other than to improve its accessibility and responsiveness. Tell us please how did you assess it?

We would then like you to find the problem with the Permutive SDK. Use this document to help guide you (https://permutive.notion.site/L2-Tech-Challenge-Web-Deployment-Verification-5c8b1dd069b54ed48774c4ad6525f039). As above, please fix the issues you can find. If you find an issue you cannot fix, please still highlight the issue and explain how you might fix it.


**Permutive Project ID** - fff0dd2e-b592-46ad-bf99-c9bd1a6cad0f
**Public API Key** - ab4cf25f-09d9-4efe-b1c2-e1fa36c58f95	

#### 3. SQL problems

You were given access to the test database in BigQuery. Please go to the online Google Cloud Platform BigQuery Console usingusing this link (https://console.cloud.google.com/bigquery?project=l2-challenge) and try to execute the following query:

```
SELECT * FROM `permutive-bigquery-staging.l2_challenge.pageviews` LIMIT 1000
```

If you don't get the results, please get in touch with the error you see before proceeding - we'll make sure you have a correct setup.

To complete these task you can ignore any BigQuery dialectic peculiarities - a standard SQL will suffice.

We have three tables that help our publisher to keep track of the pageviews their users generate.

The main table is `pageviews` and it refers to `users` table using the foreign key `user_id`. Each event has a user assigned.
We also try to establish the location (country) of the pageview, but it is not always possible so `location` (the foreign key to `locations` table) can be null.

**users** table

```
user_id	tier
u001	2
u002	0
u003	1
u004	0
u005	0
u006	1
```

**locations** table

```
location_id	country
l001	United Kingdom
l002	United States
l003	Poland
l004	Romania
l005	France
l006	Brazil
l007	Germany
```

**pageviews** table

```
event_id user_id domain	  location	date	title
e00001	u001	awesome.com	l001	2020-07-02	Home
e00002	u002	awesome.com	    	2020-07-02	Cloud computing - is it the future?
e00003	u005	awesome.com	l002	2020-07-02	Edge is the way
e00004	u004	mynews.com	l006	2020-07-03	Home
e00005	u002	mynews.com	l005	2020-07-03	Nothing bad to report
e00006	u001	awesome.com	    	2020-07-04	Home
e00007	u004	mynews.com	    	2020-07-04	Perfect weather on the way!
e00008	u006	mynews.com	l005	2020-07-04	Nothing bad to report
e00009	u006	awesome.com	l006	2020-07-04	Cloud computing - is it the future?
e00010	u003	awesome.com	l005	2020-07-04	Edge is the way
e00011	u001	mynews.com	l004	2020-07-05	Nothing bad to report
e00012	u005	mynews.com	l001	2020-07-05	Perfect weather on the way!
e00013	u003	awesome.com	    	2020-07-05	Home
e00014	u003	mynews.com	l006	2020-07-05	Home
e00015	u006	awesome.com	l002	2020-07-05	Edge is the way
e00016	u003	mynews.com	    	2020-07-06	Perfect weather on the way!
e00017	u001	awesome.com	l002	2020-07-06	Edge is the way
....

```

The publisher is asking you to create a set of reports. How would you go about creating them in SQL?

Please submit your SQL in the `solution.sql` file. Use comments to describe your solution.

### Reports

1. List of unique titles in `pageviews` from `mynews.com` domain.

```
Nothing bad to report
Home
...
```

2. List of all pageviews (all columns) where user_id is replaced with `Anonymous` if the user tier is 0, `Free` if 1, `Premium` if 2.

```
e00001	Premium	  awesome.com	 l001	2020-07-02  Home
e00002	Anonymous awesome.com	        2020-07-02	Cloud computing - is it the future?
...
```

3. List date, title and country (null if no data on location is present) of all pageviews from `awesome.com` domain.

```
2020-07-02	United Kingdom  Home
...
```

4. List of domains and number of pageviews per domain

```
awesome.com     9
mynews.com      8
```

5. Breakdown of domains and tiers (their id is enough) and number of pageviews per domain/tier combination. Sorted first by the domain and than tier (ascending)

```
awesome.com     0    4
awesome.com     1    2
awesome.com     2    1
mynews.com      0    3
mynews.com      1    3
mynews.com      2    2
```
