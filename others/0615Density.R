##### 2.2 Density ####

  #In ggplot2, the geom_density() function takes care of the kernel density estimation and plot the results.在 ggplot2 中，geom_density() 函数负责核密度估计并绘制结果。

#### 2.2.1 Basic density chart with ggplot2 #### 密度图(Density Plot) 用于显示数据在连续时间段内的分布状况。 这种图表是直方图的变种，使用平滑曲线来绘制数值水平，从而得出更平滑的分布。 密度图的峰值显示数值在该时间段内最为高度集中的位置。

# Libraries
library(ggplot2)
library(dplyr)

# Load dataset from github
data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/1_OneNum.csv", header=TRUE) #一列价格的表格

# Make the histogram
data %>%
  filter( price<300 ) %>% #filter在这里表示 “选择”，意思是只选出price < 300的数据
  ggplot( aes(x=price)) +
  geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8) #alpha透明度，fill填充颜色，color边的颜色（可以去除, color="#e9ecef"看看效果）

#### 2.2.2 Custom with theme_ipsum ####
  #The hrbrthemes package offer a set of pre-built themes for your charts. I am personnaly a big fan of the theme_ipsum: easy to use and makes your chart look more professional（hrbrthemes 包为您的图表提供了一组预先构建的主题。 我个人是 theme_ipsum 的忠实粉丝：易于使用并使您的图表看起来更专业：）:

# Libraries
library(ggplot2)
library(dplyr)
#install.packages("hrbrthemes")
library(hrbrthemes)

# Load dataset from github
data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/1_OneNum.csv", header=TRUE)

# Make the histogram
data %>%
  filter( price<300 ) %>%
  ggplot( aes(x=price)) +
  geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8) +
  ggtitle("Night price distribution of Airbnb appartements") +
  theme_ipsum() #theme_ipsum()就是我们加载的那个hrbrthemes 这个package里面的主题
?theme_ipsum() #一个精确而原始的 ggplot2 主题，带有固执的默认值并强调排版

#### 2.2.3 Mirror Density Chart(镜面密度图) with ggplot2 ####
  #A density plot is a representation of the distribution of a numeric variable. Comparing the distribution of 2 variables is a common challenge that can be tackled with the mirror density chart: 2 density charts are put face to face what allows to efficiently compare them. Here is how to build it with ggplot2 library.密度图是数字变量分布的表示。 比较 2 个变量的分布是一个常见的挑战，可以使用镜像密度图解决：2 个密度图面对面放置，可以有效地比较它们。 以下是如何使用 ggplot2 库构建它。

#### 2.2.4 Density with geom_density ####
  #由于 ggplot2 的 geom_density geom 构建了密度图（参见基本示例）。 可以通过指定 y = -..density... 来颠倒绘制此密度...建议使用 geom_label 来指示变量名称。
# Libraries
library(ggplot2)
library(hrbrthemes)

# Dummy data
data <- data.frame(
  var1 = rnorm(1000),
  var2 = rnorm(1000, mean=2)
)
?rnorm #The Normal Distribution
# Chart
p <- ggplot(data, aes(x=x) ) +
  # Top
  geom_density( aes(x = var1, y = ..density..), fill="#69b3a2" ) +
  geom_label( aes(x=4.5, y=0.25, label="variable1"), color="#69b3a2") +
  # Bottom
  geom_density( aes(x = var2, y = -..density..), fill= "#404080") +
  geom_label( aes(x=4.5, y=-0.25, label="variable2"), color="#404080") +
  theme_ipsum() +
  xlab("value of x")

p #这个图画得慢

#### 2.2.5 Histogram with geom_histogram #### 
  #Of course it is possible to apply exactly the same technique using geom_histogram instead of geom_density to get a mirror histogram（当然，可以使用 geom_histogram 而不是 geom_density 来应用完全相同的技术来获得镜像直方图）：
# Chart 直方密度图
p <- ggplot(data, aes(x=x) ) +
  geom_histogram( aes(x = var1, y = ..density..), fill="#69b3a2" ) +
  geom_label( aes(x=4.5, y=0.25, label="variable1"), color="#69b3a2") +
  geom_histogram( aes(x = var2, y = -..density..), fill= "#404080") +
  geom_label( aes(x=4.5, y=-0.25, label="variable2"), color="#404080") +
  theme_ipsum() +
  xlab("value of x")

p

#### 2.2.6 Density Chart with Several Groups ####
  #A density plot is a representation of the distribution of a numeric variable. Comparing the distribution of several variables with density charts is possible. Here are a few examples with their ggplot2 implementation 密度图是数字变量分布的表示。 可以用密度图比较几个变量的分布。 以下是一些使用 ggplot2 实现的示例。

#### 2.2.7 Multi density chart ####
  #多密度图是表示多个组的密度图。 它允许比较它们的分布。 这种图表的问题在于它很容易杂乱无章：组相互重叠，图形变得不可读。一个简单的解决方法是使用透明度。 但是，它不会完全解决问题，通常最好考虑本文档中进一步建议的示例。

# Libraries
library(ggplot2)
library(hrbrthemes)
library(dplyr)
library(tidyr)
library(viridis)

# The diamonds dataset is natively available with R.

# Without transparency (left)
p1 <- ggplot(data=diamonds, aes(x=price, group=cut, fill=cut)) + #分组是什么，group和fill就是什么
  geom_density(adjust=1.5) + #adjust在这里的作用是这个背景方格的高，数值越大，方格越大
  theme_ipsum()
p1

# With transparency (right)
p2 <- ggplot(data=diamonds, aes(x=price, group=cut, fill=cut)) +
  geom_density(adjust=1.5, alpha=.4) +
  theme_ipsum()
p2

#Here is an example with another dataset where it works much better. Groups have very distinct distribution, it is easy to spot them even if on the same chart. Note that it is much better to add group name next to their distribution instead of having a legend beside the chart.这是另一个数据集的示例，它的效果要好得多。 组具有非常明显的分布，即使在同一图表上也很容易发现它们。 请注意，最好在其分布旁边添加组名称，而不是在图表旁边添加图例。
# Load dataset from github
data0 <- read.table("https://raw.githubusercontent.com/zonination/perceptions/master/probly.csv", header=TRUE, sep=",")
data <- data0 %>%
  gather(key="text", value="value") %>%
  mutate(text = gsub("\\.", " ",text)) %>% #具体的使用方法为：gsub("目标字符", "替换字符", 对象), 此处意思是对于文本中的.替换为空格，然后输出新的text
  mutate(value = round(as.numeric(value),0))
?gsub #模式匹配和替换

# A dataframe for annotations
annot <- data.frame(
  text = c("Almost No Chance", "About Even", "Probable", "Almost Certainly"),
  x = c(5, 53, 65, 79),
  y = c(0.15, 0.4, 0.06, 0.1)
)

# Plot
data %>%
  filter(text %in% c("Almost No Chance", "About Even", "Probable", "Almost Certainly")) %>%
  ggplot( aes(x=value, color=text, fill=text)) + #color和fill填补的地方都是text，但其实测试一下color这里填写value也没啥变化，分组还是靠fill
  geom_density(alpha=0.6) +
  scale_fill_viridis(discrete=T) +
  scale_color_viridis(discrete=TRUE) +
  geom_text( data=annot, aes(x=x, y=y, label=text, color=text), hjust=0, size=4.5) + #此处label=text就是主动把label放入了图中
  theme_ipsum() +
  theme(
    legend.position="none" #legend.position图例的位置
  ) +
  ylab("") +
  xlab("Assigned Probability (%)")

?scale_fill_viridis #使用 viridis 色标。generate a discrete palette? (default: FALSE - generate continuous palette)
?scale_color_viridis #generate a discrete palette? (default: FALSE - generate continuous palette) 在ggplot中，可是使用scale_color_viridis() 、scale_fill_viridis()，来进行调整色带。

#### 2.2.8 Small Multiple with facet_wrap() ####
  #Using small multiple is often the best option in my opinion. Distribution of each group gets easy to read, and comparing groups is still possible if they share the same X axis boundaries.使用小倍数通常是最好的选择。 每个组的分布很容易阅读，如果它们共享相同的 X 轴边界，仍然可以比较组。
# Using Small multiple
ggplot(data=diamonds, aes(x=price, group=cut, fill=cut)) + #diamonds是R自带的一个包
  geom_density(adjust=1.5) +
  theme_ipsum() +
  facet_wrap(~cut) + # 通过facet_grid()和facet_wrap()函数将分组数据横向或纵向或横纵向排列，这样更有助于图形之间的比较。
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"), #panel.spacing 用于调节图图之间的间距#https://www.jianshu.com/p/a4c021fcf90a
    axis.ticks.x=element_blank() #移除x轴所有的标签
  )

#### 2.2.9 Stacked Density Chart ####
  #Another solution is to stack the groups. This allows to see what group is the most frequent for a given value, but it makes it hard to understand the distribution of a group that is not on the bottom of the chart.另一种解决方案是堆叠组。 这允许查看给定值最常见的组，但很难理解不在图表底部的组的分布。
# Stacked density plot堆积密度图:
p <- ggplot(data=diamonds, aes(x=price, group=cut, fill=cut)) +
  geom_density(adjust=1.5, position="fill") +
  theme_ipsum()
p

#### 2.2.10 Marginal distribution with ggplot2 and ggExtra ####
  #This section explains how to add marginal distributions to the X and Y axis of a ggplot2 scatterplot. It can be done using histogram, boxplot or density plot using the ggExtra library.本节介绍如何向 ggplot2 散点图的 X 和 Y 轴添加边缘分布。可以使用 ggExtra 库使用直方图、箱线图或密度图来完成。

#### 2.2.10.1 Basic use of ggMarginal() ####
  #Here are 3 examples of marginal distribution added on X and Y axis of a scatterplot. The ggExtra library makes it a breeze thanks to the ggMarginal() function. Three main types of distribution are available: histogram, density and boxplot.以下是在散点图的 X 和 Y 轴上添加的边际分布的 3 个示例。 由于 ggMarginal() 函数，ggExtra 库使它变得轻而易举。 可以使用三种主要的分布类型：直方图、密度和箱线图。
# library
library(ggplot2)
#install.packages("ggExtra")
library(ggExtra)

# The mtcars dataset is proposed in R
?mtcars #Motor Trend Car Road Tests, The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).
head(mtcars) #wt:Weight (1000 lbs); mpg: Miles/(US) gallon; cyl:Number of cylinders
# classic plot :
p <- ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, size=cyl)) +
  geom_point() +
  theme(legend.position="none")
p
# with marginal histogram
p1 <- ggMarginal(p, type="histogram")
p1
# marginal density
p2 <- ggMarginal(p, type="density")
p2
# marginal boxplot
p3 <- ggMarginal(p, type="boxplot")
p3

#### 2.2.10.2 More Customization ####
# library
library(ggplot2)
library(ggExtra)
# The mtcars dataset is proposed in R
head(mtcars)
# classic plot :
p <- ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, size=cyl)) +
  geom_point() +
  theme(legend.position="none")
p
# Set relative size of marginal plots (main plot 10x bigger than marginals)
p1 <- ggMarginal(p, type="histogram", size=10) #Change marginal plot size with size.随大小更改边缘绘图大小。
p1
# Custom marginal plots:
p2 <- ggMarginal(p, type="histogram", fill = "slateblue", xparams = list(  bins=10)) #Custom marginal plot appearance with all usual parameters.具有所有常用参数的自定义边缘图外观。
p2
# Show only marginal plot for x axis
p3 <- ggMarginal(p, margins = 'x', color="purple", size=4) #Show only one marginal plot with margins = 'x' or margins = 'y'.仅显示一个边距 = 'x' 或边距 = 'y' 的边际图。
p3


