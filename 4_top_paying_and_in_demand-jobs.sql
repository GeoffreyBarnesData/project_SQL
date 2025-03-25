SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
    ORDER BY
    avg_salary DESC
LIMIT 25

/*
PySpark leads the list with the highest average salary (~$208K), likely due to 
its importance in big data processing and Apache Spark applications.

Bitbucket follows (~$189K), reflecting the increasing demand for DevOps and CI/CD 
expertise.


DataRobot ($155K), Jupyter ($152K), Pandas ($151K), and Scikit-learn ($125K) 
indicate strong compensation for AI/ML-focused tools.

These tools are widely used in machine learning, automation, and data analytics, 
which are in high demand.


Couchbase ($160K), Elasticsearch ($145K), Databricks ($141K), and GCP ($122K) show that 
cloud computing and data storage skills remain lucrative.
*/