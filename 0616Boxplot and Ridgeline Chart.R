#### 2.4 Boxplot ####
  #Boxplots are a commonly used chart that compares a distribution of several groups. However, you should keep in mind that data distribution is hidden behind each box. For instance, a normal distribution could look exactly the same as a bimodal distribution. Please read more explanation on this matter, and consider a violin plot or a ridgline chart instead.箱线图是一种常用的图表，用于比较多个组的分布。 但是，您应该记住，数据分布隐藏在每个盒子后面。 例如，正态分布可能看起来与双峰分布完全相同。 请阅读有关此问题的更多解释，并考虑使用小提琴图或脊线图。

#### 2.4.0.1 Boxplot with Individual Data Points ####

# Libraries
library(tidyverse)
library(hrbrthemes)
library(viridis)

# create a dataset
data <- data.frame(
  name=c( rep("A",500), rep("B",500), rep("B",500), rep("C",20), rep('D', 100)  ),
  value=c( rnorm(500, 10, 5), rnorm(500, 13, 1), rnorm(500, 18, 1), rnorm(20, 25, 4), rnorm(100, 12, 1) )
)

# Plot
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.7) + #同时添加散点
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("A boxplot with jitter") +
  xlab("")

# Boxplot basic
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="C") + #A character string indicating the colormap option to use. Four options are available: "magma" (or "A"), "inferno" (or "B"), "plasma" (or "C"), "viridis" (or "D", the default option) and "cividis" (or "E").指示要使用的颜色图选项的字符串。 有四个选项可用：“岩浆”（或“A”）、“地狱”（或“B”）、“等离子”（或“C”）、“绿色”（或“D”，默认选项）和“ cividis”（或“E”）。
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Basic boxplot") +
  xlab("")

# Violin basic
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")

#### 2.4.1 Ggplot2 ####
  #Boxplot are built thanks to the geom_boxplot() geom of ggplot2. See its basic usage on the first example below. Note that reordering groups is an important step to get a more insightful figure. Also, showing individual data points with jittering is a good way to avoid hiding the underlying distribution.Boxplot 的构建归功于 ggplot2 的 geom_boxplot() geom。 在下面的第一个示例中查看其基本用法。 请注意，重新排序组是获得更有洞察力的数字的重要步骤。 此外，显示带有抖动的单个数据点是避免隐藏底层分布的好方法。

#### 2.4.1.1 Basic Ggplot2 Boxplot ####
  #The ggplot2 library allows to make a boxplot using geom_boxplot(). You have to specify a quantitative variable for the Y axis, and a qualitative variable for the X axis ( a group).ggplot2 库允许使用 geom_boxplot() 制作箱线图。 您必须为 Y 轴指定一个定量变量，并为 X 轴（一组）指定一个定性变量。

# Load ggplot2
library(ggplot2)

# The mtcars dataset is natively available
# head(mtcars)

# A really basic boxplot.
?mtcars
head(mtcars)
ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + 
  geom_boxplot(fill="slateblue", alpha=0.2) + 
  xlab("cyl")

#### 2.4.2 Ggplot2 Boxplot Parameters ####
  #此图表扩展了图表 #262 中描述的先前最基本的箱线图。 它描述了可以应用于 geom_boxplot() 函数以自定义常规图表外观的选项。Note on notches: useful to compare groups: if no overlap between 2 groups, medians are significantly different.对比较组很有用：如果两组之间没有重叠，则中位数有显着差异。
# Load ggplot2
library(ggplot2)

# The mpg dataset is natively available
#head(mpg)

# geom_boxplot proposes several arguments to custom appearance
ggplot(mpg, aes(x=class, y=hwy)) + 
  geom_boxplot(
    # custom boxes
    color="blue",
    fill="blue",
    alpha=0.2,
    # Notch?
    notch=TRUE, #凹槽，中位数的置信区用凹槽表示
    notchwidth = 0.8,
    # custom outliers
    outlier.colour="red",
    outlier.fill="red",
    outlier.size=3
  )
#compare
ggplot(mpg, aes(x=class, y=hwy)) + 
  +   geom_boxplot()

#### 2.4.3 Control ggplot2 Boxplot Colors ####
  #A boxplot summarizes the distribution of a continuous variable. Different color scales can be apply to it, and this section describes how to do so using the ggplot2 library. It is notably described how to highlight a specific group of interest.箱线图总结了连续变量的分布。 可以对其应用不同的色阶，本节介绍如何使用 ggplot2 库来实现。 它特别描述了如何突出特定的兴趣组。

#### 2.4.3.1 General Color Customization 通用颜色自定义####
# library
library(ggplot2)

# The mtcars dataset is natively available in R
#head(mpg)

# Top Left: Set a unique color with fill, colour, and alpha
ggplot(mpg, aes(x=class, y=hwy)) + 
  geom_boxplot(color="red", fill="orange", alpha=0.2)

# Top Right: Set a different color for each group
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")
# Bottom Left
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none") +
  scale_fill_brewer(palette="BuPu")
?scale_fill_brewer #Sequential, diverging and qualitative colour scales from colorbrewer.org

# Bottom Right
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none") +
  scale_fill_brewer(palette="Dark2")

#### 2.4.4 Highlighting a Group ####
  # If your story focuses on a specific group, you should highlight it in your boxplot.
# Libraries
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# Work with the natively available mpg dataset
mpg %>% 
  # Add a column called 'type': do we want to highlight the group or not?
  mutate( type=ifelse(class=="subcompact","Highlighted","Normal")) %>%
  # Build the boxplot. In the 'fill' argument, give this column
  ggplot( aes(x=class, y=hwy, fill=type, alpha=type)) + #alpha=type这里把subcompact标记出来了，但是它影响的是其他的上色的透明度
  geom_boxplot() +
  scale_fill_manual(values=c("#69b3a2", "grey")) +
  scale_alpha_manual(values=c(1,0.1)) +
  theme_ipsum() +
  theme(legend.position = "none") +
  xlab("")

#具体
mpg %>% 
  # Add a column called 'type': do we want to highlight the group or not?
  mutate( type=ifelse(class=="subcompact","Highlighted","Normal"))

#### 2.4.5 Grouped Boxplot ####
  #分组箱线图是一种箱线图，其中类别以组和子组的形式进行组织。在这里，我们可视化了 7 个组（称为 A 到 G）和 2 个子组（称为低和高）的分布。 请注意，必须在 ggplot2 的 X 参数中调用该组。 在填充参数中调用子组。
# library
library(ggplot2)

# create a data frame
LETTERS
variety=rep(LETTERS[1:7], each=40)
treatment=rep(c("high","low"),each=20)
note=seq(1:280)+sample(1:150, 280, replace=T)
data=data.frame(variety, treatment ,  note)

# grouped boxplot
ggplot(data, aes(x=variety, y=note, fill=treatment)) +  #treatment是分组
  geom_boxplot()

#### 2.4.6 Using Small Multiple ####

# One box per treatment
p1 <- ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot() +
  facet_wrap(~treatment)
p1
# one box per variety
p2 <- ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot() +
  facet_wrap(~variety, scale="free")
p2

#### 2.4.7 Ggplot2 Boxplot with Variable Width ####
  #箱线图隐藏了类别样本大小。 解决此问题的一种方法是构建宽度与样本大小成正比的箱线图。 以下是如何使用 R 和 ggplot2 进行操作。 箱线图经常因隐藏每个类别的潜在分布而受到批评。 由于单个数据点是隐藏的，因此也不可能知道每个类别可用的样本大小。在此示例中，由于 varwidth 选项，框宽度与样本大小成正比。 最重要的是，精确的样本大小被添加到 X 轴标签以获得更高的准确性。

# library
library(ggplot2)

# create data
names <- c(rep("A", 20) , rep("B", 5) , rep("C", 30), rep("D", 100))
value <- c( sample(2:5, 20 , replace=T) , sample(4:10, 5 , replace=T), sample(1:7, 30 , replace=T), sample(3:8, 100 , replace=T) )
data <- data.frame(names,value)

# prepare a special xlab with the number of obs for each group
my_xlab <- paste(levels(data$names),"\n(N=",table(data$names),")",sep="")

my_xlab
# plot
ggplot(data, aes(x=names, y=value, fill=names)) +
  geom_boxplot(varwidth = TRUE, alpha=0.2) +
  theme(legend.position="none") +
  scale_x_discrete(labels=my_xlab) #把数据量加进去

#### 2.4.8 Ggplot2 Boxplot from Continuous Variable ####
  #假设我们要研究 2 个数值变量之间的关系。 可以在不同的 bin 中剪切它们，并使用创建的组来构建箱线图。在这里，由于 cut_width 函数，来自钻石数据集的称为 carat 的数值变量被切割成 0.5 个长度的 bin。 然后，我们只需要将新创建的变量提供给 ggplot2 的 X 轴。
# library
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# Start with the diamonds dataset, natively available in R:
p <- diamonds %>%
  # Add a new column called 'bin': cut the initial 'carat' in bins
  mutate( bin=cut_width(carat, width=0.5, boundary=0) ) %>%
  # plot
  ggplot( aes(x=bin, y=price) ) +
  geom_boxplot(fill="#69b3a2") +
  theme_ipsum() +
  xlab("Carat")
p

#### 2.4.9 Ggplot2 Boxplot with Mean Value ####
  #Ggplot2 allows to show the average value of each group using the stat_summary() function. No more need to calculate your mean values before plotting.Ggplot2 允许使用 stat_summary() 函数显示每个组的平均值。 在绘图之前不再需要计算平均值。
# Library
library(ggplot2)

# create data
names=c(rep("A", 20) , rep("B", 8) , rep("C", 30), rep("D", 80))
value=c( sample(2:5, 20 , replace=T) , sample(4:10, 8 , replace=T), sample(1:7, 30 , replace=T), sample(3:8, 80 , replace=T) )
data=data.frame(names,value)

# plot
p <- ggplot(data, aes(x=names, y=value, fill=names)) +
  geom_boxplot(alpha=0.7) +
  stat_summary(fun=mean, geom="point", shape=20, size=14, color="red", fill="red") +
  theme(legend.position="none") +
  scale_fill_brewer(palette="Set1")
p

#### 2.4.10 Basic R ####
  #Build boxplot with base R is totally double thanks to the boxplot() function. A boxplot summarizes the distribution of a numeric variable for one or several groups. It can be useful to add colors to specific groups to highlight them. For example, positive and negative controls are likely to be in different colors.由于 boxplot() 函数，使用基础 R 构建箱线图完全翻倍。 箱线图总结了一个或多个组的数值变量的分布。 将颜色添加到特定组以突出显示它们会很有用。 例如，阳性和阴性对照可能采用不同的颜色。

#Create data
names <- c(rep("Maestro", 20) , rep("Presto", 20) , 
           rep("Nerak", 20), rep("Eskimo", 20), rep("Nairobi", 20), rep("Artiko", 20))
value <- c(  sample(3:10, 20 , replace=T) , sample(2:5, 20 , replace=T) , 
             sample(6:10, 20 , replace=T), sample(6:10, 20 , replace=T) , 
             sample(1:7, 20 , replace=T), sample(3:10, 20 , replace=T) )
data <- data.frame(names,value)

# Prepare a vector of colors with specific color for Nairobi and Eskimo
myColors <- ifelse(levels(data$names)=="Nairobi" , rgb(0.1,0.1,0.7,0.5) , 
                   ifelse(levels(data$names)=="Eskimo", rgb(0.8,0.1,0.3,0.6),
                          "grey90" ) )

# Build the plot
boxplot(data$value ~ data$names , 
        col=myColors , 
        ylab="disease" , xlab="- variety -")

# Add a legend
legend("bottomleft", legend = c("Positiv control","Negativ control") , 
       col = c(rgb(0.1,0.1,0.7,0.5) , rgb(0.8,0.1,0.3,0.6)) , bty = "n", pch=20 , pt.cex = 3, cex = 1, horiz = FALSE, inset = c(0.03, 0.1))

#### 2.4.11 Basic R: X Axis Labels on Several Lines ####
  #通常的做法是在多行上显示 X 轴标签。 这是一个应用于箱线图的示例。在多行上显示 X 轴标签会很方便。 例如，要添加箱线图的每个框中存在的值的数量。
  #使用 names() 函数更改类别的名称。使用 \n 开始新行。
# Create 2 vectors
a <- sample(2:24, 20 , replace=T)
b <- sample(4:14, 8 , replace=T)

# Make a list of these 2 vectors
C <- list(a,b)

# Change the names of the elements of the list :
names(C) <- c(paste("Category 1\n n=" , length(a) , sep=""), paste("Category 2\n n=" , length(b) , sep=""))
C

# Change the mgp argument: avoid text overlaps axis
par(mgp=c(3,2,0)) #使用 par() 函数的 mgp 参数增加标签和 X 轴之间的距离。 它避免与轴重叠。注意：mgp 是长度为 3 的数值向量，它设置相对于内部绘图窗口边缘的轴标签位置。 默认值：c(3,1,0)。 第一个值：定位标签（图中的 xlab 和 ylab）。 第二个值：刻度线标签的位置（我们想要降低的位置）。 第三个值：刻度线的位置

# Final Boxplot
boxplot(C , col="#69b3a2" , ylab="value" )

#### 2.4.12 Boxplot with Jitter in Base R ####
  #Boxplot hides the distribution behind each group. This section show how to tackle this issue in base R, adding individual observation using dots with jittering. Boxplot can be dangerous: the exact distribution of each group is hidden behind boxes as explained in data-to-viz.If the amount of observation is not too high, you can add individual observations on top of boxes, using jittering to avoid dot overlap.In base R, it is done manually creating a function that adds dot one by one, computing a random X position for all of them.箱线图隐藏了每个组后面的分布。 本节展示了如何在基础 R 中解决这个问题，使用带有抖动的点添加单独的观察。 Boxplot 可能很危险：每个组的确切分布隐藏在框后面，如 data-to-viz 中所述。如果观察量不太高，您可以在框顶部添加单独的观察，使用抖动来避免点重叠 . 在基础 R 中，它是手动创建一个函数，该函数一个一个地添加点，为所有点计算随机 X 位置。
#install.packages("formatR")
library(formatR)
# Create data
names <- c(rep("A", 80) , rep("B", 50) , rep("C", 70))
value <- c( rnorm(80 , mean=10 , sd=9) , rnorm(50 , mean=2 , sd=15) , rnorm(70 , mean=30 , sd=10) )
data <- data.frame(names,value)

# Basic boxplot
boxplot(data$value ~ data$names , col=terrain.colors(4))

# Add data points
class(data$names)
data$names <- as.factor(data$names)
?levels
mylevels <- levels(data$names) #levels这里就是把不同种类的factor列出来
levelProportions <- summary(data$names)/nrow(data)
nrow(data)
summary(data$names)
levelProportions

for(i in 1:length(mylevels)){
  thislevel <- mylevels[i]
  thisvalues <- data[data$names==thislevel, "value"]
  # take the x-axis indices and add a jitter, proportional to the N in each level
  myjitter <- jitter(rep(i, length(thisvalues)), amount=levelProportions[i]/2)
  points(myjitter, thisvalues, pch=20, col=rgb(0,0,0,.9)) 
}
?jitter # jitter 会在X和Y两个方向增加随机的扰动来防止对象之间的覆盖。

#### 2.4.13 Ordering Boxplots in Base R ####
  #This section is dedicated to boxplot ordering in base R. It describes 3 common use cases of reordering issue with code and explanation.本节专门介绍基础 R 中的箱线图排序。它描述了重新排序问题的 3 个常见用例以及代码和解释。

#### 2.4.13.1 Reordering Category by Median ####
  #The most common need is to reorder categories by increasing median. It allows to quickly spot what group has the highest value and how categories are ranked. It is accomplished using the reorder() function in combination with the with() function as suggested below:最常见的需求是通过增加中位数来重新排序类别。 它允许快速发现具有最高价值的组以及类别的排名方式。 它是使用 reorder() 函数结合 with() 函数来完成的，如下所示：
# Create data : 7 varieties / 20 samples per variety / a numeric value for each sample
variety <- rep( c("soldur", "silur", "lloyd", "pescadou", "X4582", "Dudur", "Classic"), each=20)
note <- c( sample(2:5, 20 , replace=T) , sample(6:10, 20 , replace=T),
           sample(1:7, 30 , replace=T), sample(3:10, 70 , replace=T) )
data <- data.frame(variety, note)

# Create a vector named "new_order" containing the desired order
new_order <- with(data, reorder(variety , note, median , na.rm=T))

# Draw the boxplot using this new order
boxplot(data$note ~ new_order , ylab="sickness" , col="#69b3a2", boxwex=0.4 , main="")

#### 2.4.14 Give a Specific Order ####
  #Boxplot categories are provided in a column of the input data frame. This column needs to be a factor, and has several levels. Categories are displayed on the chart following the order of this factor, often in alphabetical order.Sometimes, we need to show groups in a specific order (A,D,C,B here). This can be done by reordering the levels, using the factor() function.箱线图类别在输入数据框的一列中提供。 此列需要是一个因子，并且有多个级别。 类别按照该因素的顺序显示在图表上，通常按字母顺序排列。有时，我们需要按特定顺序显示组（此处为 A、D、C、B）。 这可以通过使用 factor() 函数重新排序级别来完成。
#Creating data 
names <- c(rep("A", 20) , rep("B", 20) , rep("C", 20), rep("D", 20))
value <- c( sample(2:5, 20 , replace=T) , sample(6:10, 20 , replace=T), 
            sample(1:7, 20 , replace=T), sample(3:10, 20 , replace=T) )
data <- data.frame(names,value)

# Classic boxplot (A-B-C-D order)
# boxplot(data$value ~ data$names)

# I reorder the groups order : I change the order of the factor data$names
data$names <- factor(data$names , levels=c("A", "D", "C", "B")) #指定有哪些levels

#The plot is now ordered !
boxplot(data$value ~ data$names , col=rgb(0.3,0.5,0.4,0.6) , ylab="value" , 
        xlab="names in desired order")

#### 2.4.15 Grouped and Ordered Boxplot ####
  #In a grouped boxplot, categories are organized in groups and subgroups. For instance, let’s take several varieties (group) that are grown in high or low temperature (subgroup).Here both subgroups are represented one beside each other, and groups are ranked by increasing median:在分组箱线图中，类别按组和子组进行组织。 例如，让我们以在高温或低温下生长的几个品种（组）（子组）为例。 这里两个子组彼此并排表示，并通过增加中位数对组进行排名：
# Create dummy data
variety <- rep( c("soldur", "silur", "lloyd", "pescadou", "X4582", "Dudur", "Classic"), each=40)
treatment <- rep(c(rep("high" , 20) , rep("low" , 20)) , 7)
note <- c( rep(c(sample(0:4, 20 , replace=T) , sample(1:6, 20 , replace=T)),2), 
           rep(c(sample(5:7, 20 , replace=T), sample(5:9, 20 , replace=T)),2), 
           c(sample(0:4, 20 , replace=T) , sample(2:5, 20 , replace=T), 
             rep(c(sample(6:8, 20 , replace=T) , sample(7:10, 20 , replace=T)),2) ))
data=data.frame(variety, treatment ,  note)
table(data)

# Reorder varieties (group) (mixing low and high treatments for the calculations)
new_order <- with(data, reorder(variety , note, mean , na.rm=T))
new_order
# Then I make the boxplot, asking to use the 2 factors : variety (in the good order) AND treatment :
par(mar=c(3,4,3,1))
myplot <- boxplot(note ~ treatment*new_order , data=data  , 
                  boxwex=0.4 , ylab="sickness",
                  main="sickness of several wheat lines" , 
                  col=c("slateblue1" , "tomato") ,  
                  xaxt="n")

# To add the label of x axis
my_names <- sapply(strsplit(myplot$names , '\\.') , function(x) x[[2]] )
?sapply #sapply 是一个用户友好的版本和 lapply 的包装器，默认情况下返回一个向量、矩阵，或者，如果 simple = "array"，如果合适，通过应用simple2array()返回一个数组。 sapply(x, f,simple = FALSE, USE.NAMES = FALSE) 与 lapply(x, f) 相同。
my_names <- my_names[seq(1 , length(my_names) , 2)]
my_names
axis(1, 
     at = seq(1.5 , 14 , 2), 
     labels = my_names , 
     tick=FALSE , cex=0.3)
?axis #Adds an axis to the current plot, allowing the specification of the side, position, labels, and other options.
# Add the grey vertical lines
for(i in seq(0.5 , 20 , 2)){ 
  abline(v=i,lty=1, col="grey")
}

# Add a legend
legend("bottomright", legend = c("High treatment", "Low treatment"), 
       col=c("slateblue1" , "tomato"),
       pch = 15, bty = "n", pt.cex = 3, cex = 1.2,  horiz = F, inset = c(0.1, 0.1))

#### 2.4.16 Add Text over Boxplot in Base R ####
  #This examples demonstrates how to build a boxplot with sample size written on top of each box. It is useful to indicate what sample size is hidden behind each box. Basic R implementation.The first challenge here is to recover the position of the top part of each box. This is done by saving the boxplot() result in an object (called boundaries here). Now, typing boundaries$stats gives a dataframe with all information concerning boxes.Then, it is possible to use the text function to add labels on top of each box. This function takes 3 inputs:x axis positions of the labels. In our case, it will be 1,2,3,4 for 4 boxes.y axis positions, available in the boundaries$stats object.text of the labels : the number of value per group or whatever else.此示例演示了如何构建一个箱线图，每个箱体的顶部都写有样本大小。 指明隐藏在每个框后面的样本大小很有用。 基本的 R 实现。这里的第一个挑战是恢复每个盒子顶部的位置。 这是通过将 boxplot() 结果保存在一个对象（此处称为边界）中来完成的。 现在，输入 bounds$stats 会给出一个包含所有关于框的信息的数据框。然后，可以使用文本功能在每个框的顶部添加标签。 此函数需要 3 个输入：标签的 x 轴位置。 在我们的例子中，对于 4 个盒子，它将是 1,2,3,4.y 轴位置，在 bounds$stats 对象中可用。标签文本：每组或其他任何值的数量。
# Dummy data
names <- c(rep("A", 20) , rep("B", 8) , rep("C", 30), rep("D", 80))
value <- c( sample(2:5, 20 , replace=T) , sample(4:10, 8 , replace=T), 
            sample(1:7, 30 , replace=T), sample(3:8, 80 , replace=T) )
data <- data.frame(names,value)

# Draw the boxplot. Note result is also stored in a object called boundaries
boundaries <- boxplot(data$value ~ data$names , col="#69b3a2" , ylim=c(1,11))
# Now you can type boundaries$stats to get the boundaries of the boxes

# Add sample size on top
nbGroup <- nlevels(data$names)
text( 
  x=c(1:nbGroup), 
  y=boundaries$stats[nrow(boundaries$stats),] + 0.5, 
  paste("n = ",table(data$names),sep="")  
)

#### 2.4.17 Tukey Test and Boxplot in R ####
  #A Tukey test compares all possible pair of means for a set of categories. This section explains how to perform it in R and host to represent the result on a boxplot.Tukey test is a single-step multiple comparison procedure and statistical test. It is a section-hoc analysis, what means that it is used in conjunction with an ANOVA. It allows to find means of a factor that are significantly different from each other, comparing all possible pairs of means with a t-test like method. (Read more for the exact procedure) In R, the multcompView allows to run the Tukey test thanks to the TukeyHSD() function. It also offers a chart that shows the mean difference for each pair of group.Tukey 检验比较一组类别的所有可能的均值对。 本节说明如何在 R 和主机中执行它以在箱线图上表示结果。Tukey 检验是单步多重比较过程和统计检验。 这是一个部分 hoc 分析，这意味着它与 ANOVA 结合使用。 它允许找到彼此显着不同的因子的均值，将所有可能的均值对与类似 t 检验的方法进行比较。 （详细过程请阅读）在 R 中，由于 TukeyHSD() 函数，multcompView 允许运行 Tukey 测试。 它还提供了一个图表，显示每对组的平均差异。

# library
#install.packages("multcompView")
library(multcompView)

# Create data
set.seed(1)
treatment <- rep(c("A", "B", "C", "D", "E"), each=20) 
value=c( sample(2:5, 20 , replace=T) , sample(6:10, 20 , replace=T), sample(1:7, 20 , replace=T), sample(3:10, 20 , replace=T) , sample(10:20, 20 , replace=T) )
data=data.frame(treatment,value)

# What is the effect of the treatment on the value ?
model=lm( data$value ~ data$treatment )
ANOVA=aov(model)


# Tukey test to study each pair of treatment :
TUKEY <- TukeyHSD(x=ANOVA, 'data$treatment', conf.level=0.95)

# Tuckey test representation :
plot(TUKEY , las=1 , col="brown")

#### 2.4.18 Tukey test result on top of boxplot ####
  #The previous chart showed no significant difference between groups A and C, and between D and B.It is possible to represent this information in a boxplot. Group A and C are represented using a similar way: same color, and same ‘b’ letter on top. And so on for B-D and for E.Tukey test results on top of Bhart showed no significant difference between groups A and C, and between D and B.It is possible to represent this information in a boxplot. Group A and C are represented using a similar way: same color, and same ‘b’ letter on top. And so on for B-D and for E.之前的图表显示 A 组和 C 组之间以及 D 组和 B 组之间没有显着差异。可以在箱线图中表示此信息。 A 组和 C 组使用类似的方式表示：相同的颜色，顶部相同的“b”字母。 对于 B-D 和 E，依此类推。Bhart 上的 Tukey 测试结果显示 A 组和 C 组之间以及 D 组和 B 组之间没有显着差异。可以在箱线图中表示此信息。 A 组和 C 组使用类似的方式表示：相同的颜色，顶部相同的“b”字母。 对于 B-D 和 E，依此类推。

# I need to group the treatments that are not different each other together.
generate_label_df <- function(TUKEY, variable){
  
  # Extract labels and factor levels from Tukey section-hoc 
  Tukey.levels <- TUKEY[[variable]][,4]
  Tukey.labels <- data.frame(multcompLetters(Tukey.levels)['Letters'])
  
  #I need to put the labels in the same order as in the boxplot :
  Tukey.labels$treatment=rownames(Tukey.labels)
  Tukey.labels=Tukey.labels[order(Tukey.labels$treatment) , ]
  return(Tukey.labels)
}

# Apply the function on my dataset
LABELS <- generate_label_df(TUKEY , "data$treatment")


# A panel of colors to draw each group with the same color :
my_colors <- c( 
  rgb(143,199,74,maxColorValue = 255),
  rgb(242,104,34,maxColorValue = 255), 
  rgb(111,145,202,maxColorValue = 255)
)

# Draw the basic boxplot
a <- boxplot(data$value ~ data$treatment , ylim=c(min(data$value) , 1.1*max(data$value)) , col=my_colors[as.numeric(LABELS[,1])] , ylab="value" , main="")

# I want to write the letter over each box. Over is how high I want to write it.
over <- 0.1*max( a$stats[nrow(a$stats),] )

  #Note: Tukey test is also called: Tukey’s range test / Tukey method / Tukey’s honest significance test / Tukey’s HSD (honest significant difference) test / Tukey-Kramer method注：Tukey 检验也称为：Tukey's range test / Tukey method / Tukey's诚实显着性检验 / Tukey's HSD（诚实显着差异）检验 / Tukey-Kramer 方法

#### 2.4.19 Control Box Type with the bty Option ####
  #The bty option of the par() function allows to control the box style of base R charts. This section provides a few examples illustrating how this option works.The bty option of the par() function allows to custom the box around the plot.Several letters are possible. Shape of the letter represents the boundaries:par() 函数的 bty 选项允许控制基本 R 图表的框样式。 本节提供了几个示例来说明此选项的工作原理。 par() 函数的 bty 选项允许自定义绘图周围的框。几个字母是可能的。 字母的形状代表边界：
    #o: complete box (default parameter)完整框（默认参数）,
    #n: no box无框
    #7: top + right顶部+右侧
    #L: bottom + left底部+左侧
    #C: top + left + bottom上+左+下
    #U: left + bottom + right左+下+右
# Cut the screen in 4 parts
par(mfrow=c(2,2))

#Create data
a=seq(1,29)+4*runif(29,0.4)
a
b=seq(1,29)^2+runif(29,0.98)
b
# First graph
par(bty="l")
boxplot(a , col="#69b3a2" , xlab="bottom & left box")
# Second
par(bty="o")
boxplot(b , col="#69b3a2" , xlab="complete box", horizontal=TRUE)
# Third
par(bty="c")
boxplot(a , col="#69b3a2" , xlab="up & bottom & left box", width=0.5)
# Fourth
par(bty="n")
boxplot(a , col="#69b3a2" , xlab="no box")

#### 2.4.20 Split Base R Plot Window with layout() ####
  #The layout() function of R allows to split the plot window in areas with custom sizes. Here are a few examples illustrating how to use it with reproducible code and explanation. Layout divides the device up into as many rows and columns as there are in matrix mat.Here a matrix is created with matrix(c(1,2), ncol=1) -> 1 column, 2 rows. This is what I get in the chart!R 的 layout() 函数允许在具有自定义大小的区域中拆分绘图窗口。 以下是一些示例，说明如何将其与可重现的代码和解释一起使用。 布局将设备分成与矩阵垫中一样多的行和列。这里用 matrix(c(1,2), ncol=1) -> 1 列，2 行创建了一个矩阵。 这就是我在图表中得到的！

#### 2.4.20.1 2 Rows ####
# Dummy data
a <- seq(129,1)+4*runif(129,0.4)
b <- seq(1,129)^2+runif(129,0.98)

# Create the layout
nf <- layout( matrix(c(1,2), ncol=1) )

# Fill with plots
hist(a , breaks=30 , border=F , col=rgb(0.1,0.8,0.3,0.5) , xlab="distribution of a" , main="")
boxplot(a , xlab="a" , col=rgb(0.8,0.8,0.3,0.5) , las=2)

#### 2.4.20.2 2 Columns ####
  ## Dummy data
a <- seq(129,1)+4*runif(129,0.4)
b <- seq(1,129)^2+runif(129,0.98)

# Create the layout
nf <- layout( matrix(c(1,2), ncol=2) )

# Fill with plots
hist(a , breaks=30 , border=F , col=rgb(0.1,0.8,0.3,0.5) , xlab="distribution of a" , main="")
boxplot(a , xlab="a" , col=rgb(0.8,0.8,0.3,0.5) , las=2)

#### 2.4.21 Subdivide Second Row 细分第二行####
# Dummy data
a <- seq(129,1)+4*runif(129,0.4)
b <- seq(1,129)^2+runif(129,0.98)

# Create the layout
nf <- layout( matrix(c(1,1,2,3), nrow=2, byrow=TRUE) )

# Fill with plots
hist(a , breaks=30 , border=F , col=rgb(0.1,0.8,0.3,0.5) , xlab="distribution of a" , main="")
boxplot(a , xlab="a" , col=rgb(0.8,0.8,0.3,0.5) , las=2)
boxplot(b , xlab="b" , col=rgb(0.4,0.2,0.3,0.5) , las=2)

#### 2.4.22 Custom Proportions ####
# Dummy data
a <- seq(129,1)+4*runif(129,0.4)
b <- seq(1,129)^2+runif(129,0.98)

# Set the layout
nf <- layout(
  matrix(c(1,1,2,3), ncol=2, byrow=TRUE), 
  widths=c(3,1), 
  heights=c(2,2)
)

#Add the plots
hist(a , breaks=30 , border=F , col=rgb(0.1,0.8,0.3,0.5) , xlab="distribution of a" , main="")
boxplot(a , xlab="a" , col=rgb(0.8,0.8,0.3,0.5) , las=2)
boxplot(b , xlab="b" , col=rgb(0.4,0.2,0.3,0.5) , las=2)

#### 2.5 Ridgeline Chart山脊线图 ####
  #Welcome in the ridgeline chart section of the gallery. Sometimes called joyplot, this kind of chart allows to visualize the distribution of several numeric variables, as stated in data-to-viz.com. Here are several examples implemented using R and the ridgelines R package.欢迎来到画廊的山脊线图部分。 有时称为 Joyplot，这种图表允许可视化几个数字变量的分布，如 data-to-viz.com 中所述。 以下是使用 R 和 ridgelines R 包实现的几个示例。

#### 2.5.0.1 The ggridges Package ####
#install.packages("ggridges")

#### 2.5.1 Basic Ridgeline Plot ####
# library
library(ggridges)
library(ggplot2)

# Diamonds dataset is provided by R natively
#head(diamonds)

# basic example
ggplot(diamonds, aes(x = price, y = cut, fill = cut)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none")

#### 2.5.2 Shape Variation ####
  #可以用不同的方面来表示密度。 例如，使用 stat="binline" 制作一个直方图形状来表示每个分布。
# library
library(ggridges)
library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)

# Load dataset from github
data <- read.table("https://raw.githubusercontent.com/zonination/perceptions/master/probly.csv", header=TRUE, sep=",")
data <- data %>% 
  gather(key="text", value="value") %>%
  mutate(text = gsub("\\.", " ",text)) %>%
  mutate(value = round(as.numeric(value),0)) %>%
  filter(text %in% c("Almost Certainly","Very Good Chance","We Believe","Likely","About Even", "Little Chance", "Chances Are Slight", "Almost No Chance"))

# Plot
data %>%
  mutate(text = fct_reorder(text, value)) %>%
  ggplot( aes(y=text, x=value,  fill=text)) +
  geom_density_ridges(alpha=0.6, stat="binline", bins=20) +
  theme_ridges() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  ) +
  xlab("") +
  ylab("Assigned Probability (%)")

#### 2.5.3 Color Relative to Numeric Value ####
  #It is possible to set color depending on the numeric variable instead of the categoric one. (code from the ridgeline R package by Claus O. Wilke)可以根据数字变量而不是分类变量来设置颜色。 （来自 Claus O. Wilke 的 ridgeline R 包的代码）

# library
library(ggridges)
library(ggplot2)
library(viridis)
library(hrbrthemes)

# Plot
?lincoln_weather #Weather in Lincoln, Nebraska in 2016.
ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  )


