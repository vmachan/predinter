# Generate test data for predinter

library(truncnorm)

# weights <- c(0.125,0.25,0.075,0.015,0.05,0.05,-0.0825,-0.1275,-0.075,0.075,-0.075)
# weights <- c(0.5,0.625,0.125,0.025,0.05,0.05,0.0525,-0.0975,-0.17,0.09,-0.25)
weights <- c(0.25,0.45,0.125,0.01,0.05,0.05,0.02,-0.155,0.15,0.2,-0.15)


# num_years_exp <- c(5,10,15,20,25,30)
num_years_exp <- c(5,15,25)
# prof_level <- c(1:10)
prof_level <- c(1,5,9)
edu_qual_highest <- c(1:4)
sectors <- c(1,3,5)
on_kaggle <- c(0,1)
pub_data_prod <- c(0,1)
num_days_open <- c(20,60,100)
# num_days_open <- c(10,20,30,40,50,60,70.80,90,100)
diff_expected_budget_salary <- c(round(rtruncnorm(3,a=0,b=1),2))
job_type <- c(1,2)
referred <- c(0,1)
relocation <- c(0,1)

# print(prof_level)
rec_ctr = 1

dfrecord <- data.frame(0,0,0,0,0,0,0,0,0,0,0,0)
names(dfrecord) <- c("num_exp_years", "prof_level", "edu_qual_highest", "sectors", "on_kaggle", "pub_data_prod", "num_days_open", "diff_expected_budget_salary", "job_type", "referred", "relocation", "interview_prob")

for (year in num_years_exp)
{
  for (proflevel in prof_level)
  {
    for (edu in edu_qual_highest)
    {
      for (sector in sectors)
      {
        for (kaggle in on_kaggle)
        {
          for (pub in pub_data_prod)
          {
            for (daysopen in num_days_open)
            {
              for (diffsal in diff_expected_budget_salary)
              {
                for (job in job_type)
                {
                  for (ref in referred)
                  {
                    for (rel in relocation)
                    {
                      # print(paste(year, proflevel, edu, sector, kaggle, pub, daysopen, diffsal, job, ref, rel, sep = "|"))
                      inter_prob <- (year/max(num_years_exp)) * weights[1] +
                      (proflevel / max(prof_level)) * weights[2] + 
                      (edu / max (edu_qual_highest)) * weights[3] + 
                      (sector / max(sectors)) * weights[4] +
                      kaggle * weights[5] +
                      pub * weights[6] + 
                      (daysopen / max(num_days_open)) * weights[7] + 
                      diffsal * weights[8] + 
                      job * weights[9] + 
                      ref * weights[10] + 
                      rel * weights[11]
                      
                      inter_prob <- round(inter_prob, 4)
                      dfrecord <- rbind(dfrecord, c(year, proflevel, edu, sector, kaggle, pub, daysopen, diffsal, job, ref, rel, inter_prob))

                      print(dfrecord[rec_ctr,])
                      rec_ctr <- rec_ctr + 1
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

write.csv(dfrecord, file="C:/Users/machav1/Documents/Vinu/lakeeda/edu/R/temp/gen_train_data.csv")


