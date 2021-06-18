#### Chapter 3 Correlation ####

#### 3.1 Scatterplot ####散点图
  #A Scatterplot displays the relationship between 2 numeric variables. Each dot represents an observation. Their position on the X (horizontal) and Y (vertical) axis represents the values of the 2 variables.散点图显示 2 个数值变量之间的关系。 每个点代表一个观察。 它们在 X（水平）和 Y（垂直）轴上的位置代表 2 个变量的值。

#### 3.1.0.1 Using the ggplot2 Package ####
  #Scatterplots are built with ggplot2 thanks to the geom_point() function. Discover a basic use case in graph #272, and learn how to custom it with next examples below. Basic scatterplot with R and ggplot2. A scatterplot displays the values of two variables along two axes. It shows the relationship between them, eventually revealing a correlation.A scatterplot displays the values of two variables along two axes. It shows the relationship between them, eventually revealing a correlation.Here the relationship between Sepal width and Sepal length of several plants is shown.It illustrates the basic utilization of ggplot2 for scatterplots:散点图沿两个轴显示两个变量的值。 它显示了它们之间的关系，最终揭示了一种相关性。这里显示了几种植物的萼片宽度和萼片长度之间的关系。
#Provide a dataframe.提供数据框。
#Tell which variable to show on x and y axis.告诉在 x 和 y 轴上显示哪个变量。
#Add a geom_point() to show points.添加 geom_point() 以显示点。

# library
library(ggplot2)

# The iris dataset is provided natively by R
?iris #This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.这个著名的（Fisher's 或 Anderson's）鸢尾花数据集分别给出了来自 3 种鸢尾花中每一种的 50 朵花的萼片长度和宽度以及花瓣长度和宽度的测量值（以厘米为单位）。 物种是 Iris setosa、versicolor 和 virginica。
head(iris)

# basic scatterplot
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point()

#### 3.1.1 Custom ggplot2 Scatterplot ####
  #This post follows the previous basic scatterplot with ggplot2. It shows the kind of customization you can apply to circles thanks to the geom_point() options 这篇文章遵循了之前使用 ggplot2 的基本散点图。 由于 geom_point() 选项，它显示了您可以应用于圆圈的自定义类型:
    #color: the stroke color, the circle outline描边颜色，圆形轮廓
    #stroke: the stroke width fill: color of the circle inner part 笔触宽度 fill：圆圈内部的颜色
    #shape: shape of the marker. See list in the ggplot2 section 标记的形状。 请参阅 ggplot2 部分中的列表
    #alpha: circle transparency, [0->1], 0 is fully transparent color: the  stroke color, the circle outline圆形透明度，[0->1]，0为全透明 color：描边颜色，圆形轮廓
    #size: circle size 圆形尺寸
    #Note: These options will be uniform among markers if you put it in the geom_point() call. You can also map them to a variable if put inside the aes() part of the code.如果你把它放在 geom_point() 调用中，这些选项在标记之间将是统一的。 如果将它们放在代码的 aes() 部分中，您还可以将它们映射到变量。

# library
library(ggplot2)

# Iris dataset is natively provided by R
#head(iris)

# use options! #可以调整底下的参数，来获取更多的insights
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point(
    color="orange",
    fill="#69b3a2",
    shape=56,
    alpha=0.5,
    size=6,
    stroke = 50 #圈圈大小
  )

#### 3.1.2 Using theme_ipsum ####
# library
library(ggplot2)
library(hrbrthemes)

# Iris dataset is natively provided by R
#head(iris)

# use options!
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point(
    color="black",
    fill="#69b3a2",
    shape=22,
    alpha=0.5,
    size=6,
    stroke = 1
  ) +
  theme_ipsum()

#### 3.1.3 Map a Variable to Marker Feature in ggplot2 Scatterplot ####
  #ggplot2 allows to easily map a variable to marker features of a scatterplot. This section explaines how it works through several examples, with explanation and code.ggplot2 允许轻松地将变量映射到散点图的标记特征。 本节通过几个例子来解释它是如何工作的，并附有说明和代码。

#### 3.1.3.1 Basic Example ####
# load ggplot2
library(ggplot2)
library(hrbrthemes)

# mtcars dataset is natively available in R
# head(mtcars)

# A basic scatterplot with color depending on Species
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +  #color=Species其实是按照species分成了色彩不同的组，可以去掉对比
  geom_point(size=6) +
  theme_ipsum()

#### 3.1.4 Works with any Aesthetics ####
  #Map variables to any marker features. For instance, specie is represente below using transparency (left), shape (middle) and size (right).将变量映射到任何标记特征。 例如，下面使用透明度（左）、形状（中）和大小（右）来表示硬币。
# load ggplot2
library(ggplot2)
library(hrbrthemes)

# Transparency
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, alpha=Species)) + #根据不同的species来调整透明度
  geom_point(size=6, color="#69b3a2") +
  theme_ipsum()

# Shape
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, shape=Species)) + #根据species来调整形状
  geom_point(size=6) +
  theme_ipsum()

# Size
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, size=Species)) + 
  geom_point() +
  theme_ipsum()


#### 3.1.5 Mapping to Several Features ####
  #Last but not least, note that you can map one or several variables to one or several features. Here, shape, transparency, size and color all depends on the marker Species value.最后但并非最不重要的一点是，您可以将一个或多个变量映射到一个或多个特征。 此处，形状、透明度、大小和颜色都取决于标记 Species 值。
# load ggplot2
library(ggplot2)
library(hrbrthemes)

# A basic scatterplot with color depending on Species
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, shape=Species, alpha=Species, size=Species, color=Species)) + 
  geom_point() +
  theme_ipsum()

#### 3.1.6 Add Text Labels with ggplot2 ####
  #This document is dedicated to text annotation with ggplot2. It provides several examples with reproducible code showing how to use function like geom_label and geom_text.本文档致力于使用 ggplot2 进行文本注释。 它提供了几个带有可重现代码的示例，展示了如何使用 geom_label 和 geom_text 等函数。

#### 3.1.6.1 Adding Text with geom_text() ####
  #This example demonstrates how to use geom_text() to add text as markers. It works pretty much the same as geom_point(), but add text instead of circles. A few arguments must be provided此示例演示如何使用 geom_text() 添加文本作为标记。 它的工作原理与 geom_point() 几乎相同，但添加文本而不是圆圈。 必须提供一些参数:
    #label: What text you want to display.标签：要显示的文本。
    #nudge_x and nudge_y: Shifts the text along X and Y axis.沿 X 和 Y 轴移动文本。
    #check_overlap: Tries to avoid text overlap. Note that a package called ggrepel extends this concept further.尝试避免文本重叠。 请注意，名为ggrepel 的包进一步扩展了这个概念。

# library
library(ggplot2)

# Keep 30 first rows in the mtcars natively available dataset
?mtcars #The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).
data=head(mtcars, 30) #只保留mtcars这个数据的前30行
rownames(data)
# 1/ add text with geom_text, use nudge to nudge the text
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_text(
    label=rownames(data), 
    nudge_x = 0.25, nudge_y = 0.25, #这个调整比较技术活
    check_overlap = T #nice recommended
  )

#### 3.1.7 Add Labels with geom_label() ####
  #geom_label() works pretty much the same way as geom_text(). However, text is wrapped in a rectangle that you can customize (see next example).geom_label() 的工作方式与 geom_text() 几乎相同。 但是，文本被包裹在您可以自定义的矩形中（请参见下一个示例）。
# library
library(ggplot2)

# Keep 30 first rows in the mtcars natively available dataset
data=head(mtcars, 30)

# 1/ add text with geom_text, use nudge to nudge the text
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_label(
    label=rownames(data), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T #check_overlap似乎咋geom_label里面作用不大
  )

#### 3.1.8 Add One Text Label Only ####
  #Of course, you don’t have to label all dots on the chart. You can also add a piece of text on a specific position. Since we’re here, note that you can custom the annotation of geom_label with label.padding, label.size, color and fill as described below:当然，您不必在图表上标记所有点。 您还可以在特定位置添加一段文本。 既然我们在这里，请注意您可以使用 label.padding、label.size、color 和 fill 自定义 geom_label 的注释，如下所述：

# library
library(ggplot2)

# Keep 30 first rows in the mtcars natively available dataset
data=head(mtcars, 30)

# Add one annotation
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_label( #自定义标签
    label="Look at this!", 
    x=4.1,
    y=20,
    label.padding = unit(0.55, "lines"), # Rectangle size around label
    label.size = 0.35,
    color = "black",
    fill="#69b3a2"
  )

#### 3.1.9 Add Labels for a Selection of Marker ####
  #Last but not least, you can also select a group of marker and annotate them only. Here, only car with mpg > 20 and wt > 3 are annotated thanks to a data filtering in the geom_label() call.最后但并非最不重要的是，您还可以选择一组标记并仅对其进行注释。 在这里，由于 geom_label() 调用中的数据过滤，只有 mpg > 20 和 wt > 3 的汽车被注释。
# library
library(ggplot2)
library(dplyr)
#install.packages("tibble")
library(tibble)

# Keep 30 first rows in the mtcars natively available dataset
data0=head(mtcars, 30)

# Change data rownames as a real column called 'carName'
data <- data0 %>%
  rownames_to_column(var="carName") #添加了一列carName

# Plot
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + 
  geom_label( 
    data=data %>% filter(mpg>20 & wt>3), # Filter data first选择性注释
    aes(label=carName)
  )

#### 3.1.10 Ggplot2 Scatterplot with Rug ####
  #This section demonstrates how to build a scatterplot with rug with R and ggplot2. Adding rug gives insight about variable distribution and is especially helpful when markers overlap.本节演示如何使用 rug 和 R 和 ggplot2 构建散点图。 添加 rug 可以深入了解变量分布，并且在标记重叠时特别有用。
#### 3.1.10.1 Adding Rug with geom_rug() ####
  #A scatterplot displays the relationship between 2 numeric variables. You can easily add rug on X and Y axis thanks to the geom_rug() function to illustrate the distribution of dots.Note you can as well add marginal plots to show these distributions.散点图显示 2 个数值变量之间的关系。 借助 geom_rug() 函数来说明点的分布，您可以轻松地在 X 和 Y 轴上添加 rug。请注意，您也可以添加边际图来显示这些分布。
# library
library(ggplot2)

# Iris dataset
?iris #This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.
head(iris) 

# plot
ggplot(data=iris, aes(x=Sepal.Length, Petal.Length)) +
  geom_point() +
  geom_rug(col="steelblue",alpha=0.1, size=1.5) #给出点分布

#### 3.1.11 Marginal Distribution with ggplot2 and ggExtra ####
  #This section explains how to add marginal distributions to the X and Y axis of a ggplot2 scatterplot. It can be done using histogram, boxplot or density plot using the ggExtra library.本节介绍如何向 ggplot2 散点图的 X 和 Y 轴添加边缘分布。 可以使用 ggExtra 库使用直方图、箱线图或密度图来完成。

#### 3.1.11.1 Basic use of ggMarginal() ####
  #Here are 3 examples of marginal distribution added on X and Y axis of a scatterplot. The ggExtra library makes it a breeze thanks to the ggMarginal() function. Three main types of distribution are available: histogram, density and boxplot.以下是在散点图的 X 和 Y 轴上添加的边际分布的 3 个示例。 由于 ggMarginal() 函数，ggExtra 库使它变得轻而易举。 可以使用三种主要的分布类型：直方图、密度和箱线图。
  #Three additional examples to show possible customization:Change marginal plot size with size.随大小更改边缘绘图大小。Custom marginal plot appearance with all usual parameters. show only one marginal plot with margins = 'x' or margins = 'y'.具有所有常用参数的自定义边缘图外观。 仅显示一个边距 = 'x' or "y".

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

# with marginal histogram
p1 <- ggMarginal(p, type="histogram")
p1
# marginal density
p2 <- ggMarginal(p, type="density")
p2
# marginal boxplot
p3 <- ggMarginal(p, type="boxplot")
p3

#### 3.1.12 More Customization ####
  #Three additional examples to show possible customization:Change marginal plot size with size用 size 更改边缘绘图大小;Custom marginal plot appearance with all usual parameters具有所有常用参数的自定义边缘图外观;Show only one marginal plot with margins = ‘x’ or margins = ‘y’仅显示一个边距 = ‘x’ 或边距 = ‘y’ 的边缘图
# classic plot :
p <- ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, size=cyl)) +
  geom_point() +
  theme(legend.position="none")
p
# Set relative size of marginal plots (main plot 10x bigger than marginals)
p1 <- ggMarginal(p, type="histogram", size=10)
p1
# Custom marginal plots:
p2 <- ggMarginal(p, type="histogram", fill = "slateblue", xparams = list(  bins=10))
p2
# Show only marginal plot for x axis
p3 <- ggMarginal(p, margins = 'x', color="purple", size=4)
p3

#### 3.1.13 Linear Model and Confidence Interval in ggplot2 ####
  #Display the result of a linear model and its confidence interval on top of a scatterplot. A ggplot2 implementation with reproducible code.在散点图上显示线性模型的结果及其置信区间。 具有可重现代码的 ggplot2 实现。

#### 3.1.13.1 Linear Trend ####
  #Adding a linear trend to a scatterplot helps the reader in seeing patterns. ggplot2 provides the geom_smooth() function that allows to add the linear trend and the confidence interval around it if needed (option se=TRUE).Note: The method argument allows to apply different smoothing method like glm, loess and more. See the doc for more.向散点图添加线性趋势有助于读者查看模式。 ggplot2 提供了 geom_smooth() 函数，允许在需要时添加线性趋势及其周围的置信区间（选项 se=TRUE）。注意：method 参数允许应用不同的平滑方法，如 glm、loess 等。 请参阅文档了解更多信息。

# Library
library(ggplot2)
library(hrbrthemes)

# Create dummy data
data <- data.frame(
  cond = rep(c("condition_1", "condition_2"), each=10), 
  my_x = 1:100 + rnorm(100,sd=9), 
  my_y = 1:100 + rnorm(100,sd=16) 
)

# Basic scatter plot.
p1 <- ggplot(data, aes(x=my_x, y=my_y)) + 
  geom_point( color="#69b3a2") +
  theme_ipsum()
p1
# with linear trend
p2 <- ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point() +
  geom_smooth(method=lm , color="red", se=F) + #这个是加回归线，se是要不要置信区间
  theme_ipsum()
p2
# linear trend + confidence interval
p3 <- ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme_ipsum()
p3

#### 3.1.14 Using Base R ####
  #Base R is also a good option to build a scatterplot, using the plot() function. The chart #13 below will guide you through its basic usage. Following examples allow a greater level of customization.Base R 也是使用 plot() 函数构建散点图的不错选择。 下面的图表 #13 将指导您完成其基本用法。 以下示例允许更高级别的自定义。

#### 3.1.14.1 Basic Scatterplot in Base R ####
  #A very basic scatterplot built with base R and the plot() function. Explanation and code provided.使用基础 R 和 plot() 函数构建的非常基本的散点图。 提供了解释和代码。

#### 3.1.14.2 Most Basic Scatterplot ####
  #The plot() function of R allows to build a scatterplot. Both numeric variables of the input dataframe must be specified in the x and y argument.R 的 plot() 函数允许构建散点图。 输入数据帧的两个数值变量都必须在 x 和 y 参数中指定。
# Create data
data = data.frame(
  x=seq(1:100) + 0.1*seq(1:100)*sample(c(1:10) , 100 , replace=T),
  y=seq(1:100) + 0.2*seq(1:100)*sample(c(1:10) , 100 , replace=T)
)

# Basic scatterplot
plot(x=data$x, y=data$y)

#### 3.1.14.3 Customizations ####
  #Here is a description of the most common customization:
     #cex: circle size圆圈大小
     #xlim and ylim: limits of the X and Y axis X 轴和 Y 轴的限制
     #pch: shape of markers. See all here. 标记的形状。 在这里查看所有内容。
     #xlab and ylab: X and Y axis labels X 和 Y 轴标签
     #col: marker color标记颜色
     #main: chart title图表标题
# Create data
data = data.frame(
  x=seq(1:100) + 0.1*seq(1:100)*sample(c(1:10) , 100 , replace=T),
  y=seq(1:100) + 0.2*seq(1:100)*sample(c(1:10) , 100 , replace=T)
)

# Basic scatterplot
plot(data$x, data$y,
     xlim=c(0,250) , ylim=c(0,250), 
     pch=18, 
     cex=2, 
     col="#69b3a2",
     xlab="value of X", ylab="value of Y",
     main="A simple scatterplot"
)

#### 3.1.15 Map the Marker Color to a Categorical Variable ####
# the iris dataset is provided by R natively

# Create a color palette
#install.packages("paletteer")
library(paletteer) #可以用来创建自己的色板
#install.packages("ggthemes")
library(ggthemes)
colors <- paletteer::paletteer_c("ggthemes::Green-Blue-White Diverging", n = 3)

# Scatterplot with categoric color scale
unclass(iris$Species)
?unclass #R 拥有简单的通用函数机制，可用于面向对象的编程风格。 方法分派基于泛型函数的第一个参数的类进行。
plot(
  x = iris$Petal.Length, 
  y = iris$Petal.Width,
  bg = colors[unclass(iris$Species) ],
  cex = 3,
  pch=21
)

#### 3.1.16 Map the Marker Color to a Numeric Variable ####
# the iris dataset is provided by R natively

# Create a color palette
library(paletteer)
library(viridis)
nColor <- 20
colors <- paletteer::paletteer_c("viridis::inferno", n = nColor) #nColor表示所有的颜色


# Transform the numeric variable in bins
#切割成20个level，cut(iris$Petal.Width, nColor)
rank <- as.factor( as.numeric( cut(iris$Petal.Width, nColor)))

# Scatterplot with color gradient
plot(
  x = iris$Petal.Length, 
  y = iris$Petal.Width,
  bg = colors[ rank ],
  cex = 3,
  pch=21
)

#### 3.1.17 Scatterplot with Polynomial Curve Fitting ####
  #This example describes how to build a scatterplot with a polynomial curve drawn on top of it. First of all, a scatterplot is built using the native R plot() function. Then, a polynomial model is fit thanks to the lm() function.First of all, a scatterplot is built using the native R plot() function. Then, a polynomial model is fit thanks to the lm() function. It is possible to have the estimated Y value for each step of the X axis using the predict() function, and plot it with line().It is a good practice to add the equation of the model with text().Note: You can also add a confidence interval around the model as described in chart #45.此示例描述如何构建散点图，并在其上绘制多项式曲线。 首先，散点图是使用原生 R plot() 函数构建的。 然后，通过 lm() 函数拟合多项式模型。首先，使用原生 R plot() 函数构建散点图。 然后，通过 lm() 函数拟合多项式模型。 可以使用 predict() 函数获得 X 轴每一步的估计 Y 值，并用 line() 绘制它。用 text() 添加模型的方程是一个很好的做法。注意： 您还可以在模型周围添加置信区间，如图表 #45 中所述。

x <- runif(300,  min=-10, max=10) 
y <- 0.1*x^3 - 0.5 * x^2 - x + 10 + rnorm(length(x),0,8) 

# plot of x and y :
plot(x,y,col=rgb(0.4,0.4,0.8,0.6),pch=16 , cex=1.3) 

# Can we find a polynome that fit this function ?
model <- lm(y ~ x + I(x^2) + I(x^3))
I

#Features of this model :
summary(model)
model$coefficients
summary(model)$adj.r.squared

# For each value of x, I can get the value of y estimated by the model, and add it to the current plot !对于 x 的每个值，I可以得到模型估计的 y 值，并将其添加到当前绘图中！
myPredict <- predict( model ) 
ix <- sort(x,index.return=T)$ix #将向量或因子（部分）排序（或排序）为升序或降序。 要对多个变量进行排序，例如，对数据框进行排序，请参阅 order。逻辑指示是否也应返回排序索引向量。 任何 na.last 模式和数据类型的 method == "radix" 支持，以及 na.last = NA （默认）和完全排序非因素时的其他方法。
lines(x[ix], myPredict[ix], col=2, lwd=2 )  
# Add the features of the model to the plot
coeff <- round(model$coefficients , 2)
text(3, -70 , paste("Model : ",coeff[1] , " + " , coeff[2] , "*x"  , "+" , coeff[3] , "*x^2" , "+" , coeff[4] , "*x^3" , "\n\n" , "P-value adjusted = ",round(summary(model)$adj.r.squared,2)))

#### 3.1.18 Polynomial Curve Fitting and Confidence Interval ####
  #This example follows the previous scatterplot with polynomial curve. It extends this example, adding a confidence interval.This example follows the previous chart #44 that explained how to add polynomial curve on top of a scatterplot in base R.Here, a confidence interval is added using the polygon() function.此示例遵循先前的多项式曲线散点图。 它扩展了这个例子，增加了一个置信区间。这个例子遵循前面的图表#44，它解释了如何在基础 R 的散点图顶部添加多项式曲线。这里，使用polygon() 函数添加了一个置信区间。

# We create 2 vectors x and y. It is a polynomial function.
x <- runif(300, min=-30, max=30) 
y <- -1.2*x^3 + 1.1 * x^2 - x + 10 + rnorm(length(x),0,100*abs(x)) 

# Basic plot of x and y :
plot(x,y,col=rgb(0.4,0.4,0.8,0.6), pch=16 , cex=1.3 , xlab="" , ylab="") 

# Can we find a polynome that fit this function ?
model <- lm(y ~ x + I(x^2) + I(x^3))

# I can get the features of this model :
#summary(model)
#model$coefficients
#summary(model)$adj.r.squared

#For each value of x, I can get the value of y estimated by the model, and the confidence interval around this value.
myPredict <- predict( model , interval="predict" )
#Finally, I can add it to the plot using the line and the polygon function with transparency.最后，我可以使用 line 和具有透明度的多边形函数将其添加到绘图中。
ix <- sort(x,index.return=T)$ix
lines(x[ix], myPredict[ix , 1], col=2, lwd=2 )

polygon(c(rev(x[ix]), x[ix]), c(rev(myPredict[ ix,3]), myPredict[ ix,2]), col = rgb(0.7,0.7,0.7,0.4) , border = NA)
?polygon #多边形绘制顶点在 x 和 y 中给出的多边形。vectors containing the coordinates of the vertices of the polygon.

#### 3.1.19 Lattice XY Plot Function ####
  #The xyplot() function of the lattice package allows to build a scatterplot for several categories automatically. The lattice library offers the xyplot() function. It builds a scatterplot for each levels of a factor automatically.The lattice library offers the xyplot() function. It builds a scatterplot for each levels of a factor automatically.It is actually the ancestor of the geom_wrap() function of ggplot2 than you can see in action here.lattice 包的 xyplot() 函数允许自动为多个类别构建散点图。 点阵库提供了 xyplot() 函数。 它自动为因子的每个级别构建散点图。点阵库提供了 xyplot() 函数。 它自动为一个因子的每个级别构建一个散点图。它实际上是 ggplot2 的 geom_wrap() 函数的祖先，你可以在这里看到。
# Library
#install.packages("lattice")
library(lattice)

# create data :
sample <- paste(rep("sample_",40) , seq(1,40) , sep="")
specie <- c(rep("carot" , 10) , rep("cumcumber" , 10) , rep("wheat" , 10) , rep("Potatoe" , 10) )
gene1 <- c( seq(5,14)+rnorm(10 , 4 , 1) , seq(5,14)+rnorm(10 , 4 , 1) , seq(5,14)+rnorm(10 , 4 , 1) , seq(5,14)+rnorm(10 , 4 , 1) )
gene2 <- c( seq(5,14)+rnorm(10 , 4 , 1) , seq(5,14)+rnorm(10 , 2 , 0.2) , seq(5,14)+rnorm(10 , 4 , 4) , seq(5,14)+rnorm(10 , 4 , 3) )
data <- data.frame(sample,specie,gene1,gene2)

# Make the graph
xyplot(gene1 ~ gene2 | specie , data=data , pch=20 , cex=3 , col=rgb(0.2,0.4,0.8,0.5) ) #| specie造成了分组

#### 3.1.20 Correlation between Discrete Variable ####
  #Studying the relationship between 2 discrete variables is complicated since an usual scatterplot suffers overplotting. Here is a workaround using base R.研究 2 个离散变量之间的关系很复杂，因为通常的散点图会过度绘制。 这是使用基础 R 的解决方法。

#### 3.1.20.1 Scatterplot with Variable Size ####
  #An usual scatterplot would suffer over plotting when used for discrete variables: dots would be drawn on top of each other, making the chart unreadable. The workaround suggested here makes dot size proportional to the number of data points behind it. On top of that, the exact number can be represented in the bubble thanks to the text() function.当用于离散变量时，通常的散点图会出现过度绘制：点将绘制在彼此的顶部，使图表不可读。 此处建议的解决方法使点大小与其背后的数据点数量成正比。 最重要的是，由于 text() 函数，可以在气泡中表示确切的数字。
#Let's create 2 discrete variables 
a <- c(1,1,3,4,5,5,1,1,2,3,4,1,3,2,1,1,5,1,4,3,2,3,1,0,2)
b <- c(1,2,3,5,5,5,2,1,1,3,4,3,3,4,1,1,4,1,4,2,2,3,0,0,1)

#I count the occurence of each couple of values. Eg : number of time a=1 and b=1, number of time a=1 and b=2 etc...我计算每对值的出现。 例如：次数 a=1 和 b=1，次数 a=1 和 b=2 等等...
AA <- xyTable(a,b) #给定 (x,y) 点，确定它们的多重性——仅检查某些（粗略的）噪声是否相等。 请注意，这是一种特殊的 2D 分箱。

?xyTable
AA

#Now I can plot this ! I represent the dots as big as the couple occurs often
coeff_bigger <- 2
plot(AA$x , AA$y , cex=AA$number*coeff_bigger  , pch=16 , col=rgb(0,0,1,0.5) , xlab= "value of a" , ylab="value of b" , xlim=c(0,6) , ylim=c(0,6) )
text(AA$x , AA$y , AA$number ) #坐标和内容
?text

#Note : It's easy to make a function that will compute this kind of plot automaticaly :
represent_discrete_variable <- function(var1, var2 , coeff_bigger){
  AA=xyTable(var1,var2)
  plot(AA$x , AA$y , cex=AA$number*coeff_bigger  , pch=16 , col="chocolate1" , xlab= "value of a" , ylab="value of b" )
  text (AA$x , AA$y , AA$number )
}

#### 3.1.20.2 Other Workarounds ####
  #Other workarounds could be considered in this situation: 
    #Heatmap热图
    #2d density chart二维密度图
    #Jittering抖动
    #Boxplot箱形图

#### 3.1.21 Use mtext() to Write Text in Margin ####
  #This document describes how to use the mtext() function to add text in the plot margin. Usefull to add title on a multi chart.The mtext() function allows to write text in one of the four margins of the current figure region or one of the outer margins of the device region.Here, the figure is first split thanks to par(mfrow()). Then, only one title is added and centered using mtext().本文档介绍如何使用 mtext() 函数在图边距中添加文本。 在多图表上添加标题很有用。 mtext() 函数允许在当前图形区域的四个边距之一或设备区域的外边距之一中写入文本。这里，由于 par，图形首先被拆分 (mfrow())。 然后，只添加一个标题并使用 mtext() 居中。
#Dummy data 
Ixos <- rnorm(4000,100,30)
Primadur <- Ixos+rnorm(4000 , 0 , 30)

#Divide the screen in 1 line and 2 columns
par(
  mfrow=c(1,2), 
  oma = c(0, 0, 2, 0) #outer margin area
) 

#Make the margin around each graph a bit smaller
par(mar=c(4,2,2,2))

# Histogram and Scatterplot
hist(Ixos,  main="" , breaks=30 , col=rgb(0.3,0.5,1,0.4) , xlab="height" , ylab="nbr of plants")
plot(Ixos , Primadur,  main="" , pch=20 , cex=0.4 , col=rgb(0.3,0.5,1,0.4)  , xlab="primadur" , ylab="Ixos" )
#And I add only ONE title :
mtext("Primadur : Distribution and correlation with Ixos", outer = TRUE, cex = 1.5, font=4, col=rgb(0.1,0.3,0.5,0.5) )

#### 3.1.22 Customizations ####
  #Here is a description of the most common customization:
  #cex: circle size
  #xlim and ylim: limits of the X and Y axis
  #pch: shape of markers. See all here.
  #xlab and ylab: X and Y axis labels
  #col: marker color
  #main: chart title
# Create data
data = data.frame(
  x=seq(1:100) + 0.1*seq(1:100)*sample(c(1:10) , 100 , replace=T),
  y=seq(1:100) + 0.2*seq(1:100)*sample(c(1:10) , 100 , replace=T)
)

# Basic scatterplot
plot(data$x, data$y,
     xlim=c(0,250) , ylim=c(0,250), 
     pch=18, 
     cex=2, 
     col="#69b3a2",
     xlab="value of X", ylab="value of Y",
     main="A simple scatterplot"
)

#### 3.1.23 The split_screen() Function of R ####
  #This document explains how to use the split_screen() function of R to divide your device in several parts, one for each chart.The split_screen() function allows to divide the window in several chart sections.However,The mfrow method is more adapted for simple layouts.The layout function is better for complex layouts.本文档解释了如何使用 R 的 split_screen() 函数将您的设备划分为多个部分，每个图表一个。 split_screen() 函数允许将窗口划分为多个图表部分。然而，mfrow 方法更适用于 简单的布局。布局功能更适合复杂的布局。
#Create data
a <- seq(1,29)+4*runif(29,0.4)
b <- seq(1,29)^2+runif(29,0.98)
?runif #runif(n, min = 0, max = 1)
# I divide the screen in 2 line and 1 column only
my_screen_step1 <- split.screen(c(2, 1))

# I add one graph on the screen number 1 which is on top :
screen(my_screen_step1[1])
plot( a,b , pch=20 , xlab="value of a" , cex=3 , col=rgb(0.4,0.9,0.8,0.5) )


# I divide the second screen in 2 columns :
my_screen_step2 <- split.screen(c(1, 2), screen = my_screen_step1[2])
screen(my_screen_step2[1])
hist(a, border=F , col=rgb(0.2,0.2,0.8,0.7) , main="" , xlab="distribution of a")
screen(my_screen_step2[2])
hist(b, border=F , col=rgb(0.8,0.2,0.8,0.7) , main="" ,  xlab="distribution of b")

#### 3.1.24 Use par mfrow to Split Screen ####
  #The par() function allows to set the mfrow() parameters to cut the charting window in several section.par() 函数允许设置 mfrow() 参数以在几个部分中切割图表窗口。

#### 3.1.24.1 Most Basic Scatterplot ####
  #The par() function allows to set parameters to the plot. The mfrow() parameter allows to split the screen in several panels. Subsequent charts will be drawn in panels.You have to provide a vector of length 2 to mfrow(): number of rows and number of columns.Note: mfcol() does the same job but draws figure by columns instead of by row.Alternative: See the layout() function for more complex layout creation.par() 函数允许为绘图设置参数。 mfrow() 参数允许将屏幕拆分为多个面板。 后续图表将绘制在面板中。您必须向 mfrow() 提供长度为 2 的向量：行数和列数。注意：mfcol() 执行相同的工作，但按列而不是按行绘制图形。替代 ：查看 layout() 函数以了解更复杂的布局创建。
#Create data
a <- seq(1,29)+4*runif(29,0.4)
b <- seq(1,29)^2+runif(29,0.98)

#Divide the screen in 2 columns and 2 lines
par(mfrow=c(2,2))

#Add a plot in each sub-screen !
plot( a,b , pch=20)
plot(a-b , pch=18)
hist(a, border=F , col=rgb(0.2,0.2,0.8,0.7) , main="")
boxplot(a , col="grey" , xlab="a")

#### 3.1.25 Base R Graph Parameters: A Cheatsheet. ####
  #This section aims to remind the options offered to customize a graph in base R. Understand in a sec how to use lwd, pch, type, lty, cex, and more. Base R offers many option to customize the chart appearance. Basically everthing is doable with those few options:Base R offers many option to customize the chart appearance. Basically everthing is doable with those few options本节旨在提醒在基本 R 中自定义图形所提供的选项。在一秒钟内了解如何使用 lwd、pch、type、lty、cex 等。 Base R 提供了许多自定义图表外观的选项。 基本上所有选项都可以通过这几个选项来实现：Base R 提供了许多自定义图表外观的选项。 基本上一切都可以通过这几个选项来实现:
   #cex: shape size
   #lwd: line width
   #col: control colors
   #lty: line type
   #pch: marker shape
   #type: link between dots
   #Note: visit the cheatsheet section for more.
split.screen(c(1,1)) 
par(mar=c(3,3,3,3))
num <- 0 ; 
num1 <- 0
plot(0,0 , xlim=c(0,21) , ylim=c(0.5,6.5), col="white" , yaxt="n" , ylab="" , xlab="")

#fill the graph
for (i in seq(1,20)){
  points(i,1 , pch=i , cex=3)
  points(i,2 , col=i , pch=16 , cex=3)
  points(i,3 , col="black" , pch=16 , cex=i*0.25)
  #lty
  if(i %in% c(seq(1,18,3))){
    num=num+1
    points(c(i,i+2), c(4,4) , col="black" , lty=num , type="l" , lwd=2)
    text(i+1.1 , 4.15 , num)
  }
  #type and lwd 
  if(i %in% c(seq(1,20,5))){
    num1=num1+1
    points(c(i,i+1,i+2,i+3), c(5,5,5,5) , col="black"  , type=c("p","l","b","o")[num1] , lwd=2)
    text(i+1.1 , 5.2 , c("p","l","b","o")[num1] )
    points(c(i,i+1,i+2,i+3), c(6,6,6,6) , col="black"  , type="l",  lwd=num1)
    text(i+1.1 , 6.2 , num1 )
    
  }
}

#add axis
axis(2, at = c(1,2,3,4,5,6), labels = c("pch" , "col" , "cex" , "lty", "type" , "lwd" ), 
     tick = TRUE, col = "black", las = 1, cex.axis = 0.8)


#### 3.1.26 Special Use Case: Manhattan Plots ####
  #A Manhattan plot is a particular type of scatterplot used in genomics. The X axis displays the position of a genetic variant on the genome. Each chromosome is usually represented using a different color. The Y axis shows p-value of the association test with a phenotypic trait.A Manhattan plot is a specific type of scatter plot widely used in genomics to study GWAS results (Genome Wide Association Study). Each point represents a genetic variant. The X axis shows its position on a chromosome, the Y axis tells how much it is associated with a trait. This page reviews how to make a Manhattan plot with R, and displays a couple of variations.Basic The manhattan function is straightforward: it just needs to have 4 columns identified properly, and does a proper job.曼哈顿图是基因组学中使用的一种特殊类型的散点图。 X 轴显示基因组上遗传变异的位置。 每条染色体通常用不同的颜色表示。 Y 轴显示具有表型特征的关联检验的 p 值。曼哈顿图是一种特定类型的散点图，广泛用于基因组学研究 GWAS 结果（全基因组关联研究）。 每个点代表一个遗传变异。 X 轴表示它在染色体上的位置，Y 轴表示它与性状的关联程度。 本页回顾了如何用 R 绘制曼哈顿图，并显示了几个变体。基本 曼哈顿函数很简单：它只需要正确识别 4 列，并完成正确的工作。

# Load the library
#install.packages("qqman")
library(qqman)

# Make the Manhattan plot on the gwasResults dataset
manhattan(gwasResults, chr="CHR", bp="BP", snp="SNP", p="P" )
?manhattan #Creates a manhattan plot from PLINK assoc output (or any data frame with chromosome, position, and p-value).从 PLINK 关联输出（或任何具有染色体、位置和 p 值的数据框）创建曼哈顿图。
# chr~A string denoting the column name for the chromosome. Defaults to PLINK's "CHR." Said column must be numeric. If you have X, Y, or MT chromosomes, be sure to renumber these 23, 24, 25, etc.表示染色体列名的字符串。 默认为 PLINK 的“CHR”。 所述列必须是数字。 如果您有 X、Y 或 MT 染色体，请务必重新编号这 23、24、25 等。
#bp~A string denoting the column name for the chromosomal position. Defaults to PLINK's "BP." Said column must be numeric.一个字符串，表示染色体位置的列名。 默认为 PLINK 的“BP”。 所述列必须是数字。
#snp~A string denoting the column name for the SNP name (rs number). Defaults to PLINK's "SNP." Said column should be a character.表示 SNP 名称（rs 编号）的列名称的字符串。 默认为 PLINK 的“SNP”。 所说的列应该是一个字符。
#p~A string denoting the column name for the p-value. Defaults to PLINK's "P." Said column must be numeric.一个字符串，表示 p 值的列名。 默认为 PLINK 的“P”。 所述列必须是数字。


#### 3.1.26.1 SNP of Interest ####
  #A common task is to highlight a group of SNP on the Manhattan plot. For example it is handy to show which SNP are part of the clumping result. This is an easy task with qqman once you have identified the SNPs of interest.一个常见的任务是在曼哈顿图上突出显示一组 SNP。 例如，可以方便地显示哪些 SNP 是结块结果的一部分。 一旦您确定了感兴趣的 SNP，使用 qqman 就可以轻松完成这项任务。
# A list of SNP of interest is provided with the library库中提供了感兴趣的 SNP 列表:
snpsOfInterest

# Let's highlight them, with a bit of customization on the plot
manhattan(gwasResults, highlight = snpsOfInterest)

#### 3.1.26.2 Annotate ####
  #You probably want to know the name of the SNP of interest: the ones with a high pvalue. You can automatically annotate them using the annotatePval argument您可能想知道感兴趣的 SNP 的名称：具有高 pvalue 的那些。 您可以使用 annotatePval 参数自动注释它们:
manhattan(gwasResults, annotatePval = 0.01)

#### 3.1.26.3 Qqplot ####
  #It is a good practice to draw a qqplot from the output of a GWAS. It allows to compare the distribution of the pvalue with an expected distribution by chance. Its realisation is straightforward thanks to the qq function从 GWAS 的输出中绘制 qqplot 是一个很好的做法。 它允许将 pvalue 的分布与偶然的预期分布进行比较。 由于 qq 函数，它的实现很简单:
qq(gwasResults$P)

#### 3.1.27 Highly Customizable with ggplot2 ####
  #If you want to access a maximum level of customization it is sometimes good to build your plot from scratch. Here is an example using dplyr and ggplot2.如果您想访问最高级别的自定义，有时从头开始构建您的绘图会很好。 这是使用 dplyr 和 ggplot2 的示例。

#### 3.1.27.1 Basic ####
  #First of all, we need to compute the cumulative position of SNP.首先，我们需要计算 SNP 的累积位置。
don <- gwasResults %>% 
  
  # Compute chromosome size
  group_by(CHR) %>% 
  summarise(chr_len=max(BP)) %>% 
  
  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  dplyr::select(-chr_len) %>%
  
  # Add this info to the initial dataset
  left_join(gwasResults, ., by=c("CHR"="CHR")) %>%
  
  # Add a cumulative position of each SNP
  arrange(CHR, BP) %>%
  mutate( BPcum=BP+tot)

  #Then we need to prepare the X axis. Indeed we do not want to display the cumulative position of SNP in bp, but just show the chromosome name instead.然后我们需要准备X轴。 实际上，我们不想在 bp 中显示 SNP 的累积位置，而只想显示染色体名称。
axisdf = don %>% group_by(CHR) %>% summarize(center=( max(BPcum) + min(BPcum) ) / 2 )

  #Ready to make the plot using ggplot2:
ggplot(don, aes(x=BPcum, y=-log10(P))) +
  
  # Show all points
  geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 22 )) +
  
  # custom X axis:
  scale_x_continuous( label = axisdf$CHR, breaks= axisdf$center ) +
  scale_y_continuous(expand = c(0, 0) ) +     # remove space between plot area and x axis
  
  # Custom the theme:
  theme_bw() +
  theme( 
    legend.position="none",
    panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )

#### 3.1.27.2 Highlight SNPs ####
  #Let’s suppose the you have a group of SNP that you want to highlight on the plot. This can be done following almost the same procedure. We just need to add them a flag in the dataframe, and use the flag for the color假设您有一组要在图中突出显示的 SNP。 这可以按照几乎相同的程序完成。 我们只需要在数据框中为它们添加一个标志，并使用该标志作为颜色:
# List of SNPs to highlight are in the snpsOfInterest object
# We will use ggrepel for the annotation
library(ggrepel)

# Prepare the dataset
don <- gwasResults %>% 
  
  # Compute chromosome size
  group_by(CHR) %>% 
  summarise(chr_len=max(BP)) %>% 
  
  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  dplyr::select(-chr_len) %>%
  
  # Add this info to the initial dataset
  left_join(gwasResults, ., by=c("CHR"="CHR")) %>%
  
  # Add a cumulative position of each SNP
  arrange(CHR, BP) %>%
  mutate( BPcum=BP+tot) %>%
  
  # Add highlight and annotation information
  mutate( is_highlight=ifelse(SNP %in% snpsOfInterest, "yes", "no")) %>%
  mutate( is_annotate=ifelse(-log10(P)>4, "yes", "no")) 

# Prepare X axis
axisdf <- don %>% group_by(CHR) %>% summarize(center=( max(BPcum) + min(BPcum) ) / 2 )

# Make the plot
ggplot(don, aes(x=BPcum, y=-log10(P))) +
  
  # Show all points
  geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 22 )) +
  
  # custom X axis:
  scale_x_continuous( label = axisdf$CHR, breaks= axisdf$center ) +
  scale_y_continuous(expand = c(0, 0) ) +     # remove space between plot area and x axis
  
  # Add highlighted points
  geom_point(data=subset(don, is_highlight=="yes"), color="orange", size=2) +
  
  # Add label using ggrepel to avoid overlapping
  geom_label_repel( data=subset(don, is_annotate=="yes"), aes(label=SNP), size=2) +
  
  # Custom the theme:
  theme_bw() +
  theme( 
    legend.position="none",
    panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )

#### 3.1.27.3 A Note about Speed ####
  #A common problem in genomics is the high number of data points. It is not unusual to make a GWAS with millions of SNPs, which makes the plot very long to build. However, it is important to notice that the vast majority of these SNPs have a high p-value and thus do not interest us for the analysis.A quick work around is thus to plot only SNP with a p-value below a given threshold (~0.05). The graphic will be as informative, but made in seconds. The filtering is straightforward. For example with dplyr基因组学中的一个常见问题是大量数据点。 制作具有数百万个 SNP 的 GWAS 并不罕见，这使得构建情节非常长。 然而，重要的是要注意这些 SNP 中的绝大多数具有高 p 值，因此我们对分析不感兴趣。因此，快速解决方法是仅绘制 p 值低于给定阈值的 SNP（ ~0.05）。 该图形将提供信息，但只需几秒钟即可完成。 过滤很简单。 例如使用 dplyr:
gwasResults %>% 
  filter(-log10(P)>1)
  #Decreasing the number of data points has another interest: it allows to switch to an interactive version.减少数据点的数量还有另一个好处：它允许切换到交互式版本。

#### 3.1.28 Switch to an Interactive Version with plotly ####
  #plotly is an HTML widget: an R library that allows to call javascript under the hood to create interactive visualizations. The good thing with plotly is that it can transform a ggplot2 graphic in an interactive version using the ggplotly function. Let’s apply it to our manhattan plot.Note 1: You probably want to filter your data before doing an interactive version. Having thousands of points will slow down the graphic, and you surely don’t care about SNP with a high p-value.Note 2: the Manhattanly library is another good way to make an interactive manhattan plot. It wraps the plotly library, so you will have less code to type than the example below, but less customization available.Note 3: Interactivity allows to: zoom on a specific region of the graphic, hover a SNP, move axis, export figure as png.plotly 是一个 HTML 小部件：一个 R 库，它允许在幕后调用 javascript 来创建交互式可视化。 plotly 的好处是它可以使用 ggplotly 函数在交互式版本中转换 ggplot2 图形。 让我们把它应用到我们的曼哈顿图上。 注意 1：你可能想在做交互式版本之前过滤你的数据。 拥有数千个点会减慢图形的速度，而且您肯定不关心具有高 p 值的 SNP。注 2：Manhattanly 库是制作交互式曼哈顿图的另一种好方法。 它包装了 plotly 库，因此您需要输入的代码比下面的示例少，但可用的自定义更少。注 3：交互性允许：缩放图形的特定区域、悬停 SNP、移动轴、导出图形为 .png
#install.packages("plotly")
library(plotly)

# Prepare the dataset
don <- gwasResults %>% 
  
  # Compute chromosome size
  group_by(CHR) %>% 
  summarise(chr_len=max(BP)) %>% 
  
  # Calculate cumulative position of each chromosome
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  dplyr::select(-chr_len) %>%
  
  # Add this info to the initial dataset
  left_join(gwasResults, ., by=c("CHR"="CHR")) %>%
  # Add a cumulative position of each SNP
  arrange(CHR, BP) %>%
  mutate( BPcum=BP+tot) %>%
  
  # Add highlight and annotation information
  mutate( is_highlight=ifelse(SNP %in% snpsOfInterest, "yes", "no")) %>%
  
  # Filter SNP to make the plot lighter
  filter(-log10(P)>0.5)

# Prepare X axis
axisdf <- don %>% group_by(CHR) %>% summarize(center=( max(BPcum) + min(BPcum) ) / 2 )

# Prepare text description for each SNP:
don$text <- paste("SNP: ", don$SNP, "\nPosition: ", don$BP, "\nChromosome: ", don$CHR, "\nLOD score:", -log10(don$P) %>% round(2), "\nWhat else do you wanna know", sep="")

# Make the plot
p <- ggplot(don, aes(x=BPcum, y=-log10(P), text=text)) +
  
  # Show all points
  geom_point( aes(color=as.factor(CHR)), alpha=0.8, size=1.3) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 22 )) +
  
  # custom X axis:
  scale_x_continuous( label = axisdf$CHR, breaks= axisdf$center ) +
  scale_y_continuous(expand = c(0, 0) ) +     # remove space between plot area and x axis
  ylim(0,9) +
  
  # Add highlighted points
  geom_point(data=subset(don, is_highlight=="yes"), color="orange", size=2) +
  
  # Custom the theme:
  theme_bw() +
  theme( 
    legend.position="none",
    panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )
ggplotly(p, tooltip="text")

#### 3.1.29 Circular Version with CMplot ####
  #The CMplot library by Lilin Yin is a good choice if you want to make a circular version of your manhattanplot. I believe than doing a circular version makes sense: it gives less space to all the non significant SNPs that do not interest us, and gives more space for the significant association. Moreover, the CMplot makes their realization straightforward.如果您想制作曼哈顿图的圆形版本，Lilin Yin 的 CMplot 库是一个不错的选择。 我相信比做循环版本更有意义：它为我们不感兴趣的所有非重要 SNP 提供更少的空间，并为重要关联提供更多空间。 此外，CMplot 使它们的实现变得简单明了。
#install.packages("CMplot")
library(CMplot)    #回储存在本地  
CMplot(gwasResults, plot.type="c", r=1.6, cir.legend=TRUE,
       outward=TRUE, cir.legend.col="black", cir.chr.h=.1 ,chr.den.col="orange", file="jpg",
       memo="a", dpi=300, chr.labels=seq(1,22))
data(pig60K)
CMplot(pig60K,type="p",plot.type="d",bin.size=1e6,chr.den.col=c("darkgreen", "yellow", "red"),file="jpg",memo="aa",dpi=300,
       file.output=TRUE,verbose=TRUE,width=9,height=6)

#### 3.1.29.1 A high-quality drawing tool designed for Manhattan plot of genomic analysis ####
#### 3.1.29.2 Installation ####
  #CMplot is available on CRAN, so it can be installed with the following R code:
#install.packages("CMplot")
library("CMplot")

# if you want to use the latest version on GitHub:
#source("https://raw.githubusercontent.com/YinLiLin/CMplot/master/R/CMplot.r")

#There are two example datasets attached in CMplot, users can export and view the details by following R code:
data(pig60K)   #calculated p-values by MLM
data(cattle50K)   #calculated SNP effects by rrblup
head(pig60K)
head(cattle50K)

  #As the example datasets, the first three columns are names, chromosome, position of SNPs respectively, the rest of columns are the pvalues of GWAS or effects of GS/GP for traits, the number of traits is unlimited. Note: if plotting SNP_Density, only the first three columns are neededNow CMplot could handle not only Genome-wide association study results, but also SNP effects, Fst, tajima’s D and so on.作为示例数据集，前三列分别是名称、染色体、SNP的位置，其余列是GWAS的pvalues或GS/GP对性状的影响，性状的数量不限。 注意：如果绘制SNP_Density，只需要前三列现在CMplot不仅可以处理全基因组关联研究结果，还可以处理SNP效应、Fst、tajima's D等。

#### 3.1.30 SNP-Density Plot ####
CMplot(pig60K,type="p",plot.type="d",bin.size=1e6,chr.den.col=c("darkgreen", "yellow", "red"),file="jpg",memo="pig60K",dpi=300,
       file.output=TRUE,verbose=TRUE,width=9,height=6)

#### 3.1.31 Circular-Manhattan Plot ####
#### 3.1.31.1 (1) Genome-Wide Association Study(GWAS) ####
CMplot(pig60K,type="p",plot.type="c",chr.labels=paste("Chr",c(1:18,"X","Y"),sep=""),r=0.4,cir.legend=TRUE,
       outward=FALSE,cir.legend.col="black",cir.chr.h=1.3,chr.den.col="black",file="jpg",
       memo="Genome-Wide Association Study(GWAS)",dpi=300,file.output=TRUE,verbose=TRUE,width=10,height=10)

CMplot(pig60K,type="p",plot.type="c",r=0.4,col=c("grey30","grey60"),chr.labels=paste("Chr",c(1:18,"X","Y"),sep=""),
       threshold=c(1e-6,1e-4),cir.chr.h=1.5,amplify=TRUE,threshold.lty=c(1,2),threshold.col=c("red",
                                                                                              "blue"),signal.line=1,signal.col=c("red","green"),chr.den.col=c("darkgreen","yellow","red"),
       bin.size=1e6,outward=FALSE,file="jpg",memo="aa2",dpi=300,file.output=TRUE,verbose=TRUE,width=10,height=10)

  ##Note:1. if signal.line=NULL, the lines that crosse circles won't be added.2. if the length of parameter 'chr.den.col' is not equal to 1, SNP density that counts the number of SNP within given size('bin.size') will be plotted around the circle.注：1。 如果signal.line=NULL，则不会添加与圆圈交叉的线。2。 如果参数 'chr.den.col' 的长度不等于 1，则将在给定大小（'bin.size'）内计算 SNP 数量的 SNP 密度绘制在圆圈周围。

#### 3.1.31.2 (2) Genomic Selection/Prediction(GS/GP) ####
CMplot(cattle50K,type="p",plot.type="c",LOG10=FALSE,outward=TRUE,col=matrix(c("#4DAF4A",NA,NA,"dodgerblue4",
                                                                              "deepskyblue",NA,"dodgerblue1", "olivedrab3", "darkgoldenrod1"), nrow=3, byrow=TRUE),
       chr.labels=paste("Chr",c(1:29),sep=""),threshold=NULL,r=1.2,cir.chr.h=1.5,cir.legend.cex=0.5,
       cir.band=1,file="jpg", memo="ccc",dpi=300,chr.den.col="black",file.output=TRUE,verbose=TRUE,
       width=10,height=10)

#Note: parameter 'col' can be either vector or matrix, if a matrix, each trait can be plotted in different colors.注意：参数'col'可以是向量或矩阵，如果是矩阵，每个特征可以用不同的颜色绘制。

#### 3.1.32 Single_track Rectangular-Manhattan Plot ####

#### 3.1.32.1 Genome-Wide Association Study(GWAS) ####

CMplot(pig60K,type="p",plot.type="m",LOG10=TRUE,threshold=NULL,file="jpg",memo="ss",dpi=300,
       file.output=TRUE,verbose=TRUE,width=14,height=6,chr.labels.angle=45)
# 'chr.labels.angle': adjust the angle of labels of x-axis (-90 < chr.labels.angle < 90).

#### 3.1.32.2 Amplify Signals on pch, cex and col ####
CMplot(pig60K, plot.type="m", col=c("grey30","grey60"), LOG10=TRUE, ylim=c(2,12), threshold=c(1e-6,1e-4),
       threshold.lty=c(1,2), threshold.lwd=c(1,1), threshold.col=c("black","grey"), amplify=TRUE,
       chr.den.col=NULL, signal.col=c("red","green"), signal.cex=c(1.5,1.5),signal.pch=c(19,19),
       file="jpg",memo="dd",dpi=300,file.output=TRUE,verbose=TRUE,width=14,height=6)

#Note: if the ylim is setted, then CMplot will only plot the points among this interval,
#       ylim can be vector or list, if it is a list, different traits can be assigned with
#       different range at y-axis.

#### 3.1.32.3 Attach Chromosome Density on the bottom of Manhattan Plot ####

CMplot(pig60K, plot.type="m", LOG10=TRUE, ylim=NULL, threshold=c(1e-6,1e-4),threshold.lty=c(1,2),
       threshold.lwd=c(1,1), threshold.col=c("black","grey"), amplify=TRUE,bin.size=1e6,
       chr.den.col=c("darkgreen", "yellow", "red"),signal.col=c("red","green"),signal.cex=c(1.5,1.5),
       signal.pch=c(19,19),file="jpg",memo="ddd",dpi=300,file.output=TRUE,verbose=TRUE,
       width=14,height=6)

#Note: if the length of parameter 'chr.den.col' is bigger than 1, SNP density that counts the number of SNP within given size('bin.size') will be plotted.注意：如果参数 'chr.den.col' 的长度大于 1，将绘制计算给定大小（'bin.size'）内 SNP 数量的 SNP 密度。

#### 3.1.32.4 Highlight a Group of SNPs on pch, cex, type, and col ####
signal <- pig60K$Position[which.min(pig60K$trait2)]
SNPs <- pig60K$SNP[pig60K$Chromosome==13 & 
                     pig60K$Position<(signal+1000000)&pig60K$Position>(signal-1000000)]
CMplot(pig60K, plot.type="m",LOG10=TRUE,col=c("grey30","grey60"),highlight=SNPs,
       highlight.col="green",highlight.cex=1,highlight.pch=19,file="jpg",memo="ddddd",
       chr.border=TRUE,dpi=300,file.output=TRUE,verbose=TRUE,width=14,height=6)
#Note:'highlight' could be vector or list, if it is a vector, all traits will use the same highlighted SNPs index, if it is a list, the length of the list should equal to the number of traits.highlight.col, highlight.cex, highlight.pch can be value or vector, if its length equals to the length of highlighted SNPs,each SNPs have its special colour, size and shape.注意：'highlight'可以是vector或list，如果是vector，所有traits会使用相同的高亮SNP索引，如果是list，list的长度应该等于traits.highlight.col的数量， highlight.cex, highlight.pch 可以是值或向量，如果其长度等于突出显示的 SNP 的长度，则每个 SNP 都有其特殊的颜色、大小和形状。

SNPs <-  pig60K[pig60K$trait2 < 1e-4, 1]
CMplot(pig60K,type="h",plot.type="m",LOG10=TRUE,highlight=SNPs,highlight.type="p",
       highlight.col=NULL,highlight.cex=1.2,highlight.pch=19,file="jpg",memo="fff",
       dpi=300,file.output=TRUE,verbose=TRUE,width=14,height=6,band=0.6)


SNPs <-  pig60K[pig60K$trait2 < 1e-4, 1]
CMplot(pig60K,type="p",plot.type="m",LOG10=TRUE,highlight=SNPs,highlight.type="h",
       col=c("grey30","grey60"),highlight.col="darkgreen",highlight.cex=1.2,highlight.pch=19,
       file="jpg",memo="dddk",dpi=300,file.output=TRUE,verbose=TRUE,width=14,height=6)

#### 3.1.32.5 Visualize only oOne Chromosome ####
CMplot(pig60K[pig60K$Chromosome==13, ], plot.type="m",LOG10=TRUE,col=c("grey60"),highlight=SNPs,
       highlight.col="green",highlight.cex=1,highlight.pch=19,file="jpg",memo="kk", 
       threshold=c(1e-6,1e-4),threshold.lty=c(1,2),threshold.lwd=c(1,2), width=9,height=6,
       threshold.col=c("red","blue"),amplify=FALSE,dpi=300,file.output=TRUE,verbose=TRUE)

#### 3.1.32.6 Add Genes or SNP Names around the Highlighted SNPs ####
SNPs <- pig60K[pig60K[,5] < (0.05 / nrow(pig60K)), 1]
genes <- paste("GENE", 1:length(SNPs), sep="_")
set.seed(666666)
CMplot(pig60K[,c(1:3,5)], plot.type="m",LOG10=TRUE,col=c("grey30","grey60"),highlight=SNPs,
       highlight.col=c("red","blue","green"),highlight.cex=1,highlight.pch=c(15:17), highlight.text=genes,      
       highlight.text.col=c("red","blue","green"),threshold=0.05/nrow(pig60K),threshold.lty=2,   
       amplify=FALSE,file="jpg",memo="",dpi=300,file.output=TRUE,verbose=TRUE,width=14,height=6)
#Note:'highlight', 'highlight.text', 'highlight.text.xadj', 'highlight.text.yadj'could be vector or list, if it is a vector, all traits will use the same highlighted SNPs index and text, if it is a list, the length of the list should equal to the number of traits.the order of 'highlight.text' must be consistent with 'highlight'highlight.text.cex: value or vecter, control the size of added texthighlight.text.font: value or vecter, control the font of added text highlight.text.xadj: value or vecter or list for multiple traits, -1, 0, 1 limited, control the position of text around the highlighted SNPs,-1(left), 0(center), 1(right)highlight.text.yadj: value or vector or list for multiple traits, same as above, -1(down), 0(center), 1(up)注意：'highlight', 'highlight.text', 'highlight.text.xadj', 'highlight.text.yadj'可以是向量或列表，如果是向量，所有特征将使用相同的高亮SNP索引和文本 , 如果是列表，则列表的长度应等于traits的数量。 'highlight.text'的顺序必须与'highlight'highlight.text.cex: value或vecter一致，控制添加的大小 texthighlight.text.font：value 或vecter，控制添加文本的字体highlight.text.xadj：多个特征的value 或vecter 或list，-1, 0, 1 限制，控制文本在突出显示的SNP 周围的位置，- 1(left), 0(center), 1(right)highlight.text.yadj: 多个特征的值或向量或列表，同上，-1(down), 0(center), 1(up)

#### 3.1.32.7 Genomic ####
CMplot(cattle50K, plot.type="m", band=0.5, LOG10=FALSE, ylab="SNP effect",threshold=0.015,
       threshold.lty=2, threshold.lwd=1, threshold.col="red", amplify=TRUE, width=14,height=6,
       signal.col=NULL, chr.den.col=NULL, file="jpg",memo="nn",dpi=300,file.output=TRUE,
       verbose=TRUE,cex=0.8)
#Note: if signal.col=NULL, the significant SNPs will be plotted with original colors.

cattle50K[,4:ncol(cattle50K)] <- apply(cattle50K[,4:ncol(cattle50K)], 2, 
                                       function(x) x*sample(c(1,-1), length(x), rep=TRUE))
CMplot(cattle50K, type="h",plot.type="m", band=0.5, LOG10=FALSE, ylab="SNP effect",ylim=c(-0.02,0.02),
       threshold.lty=2, threshold.lwd=1, threshold.col="red", amplify=FALSE,cex=0.6,
       chr.den.col=NULL, file="jpg",memo="pp",dpi=300,file.output=TRUE,verbose=TRUE)

#### 3.1.33 Multi_tracks Rectangular-Manhattan Plot ####
SNPs <- list(
  pig60K$SNP[pig60K$trait1<1e-6],
  pig60K$SNP[pig60K$trait2<1e-6],
  pig60K$SNP[pig60K$trait3<1e-6]
)
CMplot(pig60K, plot.type="m",multracks=TRUE,threshold=c(1e-6,1e-4),threshold.lty=c(1,2), 
       threshold.lwd=c(1,1), threshold.col=c("black","grey"), amplify=TRUE,bin.size=1e6,
       chr.den.col=c("darkgreen", "yellow", "red"), signal.col=c("red","green","blue"),
       signal.cex=1, file="jpg",memo="ww",dpi=300,file.output=TRUE,verbose=TRUE,
       highlight=SNPs, highlight.text=SNPs, highlight.text.cex=1.4)
#Note: if you are not supposed to change the color of signal, please set signal.col=NULL and highlight.col=NULL.

#### 3.1.33.1 a. All Traits in One Axes ####
#### 3.1.33.2 b. All Traits in Separated Axes:####

#### 3.1.34 Single_track Q-Q Plot ####
CMplot(pig60K,plot.type="q",box=FALSE,file="jpg",memo="ee",dpi=300,
       conf.int=TRUE,conf.int.col=NULL,threshold.col="red",threshold.lty=2,
       file.output=TRUE,verbose=TRUE,width=5,height=5)

#### 3.1.35 Multi_tracks Q-Q plot ####
pig60K$trait1[sample(1:nrow(pig60K), round(nrow(pig60K)*0.80))] <- NA
pig60K$trait2[sample(1:nrow(pig60K), round(nrow(pig60K)*0.25))] <- NA
CMplot(pig60K,plot.type="q",col=c("dodgerblue1", "olivedrab3", "darkgoldenrod1"),threshold=1e-6,
       ylab.pos=2,signal.pch=c(19,6,4),signal.cex=1.2,signal.col="red",conf.int=TRUE,box=FALSE,multracks=
         TRUE,cex.axis=2,file="jpg",memo="k",dpi=300,file.output=TRUE,verbose=TRUE,ylim=c(0,8),width=5,height=5)

#### 3.1.35.1 a. All Traits in a Axes ####
#### 3.1.35.2 b. all traits in separated axes:####
#Note: Positive and negative values are acceptable.
