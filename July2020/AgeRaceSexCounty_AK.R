#############################################################################################################################################################################
#This code graphs county level age/race/sex data. I am using the file kindly put together by IPUMS NHGIS, https://www.nhgis.org/privacy-protected-demonstration-data
#There are three inputs to edit.
#DataIn: This is the folder where you have the County level csv file from IPUMS NHGIS
#Output: This is the folder where you want the graphs to be created
#Update State Code: Update subset statement on line 16 to point to state of interest. Field is numeric so no leading zeros.
#
#############################################################################################################################################################################
###Update these paths and subset statement.
#Reading data into R
DataIn<-read.csv(file=".../DifferentialPrivacy/PPMF/nhgis_ppdd_20200527_county/nhgis_ppdd_20200527_county.csv", head=TRUE, sep=",")
#Define Output Folder
Output<-".../DifferentialPrivacy/PPMF/Graphs/"

#Selecting State, UPDATE TO FIPS OF STATE OF INTEREST
TempData<-subset(DataIn, state== 2)
#############################################################################################################################################################################

Age<-c(0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85)
County_Name<-unique(TempData$name)

GraphCounty<-function(DataSet,Prefix,Race){
#Creating arrays to hold data
Census_M<-array(0,c(length(Age),length(County_Name)))
Census_F<-array(0,c(length(Age),length(County_Name)))
CensusPPMF_M<-array(0,c(length(Age),length(County_Name)))
CensusPPMF_F<-array(0,c(length(Age),length(County_Name)))

for (i in 1:length(County_Name)){
#Subsetting to specific county
Temp<-subset(DataSet,DataSet$name==eval(parse(text = paste("County_Name[",i,"]",sep=""))))

MaleAge_PPMF<-c(eval(parse(text = paste("Temp$",Prefix,"003_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"004_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"005_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"006_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"007_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"008_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"009_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"010_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"011_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"012_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"013_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"014_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"015_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"016_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"017_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"018_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"019_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"020_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"021_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"022_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"023_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"024_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"025_dp",sep=""))))

FemaleAge_PPMF<-c(eval(parse(text = paste("Temp$",Prefix,"027_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"028_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"029_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"030_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"031_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"032_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"033_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"034_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"035_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"036_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"037_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"038_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"039_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"040_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"041_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"042_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"043_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"044_dp",sep="")))+eval(parse(text = paste("Temp$",Prefix,"045_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"046_dp",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"047_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"048_dp",sep=""))),eval(parse(text = paste("Temp$",Prefix,"049_dp",sep=""))))

MaleAge_Cen<-c(eval(parse(text = paste("Temp$",Prefix,"003_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"004_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"005_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"006_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"007_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"008_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"009_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"010_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"011_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"012_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"013_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"014_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"015_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"016_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"017_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"018_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"019_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"020_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"021_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"022_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"023_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"024_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"025_sf",sep=""))))

FemaleAge_Cen<-c(eval(parse(text = paste("Temp$",Prefix,"027_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"028_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"029_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"030_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"031_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"032_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"033_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"034_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"035_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"036_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"037_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"038_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"039_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"040_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"041_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"042_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"043_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"044_sf",sep="")))+eval(parse(text = paste("Temp$",Prefix,"045_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"046_sf",sep=""))),
eval(parse(text = paste("Temp$",Prefix,"047_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"048_sf",sep=""))),eval(parse(text = paste("Temp$",Prefix,"049_sf",sep=""))))

Census_M[,i]<-MaleAge_Cen
Census_F[,i]<-FemaleAge_Cen
CensusPPMF_F[,i]<-FemaleAge_PPMF
CensusPPMF_M[,i]<-MaleAge_PPMF
}

pdf(paste(Output,"MaleAge_County_",Race,".pdf", sep=""))
for (i in 1:length(County_Name)){plot(Age, Census_M[,i],type='l',col=2,lwd=4, ylim=c(0,max(CensusPPMF_M[,i],Census_M[,i])*1.2), ylab='Population',main=County_Name[i])
points(Age, CensusPPMF_M[,i],type='l', col=3, lwd=4)
legend('topright',c("Census","PPMF"),fill=c(2,3))}
dev.off()

pdf(paste(Output,"FemaleAge_County_",Race,".pdf", sep=""))
for (i in 1:length(County_Name)){plot(Age, Census_F[,i],type='l',col=2,lwd=4, ylim=c(0,max(CensusPPMF_F[,i],Census_F[,i])*1.2), ylab='Population',main=County_Name[i])
points(Age, CensusPPMF_F[,i],type='l', col=3, lwd=4)
legend('topright',c("Census","PPMF"),fill=c(2,3))}
dev.off()
}

GraphCounty(TempData,"H9A","WhiteAlone")
GraphCounty(TempData,"H9B","BlackAlone")
GraphCounty(TempData,"H9C","AIANAlone")
GraphCounty(TempData,"H9D","AsianAlone")
GraphCounty(TempData,"H9E","NHOPIAlone")
GraphCounty(TempData,"H9F","OtherAlone")
GraphCounty(TempData,"H9G","TwoPlus")
GraphCounty(TempData,"H9H","Hispanic")
GraphCounty(TempData,"H9I","NHWhiteAlone")

