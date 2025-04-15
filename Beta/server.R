server=function(input,output,session){
  observeEvent(input$submit,{
    demand=c(input$demands1,input$demands2,input$demands3)
    budget=input$budget
    if(budget<200) budget=200
    if(length(demand)==0){
      cpudemand=c('CPU_Singletask')
      gpudemand=c('GPU_Render')
      Rank=perf_rank(cpudemand,gpudemand,budget)
    }else{
      demand=unique(unlist(strsplit(demand,' ')))
      cpudemand=subset(demand,substr(demand,1,3)=='CPU')
      if(any(cpudemand=='CPU_Render')){
        cpudemand=subset(cpudemand,cpudemand!='CPU_Multitask')
      }
      gpudemand=subset(demand,substr(demand,1,3)=='GPU')
      if(any(gpudemand=='GPU_Render')){
        gpudemand=subset(gpudemand,gpudemand!='GPU_Compute')
      }
      Rank=perf_rank(cpudemand,gpudemand,budget)
    }
    colnames(Rank)=c('CPU型号','CPU评分','CPU价格','GPU型号','GPU评分','GPU价格','总评分','总价格')
    output$result=renderDataTable({Rank})
    output$title=renderText({'你的最佳选择如下：'})
    output$version=renderText({'Smart PC Builder 1.0.0-beta'})
    output$note=renderText({'仅供测试'})
    updateCheckboxGroupInput(session,inputId = 'demands1',label = '休闲娱乐',choiceNames = Demands_1,choiceValues = Real_Demands_1)
    updateCheckboxGroupInput(session,inputId = 'demands2',label = '办公学习',choiceNames = Demands_2,choiceValues = Real_Demands_2)
    updateCheckboxGroupInput(session,inputId = 'demands3',label = '创意设计',choiceNames = Demands_3,choiceValues = Real_Demands_3)
    updateNumericInput(session,inputId = 'budget',label = '预算',value = 0)
  })
}
