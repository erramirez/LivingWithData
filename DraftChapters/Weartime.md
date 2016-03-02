Weartime
================
Ernesto Ramirez
January 27, 2016

-   [Fitbit Data Processing](#fitbit-data-processing)
    -   [Wear Time Processing: Flagging](#wear-time-processing-flagging)
    -   [Visual Analysis](#visual-analysis)
    -   [Censuring Abnormal Data](#censuring-abnormal-data)

Fitbit Data Processing
======================

All historical data for each participant was collected using Fitbase. Briefly, all data from a participant's account was made available through the Fitbit API and the Fitbase system. Data was collected and downloaded to include every day from the time the participant first signed up with Fitbit (Initiation Date), until the day of the participant's interview (Interview Date).

As this data is retrospective in nature there is not guarantee that the participants were using their device and collecting physical activity information for each of the days present in their data files. Participants may have lost a device for a period of time, forgotten to wear their device, or even chosen not to wear it for a particular day or period of time. Even if the device is not worn, and it does not move, the data is still synced to Fitbit and made available through the API. Typically this results in a day with values equal to zero for physical activity data (steps, active minutes, distance, etc.). To better classify the available data, and use data that most accurately reflected actual device wear a multi-step wear time classification process was conducted.

Wear Time Processing: Flagging
------------------------------

Initially, minute-level step values were used to approximate the commonly used count measure produced by research accelerometers such as the ActiGraph GT3X. However, since accelerometer counts are derived from the intensity of the accelerometer movement in Actigraph models (ActiGraph, n.d.), additional data sources provided by Fitbit were explored. Fitbit states:

> All Fitbit trackers calculate active minutes using metabolic equivalents (METs). METs help measure the energy &gt;expenditure of various activities. Because they do so in a comparable way among persons of different weights, METs are &gt;widely used as indicators for exercise intensity. For example, a MET of 1 indicates a body at rest. Fitbit trackers &gt;estimate your MET value in any given minute by calculating the intensity of your activity. (Fitbit, n.d.)

Since the minute-level MET value provided by Fitbit is a more appropriate measure for inferring the movement of the actual device, and not a behavioral measure, like steps, this was used for wear time analysis.

Minute-Level data files containing the date/time stamps and MET values were downloaded from Fitabase for each participant. The data was processed in R and the "accelerometry" package was used to analyze and flag period of non-wear time(Domelen, 2015; R Core Team, 2015). The data was processed using parameters commonly used for processing accelerometer data in physical activity research (Choi, Liu, Matthews, and Buchowski, 2011; Troiano et al., 2008). These parameters include a minimum window of 90 minutes, a tolerance of two minutes for non-zero counts within a non-wear window, a maximal tolerance of two METs for a minute within the non-wear window. Additionally processing was set to use a moving window to go through every possible 90-minute window in the data. Days were classified as valid if at least 600 minutes of wear time was classified within the day using this processing method.

Visual Analysis
---------------

To further inspect the Fitbit data for characteristics that would indicate invalid days a visual analysis of the data was employed. Each participant's minute-level step and MET data were plotted and inspected for uncharacteristic values and patterns. Specifically, this quick visual analysis of the minute-level data allowed for the identification of period of data that could be attributed to device malfunctions or non-locomotor activity. Figure \[TK\] provides annotated example of data that was identified as inconsistent with normal activity patterns.

Censuring Abnormal Data
-----------------------

After the visual analysis it was determined that step values greater than or equal to 200 steps per minute should be classified as abnormal. As 200 steps per minute could be possibly achieved by the participants a conservative process was used to eliminate valid days that included abnormal minutes. Days previously marked as valid were censured if greater than ten percent of their daily step total was attributed to abnormal minutes.

``` r
library(knitr)
library(plyr)
load("~/Dropbox/Dissertation.Data/FitbitData/ProcessedData/Daily.Activity.Final.rdata")
WearTable <- ddply(Daily.Activity.Final, c("id"), summarise, 'Initial Available Days'=length(id),
                   'Valid Days (MET Processing)'=sum(ValidDay.Counts),
                   'Valid Days (Censured)'=sum(ValidDay.Censured),
                   'Valid Days (Final)'=sum(Valid.Final)
                   )
kable(WearTable, caption = "Table [TK]")
```

|   id|  Initial Available Days|  Valid Days (MET Processing)|  Valid Days (Censured)|  Valid Days (Final)|
|----:|-----------------------:|----------------------------:|----------------------:|-------------------:|
|    1|                    1263|                         1096|                   1096|                1096|
|    2|                    1162|                         1062|                   1062|                1062|
|    3|                     802|                          686|                    686|                 686|
|    4|                     204|                          198|                    198|                 198|
|    5|                     497|                          472|                    472|                 472|
|    6|                     550|                          542|                    542|                 542|
|    7|                     187|                          181|                    181|                 181|
|    8|                     553|                          538|                    538|                 538|
|    9|                     524|                          515|                    515|                 515|
|   10|                     631|                          382|                    382|                 382|
|   11|                    2014|                         1977|                   1977|                1977|
|   12|                    1011|                          992|                    992|                 992|
|   13|                     628|                          580|                    580|                 580|
|   14|                     648|                          390|                    386|                 386|
|   15|                     414|                          411|                    411|                 411|
|   16|                     101|                          100|                    100|                 100|
|   17|                    1360|                         1287|                   1287|                1287|
|   18|                    1052|                          448|                    448|                 448|
|   19|                     425|                          171|                    171|                 171|
|   20|                     161|                          132|                    132|                 132|
|   21|                     425|                          233|                    233|                 233|
|   22|                    1654|                         1258|                   1256|                1256|
|   23|                     436|                           97|                     97|                  97|
|   24|                     270|                          214|                    214|                 214|
|   25|                      98|                           97|                     97|                  97|
|   26|                     466|                          460|                    459|                 459|
|   27|                     216|                          179|                    175|                 175|
|   28|                    1154|                          118|                    118|                 118|
|   29|                     432|                          163|                    163|                 163|
|   30|                    1299|                          975|                    973|                 973|

ActiGraph. (n.d.). What are counts?: ActiGraph Support. Retrieved from <https://help.theactigraph.com/entries/20723176-What-are-counts->

Choi, L., Liu, Z., Matthews, C. E., and Buchowski, M. S. (2011). Validation of Accelerometer Wear and Nonwear Time Classification Algorithm. *Medicine & Science in Sports & Exercise*, *43*(2), 357–364. <http://doi.org/10.1249/MSS.0b013e3181ed61a3>

Domelen, D. R. V. (2015). *accelerometry: Functions for Processing Minute-to-Minute Accelerometer Data*. Retrieved from <http://cran.r-project.org/package=accelerometry>

Fitbit. (n.d.). Help article: What are active minutes? Retrieved from [https://help.fitbit.com/articles/en{\\\_}US/Help{\\\_}article/What-are-very-active-minutes/](https://help.fitbit.com/articles/en{\_}US/Help{\_}article/What-are-very-active-minutes/)

R Core Team. (2015). *R: A Language and Environment for Statistical Computing*. Vienna, Austria: R Foundation for Statistical Computing. Retrieved from <https://www.r-project.org/>

Troiano, R. P., Berrigan, D., Dodd, K. W., Mâsse, L. C., Tilert, T., and Mcdowell, M. (2008). Physical Activity in the United States Measured by Accelerometer. *Medicine & Science in Sports & Exercise*, *40*(1), 181–188. <http://doi.org/10.1249/mss.0b013e31815a51b3>
