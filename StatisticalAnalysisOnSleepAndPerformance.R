library(data.table)
student_data<-fread("student_mental_health.csv") #fread is used to read csv faster
library(ggplot2)
library(DescTools)

student_sleep<-student_data$sleep_hours
student_perform<-student_data$academic_performance

#QUESTION A-----------------------------------
#mean
sleep_mean<-mean(student_sleep)
print(sleep_mean)

perform_mean<-mean(student_perform)
print(perform_mean)

#median
sleep_median<-median(student_sleep)
print(sleep_median)

perform_median<-median(student_perform)
print(perform_median)

#mode

get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

sleep_mode<-get_mode(student_sleep)
print(sleep_mode)

perform_mode<-get_mode(student_perform)
print(perform_mode)

#standard deviation
sleep_sd<-sd(student_sleep)
print(sleep_sd)

perform_sd<-sd(student_perform)
print(perform_sd)

#variance
sleep_var<-var(student_sleep)
print(sleep_var)

perform_var<-var(student_perform)
print(perform_var)

#range
range(student_sleep, na.rm = FALSE, finite = FALSE)
range(student_perform, na.rm = FALSE, finite = FALSE)

#quartiles
sleep_quart<-quantile(student_sleep)
print(sleep_quart)

perform_quart<-quantile(student_perform)
print(perform_quart)

#IQR
sleep_iqr<-IQR(student_sleep)
print(sleep_iqr)
perform_iqr<- IQR(student_perform)
print(perform_iqr)

#CV
sleep_cv<-(sleep_sd/sleep_mean)*100
print(sleep_cv)

perform_cv<-(perform_sd/perform_mean)*100
print(perform_cv)


#graphs
sleep_boxplot<-boxplot(student_data$sleep_hours, main="Boxplot of Sleeping Hours",col="pink")
perform_boxplot<-boxplot(student_data$academic_performance, main="Boxplot of Academic Performance", col="lightblue")

sleep_hist<-hist(student_data$sleep_hours, main="Histogram Of Sleeping Hours", xlab="Hours Of Sleep", col="pink")
perform_hist<-hist(student_data$academic_performance, main="Histogram Of Academic Performance", xlab="Academic Score", col="lightblue")

#QUESTION B---------------------------------------------------
#variable= academic performance

mu<-mean(student_perform)
sigma<- sd(student_perform)

#empirical rule

lower_68<-mu-sigma
upper_68<-mu+sigma
prop_68<-mean(student_perform>=lower_68 & student_perform<=upper_68,na.rm=TRUE)
cat("68% of students scores between", lower_68 , " and", upper_68, " \n")

lower_95<-mu-2*sigma
upper_95<-mu+2*sigma
prop_95<-mean(student_perform>=lower_95 & student_perform<=upper_95,na.rm=TRUE)
cat("95% of students scores between", lower_95 , " and", upper_95, " \n")


lower_997<-mu-3*sigma
upper_997<-mu+3*sigma
prop_997<-mean(student_perform>=lower_997 & student_perform<=upper_997,na.rm=TRUE)
cat("99.7% of students scores between", lower_997 , " and", upper_997, " \n")



perform_qqplot<-qqnorm(student_data$academic_performance, main="QQPlot Of Academic Performance", col="lightblue", ylab="Academic Scores")
qqline(student_data$academic_performance, col = "darkblue", lwd = 2)
shapiro.test(sample(student_data$academic_performance))

#QUESTION C------------------------------------------



df<-data.frame(x=student_perform, y=student_sleep)
ggplot(df, aes(x=x,y=y))+geom_point(col="pink",size=0.5)+geom_smooth(method="lm",se=FALSE, col="red")+labs(title="Relationship Between Sleeping Hours and Academic Performance", x="Academic Performance",y="Sleeping Hours")

#pearson 
#1 calculate sums of square
Sxx<-sum((student_perform-mean(student_perform))^2)
Syy<-sum((student_sleep-mean(student_perform))^2)
Sxy<-sum((student_perform-mean(student_perform))*(student_sleep-mean(student_sleep)))
cat("")
#2 calculate Pearson correlation coefficient (r)
r<-Sxy/sqrt(Sxx*Syy)

#3 coefficient of determination
r_squared<-format(r^2,scientific=FALSE)


Sxx;Syy;Sxy;r;r_squared


