Predict a candidate's chances of getting to an interview
========================================================
author: Vinayak D. Machan
date: December 15th 2014
font-family: 'Arial'

What is the concept?
========================================================

**The purpose of this predictive tool is to help job-seekers and recruiters in the area of assessing a candidate's chances to land an interview for any particular position-candidate pair.**

A lot of time and effort (also spam emails) are wasted by candidates in applying for jobs which they might not even have a fair chance at. Recruiters also send out a lot of automated email enquiries to job-seekers without actually giving much thought to assessing the candidate's potential.

The tool uses a few variables that are then used to predict the probability (chance) of a candidate getting to an interview for a position. 

Variables used in prediction model
========================================================

1. Candidate work experience (in years)
2. Candidate's level of proficiency
3. Highest education qualification
4. Sector/domain that the position is in.
5. Participation in Kaggle
6. Published papers or data products
7. Number of days the job has been unfilled
8. Difference between expected salary and budgeted salary
9. Contract vs. Full-time position
10. Employee referral?
11. Relocation required?


Prediction Model 
========================================================
A simple linear regression model was created using the training data set.

The training data set was created manually for this exercise and does not include not actual real-world observed values. This was then evaluated against test data that was also manually created based on some real examples. 

The appendix shows the summary of the model.

Assumptions and Limitations
========================================================
*Assumptions*

1. There are a lot of variables that can be considered for predicting the chances of a candidate getting a job interview. For the purpose of this tool, we have assumed that the variables listed in slide 2. are the ones that matter most.
2. The training data created for this tool mirrors real-world scenarios. This can be improved by including real-world observations to train the model.

*Limitations*

1. The data (both train and test) used for this prediction model has been created manually and does not include real-world observed values. Given this, the model has some deficiencies and would be greatly improved if real-world observations are made available to train it.

Appendix
========================================================
*Linear Model used*<small style="font-size: .5em;">

```

Call:
lm(formula = interview_prob ~ ., data = trainds)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.158644 -0.006680  0.003118  0.012754  0.037463 

Coefficients: (1 not defined because of singularities)
                              Estimate Std. Error t value Pr(>|t|)    
(Intercept)                  9.196e-01  5.996e-02  15.338  < 2e-16 ***
num_exp_years               -9.648e-05  2.865e-04  -0.337  0.73667    
prof_level                   5.007e-03  8.497e-03   0.589  0.55638    
edu_qual_highest             1.137e-02  5.144e-03   2.211  0.02822 *  
sectors                             NA         NA      NA       NA    
on_kaggle                   -2.220e-02  4.931e-03  -4.502 1.17e-05 ***
pub_data_prod                8.717e-03  7.295e-03   1.195  0.23360    
num_days_open                5.371e-04  2.466e-04   2.178  0.03062 *  
diff_expected_budget_salary -8.850e-01  2.113e-02 -41.878  < 2e-16 ***
job_type                    -1.199e-02  3.658e-03  -3.278  0.00124 ** 
referred                     1.587e-02  5.129e-03   3.094  0.00227 ** 
relocation                  -5.519e-03  5.083e-03  -1.086  0.27901    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.02436 on 189 degrees of freedom
Multiple R-squared:  0.9732,	Adjusted R-squared:  0.9718 
F-statistic: 686.9 on 10 and 189 DF,  p-value: < 2.2e-16
```
</small>
