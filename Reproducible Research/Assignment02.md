Exploring the U.S. National Oceanic and Atmospheric Administration’s (NOAA) storm database - Health and Economic Impacts
========================================================================================================================

Synopsis
--------

Storms and other severe weather events can cause both public health and
economic problems for communities and municipalities. Many severe events
can result in fatalities, injuries, and property damage, and preventing
such outcomes to the extent possible is a key concern.

This project involves exploring the U.S. National Oceanic and
Atmospheric Administration’s (NOAA) storm database. This database tracks
characteristics of major storms and weather events in the United States,
including when and where they occur, as well as estimates of any
fatalities, injuries, and property damage.

The analysis of the data shows that tornadoes, by far, have the greatest
health impact as measured by the number of injuries and fatalities The
analysis also shows that floods cause the greatest economic impact as
measured by property damage and crop damage.

Data Processing
---------------

### Loading the packages and prepare the R environment

I used the following libraries in my analysis

    library('dplyr')
    library('plyr')
    library('ggplot2')

Data
----

The data for this assignment come in the form of a comma-separated-value
file compressed via the bzip2 algorithm to reduce its size. You can
download the file from the course web site: [Storm
Data](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2)

There is also some documentation of the database available. Here you
will find how some of the variables are constructed/defined.

National Weather Service [Storm Data
Documentation](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf)

The events in the database start in the year 1950 and end in November
2011. In the earlier years of the database there are generally fewer
events recorded, most likely due to a lack of good records. More recent
years should be considered more complete.

Goal
----

The basic goal of this analysis is to explore the NOAA Storm Database
and answer the following basic questions about severe weather events.

1.  Across the United States, which types of events (as indicated in the
    EVTYPE variable) are most harmful with respect to population health?
2.  Across the United States, which types of events have the greatest
    economic consequences?

### Loading the Data

The data was downloaded from the link above and saved on local computer
(in setwd command one can replace loacal file path with path of folder
where the data was downloaded). Then it was loaded on the R using the
read.csv command.

    storm_data<-as.data.frame(read.csv("repdata_data_StormData.csv", header = T,
                                       comment.char = ""))

Examining the Storm Data Loaded

    dim(storm_data)

    ## [1] 902297     37

    summary(storm_data)

    ##     STATE__       BGN_DATE           BGN_TIME          TIME_ZONE        
    ##  Min.   : 1.0   Length:902297      Length:902297      Length:902297     
    ##  1st Qu.:19.0   Class :character   Class :character   Class :character  
    ##  Median :30.0   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :31.2                                                           
    ##  3rd Qu.:45.0                                                           
    ##  Max.   :95.0                                                           
    ##                                                                         
    ##      COUNTY       COUNTYNAME           STATE              EVTYPE         
    ##  Min.   :  0.0   Length:902297      Length:902297      Length:902297     
    ##  1st Qu.: 31.0   Class :character   Class :character   Class :character  
    ##  Median : 75.0   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :100.6                                                           
    ##  3rd Qu.:131.0                                                           
    ##  Max.   :873.0                                                           
    ##                                                                          
    ##    BGN_RANGE          BGN_AZI           BGN_LOCATI          END_DATE        
    ##  Min.   :   0.000   Length:902297      Length:902297      Length:902297     
    ##  1st Qu.:   0.000   Class :character   Class :character   Class :character  
    ##  Median :   0.000   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :   1.484                                                           
    ##  3rd Qu.:   1.000                                                           
    ##  Max.   :3749.000                                                           
    ##                                                                             
    ##    END_TIME           COUNTY_END COUNTYENDN       END_RANGE       
    ##  Length:902297      Min.   :0    Mode:logical   Min.   :  0.0000  
    ##  Class :character   1st Qu.:0    NA's:902297    1st Qu.:  0.0000  
    ##  Mode  :character   Median :0                   Median :  0.0000  
    ##                     Mean   :0                   Mean   :  0.9862  
    ##                     3rd Qu.:0                   3rd Qu.:  0.0000  
    ##                     Max.   :0                   Max.   :925.0000  
    ##                                                                   
    ##    END_AZI           END_LOCATI            LENGTH              WIDTH         
    ##  Length:902297      Length:902297      Min.   :   0.0000   Min.   :   0.000  
    ##  Class :character   Class :character   1st Qu.:   0.0000   1st Qu.:   0.000  
    ##  Mode  :character   Mode  :character   Median :   0.0000   Median :   0.000  
    ##                                        Mean   :   0.2301   Mean   :   7.503  
    ##                                        3rd Qu.:   0.0000   3rd Qu.:   0.000  
    ##                                        Max.   :2315.0000   Max.   :4400.000  
    ##                                                                              
    ##        F               MAG            FATALITIES          INJURIES        
    ##  Min.   :0.0      Min.   :    0.0   Min.   :  0.0000   Min.   :   0.0000  
    ##  1st Qu.:0.0      1st Qu.:    0.0   1st Qu.:  0.0000   1st Qu.:   0.0000  
    ##  Median :1.0      Median :   50.0   Median :  0.0000   Median :   0.0000  
    ##  Mean   :0.9      Mean   :   46.9   Mean   :  0.0168   Mean   :   0.1557  
    ##  3rd Qu.:1.0      3rd Qu.:   75.0   3rd Qu.:  0.0000   3rd Qu.:   0.0000  
    ##  Max.   :5.0      Max.   :22000.0   Max.   :583.0000   Max.   :1700.0000  
    ##  NA's   :843563                                                           
    ##     PROPDMG         PROPDMGEXP           CROPDMG         CROPDMGEXP       
    ##  Min.   :   0.00   Length:902297      Min.   :  0.000   Length:902297     
    ##  1st Qu.:   0.00   Class :character   1st Qu.:  0.000   Class :character  
    ##  Median :   0.00   Mode  :character   Median :  0.000   Mode  :character  
    ##  Mean   :  12.06                      Mean   :  1.527                     
    ##  3rd Qu.:   0.50                      3rd Qu.:  0.000                     
    ##  Max.   :5000.00                      Max.   :990.000                     
    ##                                                                           
    ##      WFO             STATEOFFIC         ZONENAMES            LATITUDE   
    ##  Length:902297      Length:902297      Length:902297      Min.   :   0  
    ##  Class :character   Class :character   Class :character   1st Qu.:2802  
    ##  Mode  :character   Mode  :character   Mode  :character   Median :3540  
    ##                                                           Mean   :2875  
    ##                                                           3rd Qu.:4019  
    ##                                                           Max.   :9706  
    ##                                                           NA's   :47    
    ##    LONGITUDE        LATITUDE_E     LONGITUDE_       REMARKS         
    ##  Min.   :-14451   Min.   :   0   Min.   :-14455   Length:902297     
    ##  1st Qu.:  7247   1st Qu.:   0   1st Qu.:     0   Class :character  
    ##  Median :  8707   Median :   0   Median :     0   Mode  :character  
    ##  Mean   :  6940   Mean   :1452   Mean   :  3509                     
    ##  3rd Qu.:  9605   3rd Qu.:3549   3rd Qu.:  8735                     
    ##  Max.   : 17124   Max.   :9706   Max.   :106220                     
    ##                   NA's   :40                                        
    ##      REFNUM      
    ##  Min.   :     1  
    ##  1st Qu.:225575  
    ##  Median :451149  
    ##  Mean   :451149  
    ##  3rd Qu.:676723  
    ##  Max.   :902297  
    ## 

Extracting variables of interest for analysis of weather impact on health and economy
-------------------------------------------------------------------------------------

From a list of variables in storm\_data, these are columns of interest:

Health variables:

-   FATALITIES: approx. number of mortalities
-   INJURIES: approx. number of injuries

Economic variables:

-PROPDMG: approx. property damage -PROPDMGEXP: the units for property
damage value -CROPDMG: approx. crop damages -CROPDMGEXP: the units for
crop damage value

Events - target variable:

EVTYPE: weather event (Tornados, Wind, Snow, Flood, etc..)

Extract variables of interest from original data set:

    target_variables<-c("EVTYPE", "FATALITIES", "INJURIES", "PROPDMG", "PROPDMGEXP", "CROPDMG", "CROPDMGEXP")
    target_data<-storm_data[,target_variables]
    #Renaming the columns of target_data for better understanding and readibility
    colnames(target_data)<-c("event_type","fatalities","injuries","property_damage","property_damage_exponent","crop_damage","crop_damage_exponent")

    summary(target_data)

    ##   event_type          fatalities          injuries         property_damage  
    ##  Length:902297      Min.   :  0.0000   Min.   :   0.0000   Min.   :   0.00  
    ##  Class :character   1st Qu.:  0.0000   1st Qu.:   0.0000   1st Qu.:   0.00  
    ##  Mode  :character   Median :  0.0000   Median :   0.0000   Median :   0.00  
    ##                     Mean   :  0.0168   Mean   :   0.1557   Mean   :  12.06  
    ##                     3rd Qu.:  0.0000   3rd Qu.:   0.0000   3rd Qu.:   0.50  
    ##                     Max.   :583.0000   Max.   :1700.0000   Max.   :5000.00  
    ##  property_damage_exponent  crop_damage      crop_damage_exponent
    ##  Length:902297            Min.   :  0.000   Length:902297       
    ##  Class :character         1st Qu.:  0.000   Class :character    
    ##  Mode  :character         Median :  0.000   Mode  :character    
    ##                           Mean   :  1.527                       
    ##                           3rd Qu.:  0.000                       
    ##                           Max.   :990.000

Checking if any of the target variables has any NA or NAN values:
-----------------------------------------------------------------

    for (i in 1:7){
      print(paste("No of NA/NAN Values in", names(target_data)[i], "are", sum(is.na(target_data[,i])) ))
    }

    ## [1] "No of NA/NAN Values in event_type are 0"
    ## [1] "No of NA/NAN Values in fatalities are 0"
    ## [1] "No of NA/NAN Values in injuries are 0"
    ## [1] "No of NA/NAN Values in property_damage are 0"
    ## [1] "No of NA/NAN Values in property_damage_exponent are 0"
    ## [1] "No of NA/NAN Values in crop_damage are 0"
    ## [1] "No of NA/NAN Values in crop_damage_exponent are 0"

Transforming Extracted Variables
--------------------------------

    sort(table(target_data$event_type),decreasing = T)[1:10]

    ## 
    ##               HAIL          TSTM WIND  THUNDERSTORM WIND            TORNADO 
    ##             288661             219940              82563              60652 
    ##        FLASH FLOOD              FLOOD THUNDERSTORM WINDS          HIGH WIND 
    ##              54277              25326              20843              20212 
    ##          LIGHTNING         HEAVY SNOW 
    ##              15754              15708

The Event Type can be grouped into few broad categories

There are many cases where event type are just Upper and Lower Cases of
word like Winter, WINTER, winter. We will group events like TUNDERSTORM
WIND, TUNDERSTORM WINDS, HIGH WIND, etc. by containing the keyword
‘WIND’ as one event WIND. We will transform other types of events in a
similar way. New variable event\_category is the transform variable of
event\_type that have 10 different types of events: HEAT, FLOOD, etc.,
and type MISC for events in which name the keyword is not found.

    target_data$event_category<-"MISC"

    target_data$event_category[grep("HAIL", target_data$event_type, ignore.case = T )]<-"hail"
    target_data$event_category[grep("STORM", target_data$event_type, ignore.case = T )]<-"storm"
    target_data$event_category[grep("THUNDERSTORM", target_data$event_type, ignore.case = T )]<-"thunderstorm"
    target_data$event_category[grep("HEAT", target_data$event_type, ignore.case = T )]<-"heat"
    target_data$event_category[grep("drought", target_data$event_type, ignore.case = T )]<-"drought"
    target_data$event_category[grep("TORNADO", target_data$event_type, ignore.case = T )]<-"tornado"
    target_data$event_category[grep("FlOOD", target_data$event_type, ignore.case = T )]<-"flood"
    target_data$event_category[grep("FLD", target_data$event_type, ignore.case = T )]<-"flood" #floods in streams, urban area
    target_data$event_category[grep("WIND", target_data$event_type, ignore.case = T )]<-"wind"
    target_data$event_category[grep("SNOW", target_data$event_type, ignore.case = T )]<-"snow"
    target_data$event_category[grep("WINTER", target_data$event_type, ignore.case = T )]<-"winter"
    target_data$event_category[grep("FREEZE", target_data$event_type, ignore.case = T )]<-"winter"
    target_data$event_category[grep("ICE", target_data$event_type, ignore.case = T )]<-"ice"
    target_data$event_category[grep("RAIN", target_data$event_type, ignore.case = T )]<-"rain"
    target_data$event_category[grep("WILDFIRE", target_data$event_type, ignore.case = T )]<-"wildfire"
    target_data$event_category[grep("FIRE", target_data$event_type, ignore.case = T )]<-"fire"
    target_data$event_category[grep("THUNDERSTORM", target_data$event_type, ignore.case = T )]<-"thunderstorm"
    target_data$event_category[grep("LIGHTNING", target_data$event_type, ignore.case = T )]<-"lightning"
    target_data$event_category[grep("FIRE", target_data$event_type, ignore.case = T )]<-"fire"
    target_data$event_category[grep("BLIZZARD", target_data$event_type, ignore.case = T )]<-"blizzard"
    target_data$event_category[grep("FUNNEL", target_data$event_type, ignore.case = T)]   <-"tornado"  #funnel clouds lead to tornadoes on land
    target_data$event_category[grep("WATERSPOUT", target_data$event_type, ignore.case = T )]<-"tornado" #Basically they are tornadoes on water

    table(target_data$event_category)

    ## 
    ##     blizzard      drought         fire        flood         hail         heat 
    ##         2745         2505         4240        86071       289269         2631 
    ##          ice    lightning         MISC         rain         snow        storm 
    ##         2194        15775         7996        12235        17572         1563 
    ## thunderstorm      tornado         wind       winter 
    ##       109558        71536       255361        21046

Checking the values for variables that represent units of dollars:

    table(target_data$property_damage_exponent)

    ## 
    ##             -      ?      +      0      1      2      3      4      5      6 
    ## 465934      1      8      5    216     25     13      4      4     28      4 
    ##      7      8      B      h      H      K      m      M 
    ##      5      1     40      1      6 424665      7  11330

    table(target_data$crop_damage_exponent)

    ## 
    ##             ?      0      2      B      k      K      m      M 
    ## 618413      7     19      1      9     21 281832      1   1994

We can see there are incorrect units: 1. - k/K stand for thousands
dollars (10^3) 2. - m/M stand for Million dollars (10^6) 3. - b/B stand
for Billion dolllars (10^9) 4. - All the rest would be considered as
dollars including NA’s

    target_data$property_damage_exponent <- toupper(target_data$property_damage_exponent)
    target_data$crop_damage_exponent <- toupper(target_data$crop_damage_exponent)

    target_data$crop_damage_factor[(target_data$crop_damage_exponent == "")] <- 10^0
    target_data$crop_damage_factor[(target_data$crop_damage_exponent == "?")] <- 10^0
    target_data$crop_damage_factor[(target_data$crop_damage_exponent == "0")] <- 10^0
    target_data$crop_damage_factor[(target_data$crop_damage_exponent == "2")] <- 10^2
    target_data$crop_damage_factor[(target_data$crop_damage_exponent == "K")] <- 10^3
    target_data$crop_damage_factor[(target_data$crop_damage_exponent == "M")] <- 10^6
    target_data$crop_damage_factor[(target_data$crop_damage_exponent == "B")] <- 10^9
    target_data$total_crop_damage<- target_data$crop_damage * target_data$crop_damage_factor


    target_data$prop_damage_factor[(target_data$property_damage_exponent == "")] <- 10^0
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "-")] <- 10^0
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "?")] <- 10^0
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "+")] <- 10^0
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "0")] <- 10^0
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "1")] <- 10^1
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "2")] <- 10^2
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "3")] <- 10^3
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "4")] <- 10^4
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "5")] <- 10^5
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "6")] <- 10^6
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "7")] <- 10^7
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "8")] <- 10^8
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "H")] <- 10^2
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "K")] <- 10^3
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "M")] <- 10^6
    target_data$prop_damage_factor[(target_data$property_damage_exponent == "B")] <- 10^9
    target_data$total_property_damage<- target_data$property_damage * target_data$prop_damage_factor


    target_data[which.max(target_data$total_property_damage),]

    ##        event_type fatalities injuries property_damage property_damage_exponent
    ## 605953      FLOOD          0        0             115                        B
    ##        crop_damage crop_damage_exponent event_category crop_damage_factor
    ## 605953        32.5                    M          flood              1e+06
    ##        total_crop_damage prop_damage_factor total_property_damage
    ## 605953          32500000              1e+09              1.15e+11

    target_data[which.max(target_data$total_crop_damage),]

    ##         event_type fatalities injuries property_damage property_damage_exponent
    ## 198389 RIVER FLOOD          0        0               5                        B
    ##        crop_damage crop_damage_exponent event_category crop_damage_factor
    ## 198389           5                    B          flood              1e+09
    ##        total_crop_damage prop_damage_factor total_property_damage
    ## 198389             5e+09              1e+09                 5e+09

Finding out the event that caused maximum loss to property and crop We
can see that both the events belong to the category ‘flood’

    target_data[which.max(target_data$total_property_damage),c(1,4,5,8,12)]

    ##        event_type property_damage property_damage_exponent event_category
    ## 605953      FLOOD             115                        B          flood
    ##        total_property_damage
    ## 605953              1.15e+11

    target_data[which.max(target_data$total_crop_damage),c(1,7,8,9,10)]

    ##         event_type crop_damage_exponent event_category crop_damage_factor
    ## 198389 RIVER FLOOD                    B          flood              1e+09
    ##        total_crop_damage
    ## 198389             5e+09

Analysis
--------

### Aggregating events for economic variables

    #We have the property damage and crop damage caused by individual event.
    #Now we take a sum of the damages grouped by the event category

    # Aggregate property damage by event_category
    property_damage_byevents <- ddply(target_data, .(event_category), summarize, prop_damage = sum(total_property_damage, na.rm = TRUE))
    property_damage_byevents$id1 <- "property"

    crop_damage_byevents <- ddply(target_data, .(event_category), summarize, crop_damage = sum(total_crop_damage, na.rm = TRUE))
    crop_damage_byevents$id2 <- "crop"

    economy_loss<- join(property_damage_byevents, crop_damage_byevents, by ="event_category", type ='inner')
    economy_loss$total_damage<-economy_loss$prop_damage+economy_loss$crop_damage
    economy_loss

    ##    event_category  prop_damage      id1 crop_damage  id2 total_damage
    ## 1        blizzard    664913950 property   112060000 crop    776973950
    ## 2         drought   1046306000 property 13972621780 crop  15018927780
    ## 3            fire   8501628500 property   403281630 crop   8904910130
    ## 4           flood 168237211483 property 12270394200 crop 180507605683
    ## 5            hail  15736043513 property  3046837473 crop  18782880986
    ## 6            heat     20125750 property   904413500 crop    924539250
    ## 7             ice   3974061410 property  5027114300 crop   9001175710
    ## 8       lightning    935727930 property    12097090 crop    947825020
    ## 9            MISC  86010643990 property  7191331250 crop  93201975240
    ## 10           rain   3265197192 property   919315800 crop   4184512992
    ## 11           snow   1012999700 property   134683100 crop   1147682800
    ## 12          storm  55925713550 property   698851000 crop  56624564550
    ## 13   thunderstorm   6641014705 property   653000388 crop   7294015093
    ## 14        tornado  57013082227 property   414961520 crop  57428043747
    ## 15           wind  12444218618 property  1406724150 crop  13850942768
    ## 16         winter   6795980251 property  1936505000 crop   8732485251

### Aggregating events for public health variables

    #We have the number of fatalities and injuries caused by individual event.
    #Now we take a sum of the life damages grouped by the event category

    # Aggregate property damage by event_category
    fatalities_byevents <- ddply(target_data, .(event_category), summarize, total_deaths = sum(fatalities, na.rm = TRUE))
    property_damage_byevents$id <- "property"

    injuries_byevents <- ddply(target_data, .(event_category), summarize, total_injuries = sum(injuries, na.rm = TRUE))
    crop_damage_byevents$id <- "crop"

    public_health_loss<- join(fatalities_byevents, injuries_byevents, by ="event_category", type ='inner')
    public_health_loss$total_damage<-public_health_loss$total_deaths+public_health_loss$total_injuries
    public_health_loss

    ##    event_category total_deaths total_injuries total_damage
    ## 1        blizzard          101            806          907
    ## 2         drought            6             19           25
    ## 3            fire           90           1608         1698
    ## 4           flood         1552           8681        10233
    ## 5            hail           15           1371         1386
    ## 6            heat         3132           9209        12341
    ## 7             ice          102           2166         2268
    ## 8       lightning          817           5232         6049
    ## 9            MISC         1578           4303         5881
    ## 10           rain          114            305          419
    ## 11           snow          159           1151         1310
    ## 12          storm          116            868          984
    ## 13   thunderstorm          210           2478         2688
    ## 14        tornado         5639          91439        97078
    ## 15           wind         1235           9001        10236
    ## 16         winter          279           1891         2170

Finding out the event that caused maximum loss to public health We can
see that Tornados on land are responsible for maximum no of loss to
human health Whether we consider only no of death or injuries, tornadoes
prove to be the most deadly

    public_health_loss[which.max(public_health_loss$total_injuries),]

    ##    event_category total_deaths total_injuries total_damage
    ## 14        tornado         5639          91439        97078

    public_health_loss[which.max(public_health_loss$total_deaths),]

    ##    event_category total_deaths total_injuries total_damage
    ## 14        tornado         5639          91439        97078

    public_health_loss[which.max(public_health_loss$total_injuries),]

    ##    event_category total_deaths total_injuries total_damage
    ## 14        tornado         5639          91439        97078

Results
-------

### Across the United States, which types of events have the greatest economic consequences?

    economy_loss$event_catogery<-as.factor(economy_loss$event_category)
    ggplot() + geom_bar(data = economy_loss, 
               aes(x = event_catogery, y = total_damage, 
               fill = interaction(total_damage, event_category)), 
               stat = "identity", show.legend = F) + 
               theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
               xlab("Event Type") + ylab("Total Damage to the Economy")

![](Assignment02_files/figure-markdown_strict/unnamed-chunk-17-1.png)

### Across the United States, which types of events are most harmful with respect to population health?

    economy_loss$event_category<-as.factor(economy_loss$event_category)
    ggplot() + geom_bar(data = public_health_loss, 
               aes(x = event_category, y = total_damage, 
               fill = interaction(total_damage, event_category)), 
               stat = "identity", show.legend = F) + 
               theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
               xlab("Event Type") + ylab("Total Damage to Population Health")

![](Assignment02_files/figure-markdown_strict/unnamed-chunk-18-1.png)
