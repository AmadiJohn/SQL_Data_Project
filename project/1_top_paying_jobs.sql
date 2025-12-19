/*Question: What are the top-paying Data Analyst jobs?
- Identify the top 20 highest-paying Data Analyst roles that are available remotely.
- Focus on the job postings with specified salaries (remove nulls).
- Include company names for top 20 roles
*/



SELECT 
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    job_posted_date,
    salary_year_avg,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20
