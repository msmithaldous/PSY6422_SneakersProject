#StockX image
imgpath1 <- '/Users/martynsmithaldous/Documents/Uni/Masters/Data Analysis and visualisation/Project1/stockx.jpg'

#Inclusion of graphics
knitr::include_graphics(imgpath1)

#Pathway to data
library(readxl)
library(here)
StockX_Data_Contest_2019<- read_excel(here("Data","/StockX-Data-Contest-2019.xlsx"))
head(StockX_Data_Contest_2019)
library(tidyverse)

# Tidying data and assigning values
saleprice <- StockX_Data_Contest_2019$`Sale Price`
sneakername <- StockX_Data_Contest_2019$`Sneaker Name`
shoesize <- StockX_Data_Contest_2019$`Shoe Size`
brand <- StockX_Data_Contest_2019$'Brand'
retailprice <- StockX_Data_Contest_2019$`Retail Price`
orderdate <- StockX_Data_Contest_2019$`Order Date`
year <- StockX_Data_Contest_2019$'year'

# To get year as column
format(as.Date(StockX_Data_Contest_2019$`Order Date`, format="%Y/%m/%d"),"%Y")
StockX_Data_Contest_2019$year <- format(as.Date(StockX_Data_Contest_2019$`Order Date`, format="%Y/%m/%d"),"%Y")


## Visualisation 1
library (ggplot2)
p <- ggplot(data = StockX_Data_Contest_2019, mapping = aes(x = `Retail Price`,  y = `Sale Price`, color= StockX_Data_Contest_2019$Brand))
p + geom_point() + labs(title = "Resale price- Off-White vs Yeezy") +
  scale_x_log10(labels= scales::dollar) +
  scale_y_log10(labels= scales::dollar) +
  guides(color = guide_legend(title = "Brand"))
ggsave("profitdifference.png")
         

## Visualisation 2
ggplot (data=StockX_Data_Contest_2019, aes (x= StockX_Data_Contest_2019$year, y= StockX_Data_Contest_2019$`Sale Price`, group= StockX_Data_Contest_2019$Brand )) +
  geom_line(aes(color= StockX_Data_Contest_2019$Brand))+
  labs (x = "Year", y = "Sale Price ($)", title = "Changes in Sneaker Resale Price")+
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))+
  guides(color = guide_legend(title = "Brand"))
ggsave("pricedifferenceyear.png")
  
