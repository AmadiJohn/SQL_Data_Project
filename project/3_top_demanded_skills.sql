/*
Question; What are the most in-demanding skills for data analyst?
- Join job postings to inner join  table similar to the second query
- identify the top 10 in-demand skills for a Data Analyst.
- Focus on all job postings.
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_skills
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_skills DESC
LIMIT 10
