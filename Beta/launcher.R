# R Studio Required
library(shiny)
library(shinydashboard)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
runApp()
