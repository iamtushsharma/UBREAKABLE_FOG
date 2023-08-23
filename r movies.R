movies<-read.csv(file.choose(), as.strings=c(" "))
movies
head(movies)
unique(movies)
ncol(movies)
summary(movies)
head(movies,n=10)
movies[1:5, 2:5]
names(movies)


unique(movies$Genre)
      unique(movies$Film)
head(movies$Film)

movies[1:3, c("Film", "Genre")]
Film= filter(movies, Genre, ends_with("Action"))
rlang::last_error()
movies= filter(movies, Genre, ends_with("Action"))  #---ask sir

colnames(movies)=c("Film","Genre","CriticRatings","AudienceRatings","Budget","Year")
movies
head(movies)
summary(movies)
str(movies)

#---ask sir how to merge stats and movies 
#---whenever new data is given toh str and summary cmd use krlena chaiye

movies$Film=as.factor(movies$Film)
class (movies$Film)
movies$Genre=as.factor((movies$Genre))
class(movies$Genre)
movies$Year=as.factor(movies$Year)
class(movies$Year)
summary(movies)
library(ggplot2)
ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings))+geom_point()
       #----aes is used to tell are what we want on graphs so before plotting variavbles on graph use aes
ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre))+geom_point()

ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre,size=Budget))+geom_point() 

       
p=ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre,size=Budget))
p
p+geom_point()
p+geom_point()+geom_line()
#----overriding Aestgetics
q=ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre,size=Budget))
q
q+geom_point(aes(size=CriticRatings))
q+geom_point(aes(colour=Budget))+xlab("Budget Million")
#---to change the name of x and y axis we use xlab ya ylab 


head(movies)
library(ggplot2)
?qplot()
q+geom_point(aes(Colour=Budget))+xlab("Budget Million")

#----MAPPING vs SETTING----
r<-ggplot(data=movies, aes(x=CriticRatings,y=AudienceRatings))
r+geom_point()


#---mapping---
r+geom_point(aes(colour=Genre))
#-----setting-----
r+geom_point(aes(colour=I("Green")))
r+geom_point(aes(colour="Green"))

#--------HISTOGRAM--------

s<-ggplot(data=movies, aes(x=Budget))
s+geom_histogram()
s+geom_histogram(binwidth=10)


s+geom_histogram(binwidth=10,aes(fill=Genre))
s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Purple")
#----------
s<-ggplot(data=movies, aes(x=CriticRatings))
s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+
  facet_grid(Genre~.,scales= "free")

#----------
s<-ggplot(data=movies, aes(x=AudienceRatings))
s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Blue") +
facet_grid(Gnere~.,scales= "free")



#-----STATISTICAL TRANSFORMATION------
u<-ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre))
u+geom_point()
?geom_smooth()
u+geom_point()+geom_smooth(fill=NA)




#------BOXPLOT------
k<-ggplot(data=movies,aes(x=Genre,y=AudienceRatings,colour=Genre))
k+geom_boxplot()
k+geom_boxplot()+geom_jitter()
k+geom_boxplot(size=1.2)facet

#---facets for scatter plots
w=ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre))
w
w+geom_point(size=3)+facet_grid(Genre~.)
w+geom_point(size=3)+facet_grid(Year~.)
w+geom_point(size=3)+facet_grid(Genre-Year)+ geom_smooth()
w



#----coordinates---
q=ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre,size=Budget))
q
q+geom_point()
q+geom_point()+xlim(50,100)+ylim(50,100)
#---this lim function is use if we want to see only certain point of the grapg to hum define krte hai konsa portion dkhna according to the coordinates on x and y


#----wont work work always the lim one
p=s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")
p+geom_point
p+geom_point()+xlim()+ylim()
