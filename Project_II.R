#https://www.statbureau.org/

#table will have no dataset-seaonality is present 
#contant mean & prescence of negitive values - stable amplitude
mydata = scan()

plot.ts(mydata)

#german inflation
germaninla = ts(mydata, start = 2008, frequency = 12)

plot(germaninla)

#seasonl decomposition
decompose(germaninla)
#1st is the orginal 
#2nd is the trend - no clear trend 
#3rd is the sesonal 
#4th is white noise
plot(decompose(germaninla))
#stl means - Seasonal and Trend Decomposition with Loses
#data = time series
#s.window - tells are how many seasonal cycles to go through to use its bases off of
#s.window - must at least be a seven and an odd number
plot(stl(germaninla, s.window = 7))

#stl forecasting
library(forecast)
plot(stlf(germaninla, method = "ets"))

#comparison with a standard ets forecast
plot(forecast(ets(germaninla),h = 24))

#using autoplot
library(ggplot2)
autoplot(stlf(germaninla, method = "ets"))

##########################################################################################

#seasonal arima
auto.arima(germaninla, stepwise = T,
           approximation = F, trace = T)

#getting an object
germaninlaarima = auto.arima(germaninla,
                             stepwise = T,
                             approximation = F,
                             trace = T)

#forecast
forec = forecast(germaninlaarima)
plot(forec)

##########################################################################################

