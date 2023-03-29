## ARIMA预测模型

自回归移动平均模型(Autoregressive Integrated Moving Average Model,简记ARIMA)

ARIMA模型含有三个参数：p,d,q

p--代表预测模型中采用的时序数据本身的滞后数(lags) ,也叫做AR/Auto-Regressive项

d--代表时序数据需要进行几阶差分化，才是稳定的，也叫Integrated项。

q--代表预测模型中采用的预测误差的滞后数(lags)，也叫做MA/Moving Average项
