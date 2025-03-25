/*
Question: What are the skills that top-paying Data Analyst roles require?
First I will use the top 10 highest-paying Data Analyst roles from the first query.
Next I will add the specific skills that are required for these roles.

This is done so that I can get a view of the highest paying jobs that demand which skills.
This will help me in my job seeking ambitions in finding high paying jobs and picking the 
skills that are most commonly requested for those jobs.
*/

WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY    
    salary_year_avg DESC

/*
From analyzing this data, here are my conclusions:

The most frequently requested skills in the dataset are:
1) SQL (8 times)
2) Python (7 times)
3) Tableau (6 times)
4) R (4 times)
5) Snowflake (3 times)
6) Pandas (3 times)
7) Excel (3 times)
8) Azure (2 times)
9) Bitbucket (2 times)
10) Go (2 times)
*/

