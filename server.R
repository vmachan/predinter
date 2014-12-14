library(shiny)

# setwd("C:/Users/machav1/Documents/Vinu/lakeeda/edu/R/devdataprod-016/vm_shinyapp_01")

# Load training data
trainds <- read.csv("train_dataset.csv")

# Browse data
head(trainds)

# Linear regression model fit to predict interview_prob
lm_inter_prob <- lm(interview_prob ~ ., data=trainds)

# summary of linear model 
summary(lm_inter_prob)

# Get test data
# testds <- read.csv("test_dataset.csv")

# Browse test data
# head(testds)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  # Predict the interview probability for test data
  
  getdf <- reactive({
    data.frame(
                      num_exp_years = input$num_exp_years
                      , prof_level = input$prof_level
                      , edu_qual_highest = as.integer(input$edu_qual_highest)
                      , sectors = as.integer(input$sectors)
                      , on_kaggle = as.integer(input$on_kaggle)
                      , pub_data_prod = as.integer(input$pub_data_prod)
                      , num_days_open = input$num_days_open
                      , diff_expected_budget_salary = (input$diff_expected_budget_salary / 100)
                      , job_type = as.integer(input$job_type)
                      , referred = as.integer(input$referred)
                      # , regions = as.integer(input$regions)
                      , relocation = as.integer(input$relocation)
              )
  })
  
  output$interview_prob <- renderPrint(getdf())
  
  output$interview_prob <- renderText(paste(round(as.numeric(predict(lm_inter_prob, newdata = getdf()))[1] * 100, 2), "%"))

  # output$debugtext <- renderPrint( paste(
  #  input$num_exp_years
  #  , input$prof_level
  #  , input$edu_qual_highest
  #  , input$sectors
  #  , input$on_kaggle
  #  , input$pub_data_prod
  #  , input$num_days_open
  #  , input$diff_expected_budget_salary
  #  , input$job_type
  #  , input$referred
  #  , input$relocation
  #  , sep = "|"
  # )
  # )      
  # output$debugtext <- renderPrint( inputdf() )
    
})

