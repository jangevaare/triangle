library(shiny)
library(ggplot2)

plotbinom = function(x, n)
	{
	plotdata = data.frame(x=0:n, y=dbinom(0:n, n, 1/3), pval=0:n >= x)
	ggplot(plotdata, aes(x=x, y=y, fill=factor(pval))) + geom_bar(stat="identity", width=1.0) + labs(x="Number of correct participants under null hypothesis", y="Probability") + guides(fill="none") + scale_fill_manual(values = c("FALSE" = "gray20", "TRUE" = "chartreuse3"))
	}


shinyServer(function(input, output){
output$nullplot = renderPlot({plotbinom(input$x, input$n)})

output$pvalue = renderText({paste("p-value = ", pbinom(input$x-1, input$n, 1/3, FALSE), sep="")})
})