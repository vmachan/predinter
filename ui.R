library(shiny)

# Define UI for application that draws a histogram
shinyUI
(
  fluidPage
	(
	tags$head(
	    tags$link(rel = "stylesheet", type = "text/css", href = "vm_shinyapp_01_styles.css")
			  )
	,
	h1("Predict a candidate's chances of getting asked to an interview")
	,
	tabsetPanel
  (
	id="tabs"
	,
	type="tabs"
	,
	tabPanel
	(
	  "Read this first"
		,
    "This is a tool to help one gauge the probability of being asked to an interview."
		,
		fluidRow
		(
		column
		(
		9
		,
		div
		(
		  HTML
			(
			  "<br/>"
			  ,"<ol>"
				,"<li><b>Audience: </b>The primary audience for this tool in it's current state is the Coursera faculty and students only. When the model is trained with real-world data it is then ready for use by job seekers and recruiters. </li>"
				,"<li><b>Data: </b>This first version's use is primarily based on test data that was hand-typed for the purpose of demonstrating the concept. No public or private (paid) body of data has been used to develop the prediction model. The training data set size is much smaller than what is used in a real-world 'production' setting. Having said that, the concept is still a powerful one and will generate a more accurate prediction model if trained with data collected from real-life experiences.</li>"
				,"<li><b>Assumptions: </b>The existing variables collected are all that affect the predicted probability. Thie assumption has been made to narrow down the scope so that we can deliver a data product for assessment.</li>"
				,"<li><b>Disclaimer: </b>This data product is delivered as-is. It should be used purely from a standpoint of learning how to share and present predictive applications using Shiny.</li>"
				,"</ol>"
				,"<h4><u>Instructions: </u></h4>"
        ,"<ol>"
        ,"<li>The application comes up with some default selected values and the associated prediction value. </li>"
        ,"<li>You can change the input variables using the slider and other widgets provided and</li>"
        ,"<li>Then click the blue button to get the new predicted probability of getting an interview.</li>"
				,"</ol>"
			)
	  )
	  ) # End of column
	  ) # End of fluidRow
	)
	,
	tabPanel
  (
		"Use the tool"
		,
    fluidRow
    (
      column
      (
         3
         ,
         sliderInput
         (
          "num_exp_years",
          "1. How many years of relevant experience does the candidate have?",
          min = 5,
          max = 30,
          value = 5
         )
         ,
         br()
         ,
         sliderInput
         (
           "prof_level",
           "2. Rate candidate's level of proficiency:",
           min = 1,
           max = 10,
           value = 5
         )
         ,
         br()
         ,
         radioButtons
         (
           "edu_qual_highest",
           "3. what is the highest educational qualification of the candidate?",
           c(
             "Bachelors Degree" = 1
             ,"Masters Degree (Science)" = 2
             ,"Masters Degree (Business)" = 3
             ,"Doctorate (Ph.D)" = 4
             ,"None of the above" = 0
           )
           ,
           selected = 0
         )
         ,
         br()
         ,
         selectInput
         (
           "sectors",
           "4. what sector is this position in?",
           c(
               "Insurance" = 1
              ,"Financial Services" = 2
              ,"Telecommunications" = 3
              ,"Entertainment" = 4
              ,"Pharmaceuticals" = 5
            )
         )
         ,
				 br()
         ,
				 radioButtons
				 (
           "on_kaggle",
           "5. Has candidate participated in any Kaggle competitions?",
           c(
              "Yes" = 1
              ,"No" = 0
            )
				   ,
           selected = 0
         )
         # ,
				 # conditionalPanel
				 # (
				 #    condition = "input.on_kaggle == 1"
				 #    ,textInput("kaggle_link", "Kaggle competition link: ", "")  
				 #    ,helpText("Please provide link to your Kaggle submission")
				 # )
      )
      ,
			column
      (
        3
        ,
         radioButtons
         (
           "pub_data_prod",
           "6. Has candidate published any data products or papers?",
           c(
              "Yes (on GitHub)" = 1
              ,"Yes (on LinkedIn)" = 1
              ,"Yes (Other)" = 1
              ,"No" = 0
            )
           ,
           selected = 0
         )
         # ,
         # conditionalPanel
         # (
         #   condition = "input.tabs == 'main' & input.pub_data_prod != 0"
         #   ,textInput
         #  (
         #     "dataprod_published_link"
         #     ,"Published material: "
         #     ,"Please provide link here"
         #  )  
         # )
        ,
				br()
        ,
				sliderInput
				(
				  "num_days_open",
          "7. How many days has the position been open (Choose 1 if unknown)?",
          min = 1,
          max = 100,
          value = 1
        )
        ,
				br()
        ,
				sliderInput
				(
				  "diff_expected_budget_salary",
          "8. What is the difference (in %) between budgeted and expected base salaries?",
          min = 1,
          max = 100,
          value = 1
        )
        ,
				# br()
        # ,
				# sliderInput
				# (
				  # "diff_curr_expected_salary",
          # "9. What is the difference (in %) between current and expected base salaries?",
          # min = 1,
          # max = 100,
          # value = 1
        # )
        # ,
				br()
        ,
				radioButtons
				(
				  "job_type",
          "9. Is this a contract or full-time position?",
          c(
             "Contract" = 1
             ,"Full-time" = 2
           ),
          selected = 2
        )
      )
      ,
      column
			(
        3
        ,
				radioButtons
				(
				  "referred",
          "10. Has candidate been referred by an employee?",
          c(
             "Yes" = 1
             ,"No" = 0
           )
				  ,
          selected = 0
        )
        ,
				br()
        ,
				# radioButtons
				# (
				#   "regions",
				#   "12. What geographical region is the job located at?",
				#   c(
				#       "North America" = 1
				#      ,"Canada" = 2
				#      ,"China" = 3
				#      ,"Europe" = 4
				#      ,"Germany" = 5
				#      ,"India" = 6
				#      ,"Japan" = 7
				#      ,"Mexico" = 8
				#      ,"United Kingdom" = 9
				#    ),
				#   selected = 1
				# )
				# ,
				br()
        ,
				radioButtons
				(
				  "relocation",
          "11. Is relocation required?",
          c(
             "Yes" = 1
             ,"No" = 0
           ),
          selected = 0
        )
				# ,
				# conditionalPanel
				# (
				#   condition = "input.relocation == 1"
				#   ,
				# 	radioButtons
				# 	(
				#     "willing_to_relocate"
				#     ,"13.a. Is candidate willing to relocate?"
				#     ,c(
				#       "Yes" = 1
				#       ,"No" = 0
				#       )
				#     ,selected = 0
				#   )  
				# )
				# ,
				# conditionalPanel
				# (
				#   condition = "input.willing_to_relocate == 1"
				#   ,
				# 	radioButtons
				# 	(
				#     "relocation_expense"
				#     ,"13.b. Will candidate need relocation assistance?"
				#     ,c(
				#       "Yes" = 1
				#       ,"No" = 0
				#       )
				#     ,selected = 0
				#   )  
				# )
      )
      ,
      column
			(
        2
        ,submitButton("Get prediction!")
        ,br()
        ,p("The chances of this candidate getting an interview in percentages is ")
        ,h4(textOutput("interview_prob"))
        # ,p("Debug Info - ")
        # ,verbatimTextOutput("debugtext")
			)
    ) # End of fluidRow
  ) # End of tabPanel - Main
	,
	tabPanel
	(
	  "Help"
		,
    "This is a tool to help one gauge the probability of being asked to an interview given the following variables or parameters:"
		,
		fluidRow
		(
		column
		(
		9
		,
		div
		(
		  HTML
			(
			  "<br/>"
			  ,"<ol>"
				,"<li><b>Years of experience:</b> Include working experience only. Internships and summer/part-time roles should be excluded.</li>"
				,"<li><b>Your own assessment of proficiency level:</b> Be truthful. Whether the tool is used by the candidate or recruiter, this is one input that is based on a human's perception and tries to quantify something subjective.</li>"
				,"<li><b>Educational qualifications:</b> Paired with geographical region, this seems to make a noticeable impact on the perception of candidate strength.</li>"
				,"<li><b>Sector:</b> Different sectors have different dynamics when it comes to recruiting and overall criteria for hiring. This helps the tool use some of the underlying associations and/or biases due to sector.</li>"
				,"<li><b>Community participation (Kaggle):</b> More applicable for fields such as data science where the participation in such contests is perceived valuable.</li>"
				,"<li><b>Published content:</b> More relevant for senior level roles where more experience matters. Also applicable to more recent technology skills such in data science where collaboration via sites such as GitHub is valued.</li>"
				,"<li><b>Number of days the position is open:</b> This tells us how long the employer has been looking for a candidate. Gives some measure of how hard or easy it is to fill the position.</li>"
				,"<li><b>Difference between your expected salary and what has been budgeted by the employer:</b> The larger this difference the lesser the opportunity of an interview.</li>"
				,"<li><b>Whether the position is a contract or full-time:</b> A contract position generally tends to appear more lucrative but a candidate needs to take into account expenses such as health insurance and other benefits such as 401K which he or she would be responsible for if on a contract.</li>"
				,"<li><b>If a candidate is referred by a current employee:</b> There seems to be a good chance of at least getting an interview.</li>"
				,"<li><b>Candidates requiring relocation are usually less preferred:</b> This when combined with the number of days the position is open and the salary offered changes prediction value.</li>"
				,"</ol>"
			)
	  )
	  ) # End of column
	  ) # End of fluidRow
	)
  ) # End of tabsetPanel
  # ) # End of navbarPage
  ) # End of fluidPage
) # End of shinyUI
