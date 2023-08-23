movies<-read.csv(file.choose())
movies<-read.csv("Movie Ratings.csv")
getwd()
movies
head(movies)
colnames(movies)<-c("Film","Genre","CriticRatings","AudienceRatings","Budget","Year")
str(movies)
summary(movies)
movies$Film<-as.factor(movies$Film)
movies$Genre<-as.factor(movies$Genre)
movies$Year<-as.factor(movies$Year)

str(movies)
summary(movies)
library(ggplot2)
ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings))+geom_point()
ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre))+geom_point()
ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre,size=Budget))+geom_point()

p<-ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre,size=Budget))
p
p+geom_point()
p+geom_line()
p+geom_line()+geom_point()
p+geom_point()+geom_line()


#--------OVERIDING ASTHETICS-------
q<-ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre,size=Budget))
q
q+geom_point(aes(size=CriticRatings))
q+geom_point()
q+geom_point(aes(Colour=Budget))
q+geom_point(aes(Colour=Budget))+xlab("Budget Million")



#-----cot 19-------
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
s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")
#----------
s<-ggplot(data=movies, aes(x=AudienceRatings))
s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Blue")



#-----STATISTICAL TRANSFORMATION------
u<-ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre))
u+geom_point()
?geom_smooth()
u+geom_point()+geom_smooth(fill=NA)




#------BOXPLOT------
k<-ggplot(data=movies,aes(x=Genre,y=AudienceRatings,colour=Genre))
k+geom_boxplot()
k+geom_boxplot()+geom_jitter()
k+geom_boxplot(size=1.2)
k+geom_boxplot(size=1.2)+geom_jitter()


head(movies)
library(ggplot2)
v<-ggplot(data=movies,aes(x=Budget))
v
v+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")
v+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+facet_grid(Genre~.)
v+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+facet_grid(Genre~.,scales="free")

#-------FACETS FOR SCATTERPLOY---
w<-ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,colour=Genre))
w
w+geom_point(size=3)
w+geom_point(size=3)+facet_grid(Genre~.)
w+geom_point(size=3)+facet_grid(.~Year)

w+geom_point(size=3)+facet_grid(Genre~Year)
w+geom_point(size=3)+facet_grid(Genre~Year)+geom_smooth()
w+geom_point(aes(size=Budget))+facet_grid(Genre~Year)+geom_smooth()
head(movies)
#----COORDINATES-----
m<-ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,size=Budget,colour=Genre))
m         
m+geom_point()
m+geom_point()+xlim(50,100)+ylim(50,100)

#-------wont work well always-------
n<-ggplot(data=movies,aes(x=Budget))
n
n+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")


v<-ggplot(data=movies,aes(x=Budget))
v
v+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+ylim(0,50)

#-------instead zoom in-----
v+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+coord_cartesian(ylim=c(0,50))
#-----improving above graph---
w+geom_point(aes(size=Budget))+facet_grid(Genre~Year)+geom_smooth()


w+geom_point(aes(size=Budget))+facet_grid(Genre~Year)+geom_smooth()+coord_cartesian(ylim=c(0,100))
#--------perfectly by Adding themes(non data ink)---------
o<-ggplot(data=movies,aes(x=Budget))
o+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")
h<-o+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")
h
#-------axes labels----
h+xlab("Budget in Millions")+ylab("Number of Movies")
h+xlab("Budget in Millions")+ylab("Number of Movies")+
theme(axis.title.x=element_text(colour="Green",size=30),
axis.title.y=element_text(colour="Blue",size=30))

#-----tick mark formatting-----

h+xlab("Budget in Millions")+ylab("Number of Movies")
h+xlab("Budget in Millions")+ylab("Number of Movies")+
  theme(axis.title.x=element_text(colour="Green",size=30),
        axis.title.y=element_text(colour="Blue",size=30),
        axis.text.x=element_text(size=20),axis.text.y=element_text(size=20))




#------LEGEND FORMATTING----
h+xlab("Budget in Millions")+ylab("Number of Movies")
h+xlab("Budget in Millions")+ylab("Number of Movies")+
  theme(axis.title.x=element_text(colour="Green",size=30),
        axis.title.y=element_text(colour="Blue",size=30),
        axis.text.x=element_text(size=20),axis.text.y=element_text(size=20),
        legend.title=element_text(size=30),legend.text=element_text(size=20),
        legend.position=c(1,1),legend.justification=c(1,1))


#------chart title change-----
h+xlab("Budget in Millions")+ylab("Number of Movies")+ggtitle("Movie Budget Distribution")+
  theme(axis.title.x=element_text(colour="Green",size=30),
        axis.title.y=element_text(colour="Blue",size=30),
        axis.text.x=element_text(size=20),axis.text.y=element_text(size=20),
        legend.title=element_text(size=30),legend.text=element_text(size=20),
        legend.position=c(1,1),legend.justification=c(1,1))


#---chart title colour changes----


h+xlab("Budget in Millions")+ylab("Number of Movies")+ggtitle("Movie Budget Distribution")+
  theme(axis.title.x=element_text(colour="Green",size=30),
        axis.title.y=element_text(colour="Blue",size=30),
        axis.text.x=element_text(size=20),axis.text.y=element_text(size=20),
        legend.title=element_text(size=30),legend.text=element_text(size=20),
        legend.position=c(1,1),legend.justification=c(1,1),plot.title=element_text(colour="Blue",size=30))



