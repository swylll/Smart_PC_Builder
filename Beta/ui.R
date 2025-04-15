ui=dashboardPage(
  title = '打造专属于你的个人电脑',
  dashboardHeader(title = 'Smart PC Builder'),
  dashboardSidebar(
    titlePanel('告诉我，你想用你的电脑做什么?'),
    checkboxGroupInput(inputId = 'demands1',label = '休闲娱乐',choiceNames = Demands_1,choiceValues = Real_Demands_1),
    checkboxGroupInput(inputId = 'demands2',label = '办公学习',choiceNames = Demands_2,choiceValues = Real_Demands_2),
    checkboxGroupInput(inputId = 'demands3',label = '创意设计',choiceNames = Demands_3,choiceValues = Real_Demands_3),
    numericInput(inputId = 'budget',label = '预算',value = 0),
    actionButton(inputId = 'submit',label = '提交')
    ),
  dashboardBody(titlePanel(textOutput('title')),dataTableOutput('result'),textOutput('version'),textOutput('note'))
)
