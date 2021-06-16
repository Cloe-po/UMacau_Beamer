#### 2.3 Histogram直方图 ####

#### 2.3.1 GGPLOT2 ####
  #由于 geom_histogram() 函数，可以使用 ggplot2 构建直方图。 它只需要 1 个数字变量作为输入。 此函数自动将变量切入 bin 并计算每个 bin 的数据点数。请记住使用 binwidth 参数尝试不同的 bin 大小。

#### 2.3.2 Basic histogram with ggplot2 ####
  #直方图是数字变量分布的表示。 本文档解释了如何使用 R 和 ggplot2 包构建它。 您可以在直方图部分找到更多示例。

#### 2.3.3 Basic Histogram with geom_histogram ####
  #It is relatively straightforward to build a histogram with ggplot2 thanks to the geom_histogram() function. Only one numeric variable is needed in the input. Note that a warning message is triggered with this code: we need to take care of the bin width as explained in the next section.由于 geom_histogram() 函数，使用 ggplot2 构建直方图相对简单。 输入中只需要一个数字变量。 请注意，此代码会触发一条警告消息：我们需要按照下一节中的说明处理 bin 宽度。

# library
library(ggplot2)

# dataset:
data=data.frame(value=rnorm(100))

# basic histogram
p <- ggplot(data, aes(x=value)) + 
  geom_histogram()

p

#### 2.3.4 Control Bin Size with binwidth ####
  #A histogram takes as input a numeric variable and cuts it into several bins. Playing with the bin size is a very important step, since its value can have a big impact on the histogram appearance and thus on the message you’re trying to convey. This concept is explained in depth in data-to-viz.Ggplot2 makes it a breeze to change the bin size thanks to the binwidth argument of the geom_histogram function. See below the impact it can have on the output.直方图将一个数字变量作为输入并将其分成几个箱。 调整 bin 大小是一个非常重要的步骤，因为它的值会对直方图的外观产生很大的影响，从而对你试图传达的信息产生很大的影响。 这个概念在 data-to-viz 中有深入解释。 由于 geom_histogram 函数的 binwidth 参数，Ggplot2 使更改 bin 大小变得轻而易举。 请参阅下面它对输出的影响。

# Libraries
library(tidyverse)
library(hrbrthemes)
library(rio)

# Load dataset from github
data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/1_OneNum.csv", header=TRUE)

# plot
p <- data %>%
  filter( price<300 ) %>%
  ggplot( aes(x=price)) +
  geom_histogram( binwidth=3, fill="#69b3a2", color="#e9ecef", alpha=0.9) +#binwith = 3
  ggtitle("Bin size = 3") + 
  theme_ipsum() +
  theme(
    plot.title = element_text(size=15) #element_text(size=15) 是指这个bin size的大小
  )
p

#### 2.3.5 Histogram with Several Groups - ggplot2 ####
  #直方图显示数值变量的分布。 一个常见的任务是通过几个组比较这个分布。 本文档解释了如何使用 R 和 ggplot2 执行此操作。

#### 2.3.5.1 Several Histograms on the Same Axis #### 
  #如果您拥有的组或变量的数量相对较少，您可以将它们全部显示在同一轴上，使用一点透明度以确保不会隐藏任何数据。注意：有2组，你也可以建立镜像直方图

# library
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# Build dataset with different distributions
data <- data.frame(
  type = c( rep("variable 1", 1000), rep("variable 2", 1000) ),
  value = c( rnorm(1000), rnorm(1000, mean=4) )
)

# Represent it
p <- data %>%
  ggplot( aes(x=value, fill=type)) + #fill=type就分组了
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') + #position = 'identity'改变了这个图是遮盖还是累积的
  scale_fill_manual(values=c("#69b3a2", "#404080")) +
  theme_ipsum() +
  labs(fill="")
p

#### 2.3.6 Using Small Multiple ####
  #如果您需要表示的组数较多，则将它们绘制在同一轴上通常会导致图形杂乱且难以阅读。一个好的解决方法是使用小倍数，其中每个组都在绘图窗口的一小部分中表示，使图形易于阅读。 由于 ggplot2 的 facet_wrap() 函数，这很容易构建。注意：在此处阅读有关此示例中使用的数据集的更多信息。
# Libraries
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(forcats)

# Load dataset from github
data <- read.table("https://raw.githubusercontent.com/zonination/perceptions/master/probly.csv", header=TRUE, sep=",")
data <- data %>%
  gather(key="text", value="value") %>%
  mutate(text = gsub("\\.", " ",text)) %>%
  mutate(value = round(as.numeric(value),0))

# plot
?fct_reorder #Reorder factor levels by sorting along another variable
?scale_fill_viridis
p <- data %>%
  mutate(text = fct_reorder(text, value)) %>%
  ggplot( aes(x=value, color=text, fill=text)) +
  geom_histogram(alpha=0.6, binwidth = 5) +
  scale_fill_viridis(discrete=TRUE) +
  scale_color_viridis(discrete=TRUE) +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  ) +
  xlab("") +
  ylab("Assigned Probability (%)") +
  facet_wrap(~text) #facet_wrap(~text) 分组展示利器
p
?facet_wrap

#### 2.3.7 Base R ####
  #Of course it is possible to build high quality histograms without ggplot2 or the tidyverse. Here are a few examples illustrating how to proceed.当然，可以在没有 ggplot2 或 tidyverse 的情况下构建高质量的直方图。 以下是一些说明如何进行的示例。

#### 2.3.8 Two Histograms with Melt Colors ####
  #A histogram displays the distribution of a numeric variable. This sections explains how to plot 2 histograms on the same axis in Basic R, without any package.Histograms are commonly used in data analysis to observe distribution of variables. A common task in data visualization is to compare the distribution of 2 variables simultaneously.Here is a tip to plot 2 histograms together (using the add function) with transparency (using the rgb function) to keep information when shapes overlap.直方图显示数值变量的分布。 本节介绍如何在基本 R 中在同一轴上绘制 2 个直方图，无需任何包。直方图常用于数据分析以观察变量的分布。 数据可视化中的一个常见任务是同时比较 2 个变量的分布。这是将 2 个直方图绘制在一起（使用 add 函数）和透明度（使用 rgb 函数）以在形状重叠时保留信息的提示。

#Create data
set.seed(1)
?set.seed #用于设定随机数种子，一个特定的种子可以产生一个特定的伪随机序列， 这个函数的主要目的，是让你的模拟能够可重复出现。
Ixos=rnorm(4000 , 120 , 30)     
Primadur=rnorm(4000 , 200 , 30) 

# First distribution
hist(Ixos, breaks=30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab="height", 
     ylab="nbr of plants", main="distribution of height of 2 durum wheat varieties" ) #breaks =30是指把x轴均等分为30份

# Second with add=T to plot on top
hist(Primadur, breaks=30, xlim=c(0,300), col=rgb(0,0,1,0.5), add=T)

# Add legend
legend("topright", legend=c("Ixos","Primadur"), col=c(rgb(1,0,0,0.5), 
                                                      rgb(0,0,1,0.5)), pt.cex=2, pch=15 ) #pch=15是指图例里面那个方块的形状，pt.cex是指他们的大小

#another example
par(
  mfrow=c(1,2), #表面要画两个图，把画布分为两块
  mar=c(4,4,1,0) #长度为 4 的数字向量，按以下顺序设置边距大小：底部、左侧、顶部和右侧
)

hist(Ixos, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="height" , ylab="nbr of plants" , main="" )
hist(Primadur, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="height" , ylab="" , main="")


#### 2.3.9 Boxplot on top of Histogram ####
  #This example illustrates how to split the plotting window in base R thanks to the layout function. Contrary to the par(mfrow=...) solution, layout() allows greater control of panel parts.Here a boxplot is added on top of the histogram, allowing to quickly observe summary statistics of the distribution.这个例子说明了如何利用 layout 函数在 base R 中拆分绘图窗口。 与 par(mfrow=...) 解决方案相反， layout() 允许更好地控制面板部件。这里在直方图的顶部添加了一个箱线图，允许快速观察分布的汇总统计。

# Create data 
my_variable=c(rnorm(1000 , 0 , 2) , rnorm(1000 , 9 , 2))

# Layout to split the screen
layout(mat = matrix(c(1,2),2,1, byrow=TRUE),  height = c(1,8))

matrix(c(1,2),2,1, byrow=TRUE)

# Draw the boxplot and the histogram 
par(mar=c(0, 3.1, 1.1, 2.1))
boxplot(my_variable , horizontal=TRUE , ylim=c(-10,20), xaxt="n" , col=rgb(0.8,0.8,0,0.5) , frame=F) #frame=F 意思是去掉外面的边框
par(mar=c(4, 3.1, 1.1, 2.1))
hist(my_variable , breaks=40 , col=rgb(0.2,0.8,0.5,0.5) , border=F , main="" , xlab="value of the variable", xlim=c(-10,20))

#### 2.3.10 Histogram with Colored Tail ####
  #此示例演示如何为直方图的各个部分着色。 首先，必须调用 hist 函数下的 plot=F 而不使用选项绘制结果。 它允许将每个 bin 的位置存储在一个对象中（此处为 my_hist）。这些 bin 边界现在在对象的 $breaks 槽中可用，允许使用 ifelse 语句构建颜色向量。 最后，此颜色向量可用于绘图调用。

# Create data
my_variable=rnorm(2000, 0 , 10)

# Calculate histogram, but do not draw it
my_hist=hist(my_variable , breaks=40  , plot=F)
plot(my_hist)
# Color vector
my_color= ifelse(my_hist$breaks < -10, rgb(0.2,0.8,0.5,0.5) , ifelse (my_hist$breaks >=10, "purple", rgb(0.2,0.2,0.2,0.2) ))

# Final plot
plot(my_hist, col=my_color , border=F , main="" , xlab="value of the variable", xlim=c(-40,40) )

#### 2.3.11 Mirrored Histogram in Base R ####
  #镜像直方图允许比较 2 个变量的分布。首先使用 par(mfrow()) 命令拆分屏幕。 顶部直方图需要一个 xaxt="n" 语句来丢弃它的 X 轴。 对于第二个，反转 ylim 参数的值以将其倒置。 使用 margin 命令调整 2 个图表的位置。

#Create Data
x1 = rnorm(100)
x2 = rnorm(100)+rep(2,100)
par(mfrow=c(2,1)) #实现一页2图的功 两行一列

#Make the plot
par(mar=c(0,5,3,3)) #设置边距，底部、左侧、顶部和右侧
hist(x1 , main="" , xlim=c(-2,5), ylab="Frequency for x1", xlab="", ylim=c(0,25) , xaxt="n", las=1 , col="slateblue1", breaks=10)
par(mar=c(0,5,0,3))
hist(x2 , main="" , xlim=c(-2,5), ylab="Frequency for x2", xlab="Value of my variable", ylim=c(25,0) , las=1 , col="tomato3"  , breaks=10)

#### 2.3.12 Histogram without Border ####
  #This sections explains how to get rid of histograms border in Basic R. It is purely about appearance preferences. Basically, you just need to add border=F to the hist function to remove the border of histogram bars.本节解释了如何在 Basic R 中去除直方图边框。这纯粹是关于外观偏好。 基本上，您只需要在 hist 函数中添加 border=F 即可移除直方图条的边框。

# Create data 
my_variable=c(rnorm(1000 , 0 , 2) , rnorm(1000 , 9 , 2))

# Draw the histogram with border=F
hist(my_variable , breaks=40 , col=rgb(0.2,0.8,0.5,0.5) , border=T , main="") #change border = T/F

