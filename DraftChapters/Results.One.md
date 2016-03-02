Results.One
================
Ernesto Ramirez
January 27, 2016

-   [Results](#results)
    -   [Participants.](#participants.)
    -   [Fitbit Devices](#fitbit-devices)
    -   [Usage, Wear Time, and Consistency](#usage-wear-time-and-consistency)
    -   [Physical Activity Variables](#physical-activity-variables)
    -   [Guidelines Classification](#guidelines-classification)
    -   [Step Classification](#step-classification)
    -   [Trend](#trend)

Results
=======

### Participants.

Participants were recruited between June and August 2015. Thirty-seven individuals responded to recruitment postings and expressed an interest in participating in the study. Of the 37 individuals who expressed interest, 33 completed the screening process for inclusion in the study. All 33 met the inclusion criteria and were asked to schedule the interview and connect their Fitbit data to Fitabase. Thirty-two individuals scheduled interviews and connected their Fitbit data to Fitabase, however two participants were not able to complete the interview due to time constraints. The Fitabase data connection was deleted for the two participants who were not able to complete the interview. In total, 30 participants fully participated in the current study.

Table \[TK\] shows the demographic information for the sample that completed the study. The sample consisted of 11 (37%) men and 19 women (63%). Participants were between 23 and 60 years old, with a mean age of 36.60 years. The majority of participants reported that they were of Caucasian race/ethnicity (73%), were college educated (80% completed college or graduate degree), and worked full time (83%). Half the sample reported being married with another 40% reporting as “Single and Never Married.” Additionally, 33% of the sample reported a household income in excess of $100,000. Median income was $80,000 - $89,000 (one participant abstained from reporting household income information). Height and weight was self-reported and BMI was calculated. Participants had a BMI range of 17.28 to 59.67 kg/m2, with a mean of 25.85 kg/m2. Two participants were classified as “underweight” (6.67%, BMI &lt; 25kg/m<sup>2</sup>), 24 participants (80%) were classified as “normal weight” (BMI = 25-30kg/m<sup>2</sup>), two participants were classified as Obese Level I (BMI = 30-35kg/m<sup>2</sup>), and two participants were classified as “Obese Level III (BMI &gt; 40kg/m<sup>2</sup>)”.

### Fitbit Devices

As previously mentioned, at the time of this study there were six different Fitbit devices available for purchase. Each of the six available devices were represented in the data set, with an additional device that is no longer available for purchase also represented (Ultra). In total, six participants were using the ChargeHR, six participants were using the Zip, five participants were using the Flex, five were using the One, two participants were using the Surge, and one participant was using the Ultra.

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/demographics.table.rdata")
kable(demographics.table, caption = "Table [TK]: Participants' Demographics and Characteristics")
```

|   ID| Sex    |  Age|    BMI| Ethnicity                        | Education                                 | Marital Status             | Employment Status                        | Household Income | Fitbit Type |
|----:|:-------|----:|------:|:---------------------------------|:------------------------------------------|:---------------------------|:-----------------------------------------|:-----------------|:------------|
|    1| Female |   24|  21.58| Caucasian                        | Completed College or University           | Single and Never Married   | Part-time (16-35 hours)                  | $10,000-$19,000  | One         |
|    2| Male   |   28|  21.85| Caucasian                        | Completed College or University           | Married                    | Full-time (+36 hours)                    | $90,000-$99,000  | One         |
|    3| Male   |   35|  59.67| Caucasian                        | Completed College or University           | Single and Never Married   | Full-time (+36 hours)                    | $30,000-$39,000  | One         |
|    4| Female |   25|  17.28| Caucasian                        | Some College or Vocational Training       | Single and Never Married   | Part-time (16-35 hours)                  | $10,000-$19,000  | Charge      |
|    5| Male   |   34|  23.13| Caucasian                        | Completed Graduate or Professional Degree | Married                    | Full-time (+36 hours)                    | $80,000-$89,000  | Zip         |
|    6| Female |   29|  22.39| Caucasian                        | Completed Graduate or Professional Degree | Single and Never Married   | Full-time (+36 hours)                    | $50,000-$59,000  | Charge      |
|    7| Female |   52|  20.30| Caucasian, African American      | Completed Graduate or Professional Degree | Married                    | Full-time (+36 hours)                    | &gt; $100,000    | Flex        |
|    8| Male   |   26|  30.81| Caucasian                        | Completed Graduate or Professional Degree | Living with Partner        | None or Less Than Part-time (0-15 hours) | $30,000-$39,000  | Flex        |
|    9| Female |   23|  18.24| Caucasian                        | Completed College or University           | Single and Never Married   | Full-time (+36 hours)                    | $40,000-$49,000  | ChargeHR    |
|   10| Female |   36|  23.29| Caucasian, Asian-American        | Completed Graduate or Professional Degree | Single and Never Married   | Part-time (16-35 hours)                  | &gt; $100,000    | Surge       |
|   11| Male   |   48|  24.27| Caucasian                        | Completed Graduate or Professional Degree | Married                    | Full-time (+36 hours)                    | &gt; $100,000    | Ultra       |
|   12| Male   |   25|  21.92| Caucasian                        | Completed Graduate or Professional Degree | Single and Never Married   | Full-time (+36 hours)                    | $30,000-$39,000  | One         |
|   13| Female |   34|  27.44| Hispanic                         | Completed Graduate or Professional Degree | Married                    | Full-time (+36 hours)                    | $80,000-$89,000  | Zip         |
|   14| Male   |   31|  24.34| Caucasian                        | Completed College or University           | Single and Never Married   | Full-time (+36 hours)                    | $60,000-$69,000  | ChargeHR    |
|   15| Female |   42|  23.24| Caucasian                        | Completed Graduate or Professional Degree | Married                    | Full-time (+36 hours)                    | &gt; $100,000    | Flex        |
|   16| Female |   40|  23.69| Caucasian                        | Completed Graduate or Professional Degree | Married                    | Full-time (+36 hours)                    | &gt; $100,000    | ChargeHR    |
|   17| Female |   27|  28.32| Caucasian                        | Completed Graduate or Professional Degree | Single and Never Married   | Full-time (+36 hours)                    | &gt; $100,000    | One         |
|   18| Male   |   58|  24.80| Caucasian                        | Some College or Vocational Training       | Married                    | Full-time (+36 hours)                    | &gt; $100,000    | Flex        |
|   19| Female |   60|  29.05| Caucasian                        | Some High School                          | Married                    | Part-time (16-35 hours)                  | $80,000-$89,000  | Zip         |
|   20| Male   |   34|  24.27| Asian-American, Pacific Islander | Completed Graduate or Professional Degree | Married                    | Full-time (+36 hours)                    | &gt; $100,000    | ChargeHR    |
|   21| Female |   32|  29.53| Caucasian                        | Completed Graduate or Professional Degree | Single and Never Married   | Full-time (+36 hours)                    | $40,000-$49,000  | Zip         |
|   22| Female |   38|  25.60| Hispanic                         | Completed College or University           | Married                    | Full-time (+36 hours)                    | $90,000-$99,000  | Zip         |
|   23| Female |   50|  20.17| Caucasian                        | Some College or Vocational Training       | Married                    | Full-time (+36 hours)                    | &gt; $100,000    | Flex        |
|   24| Female |   25|  19.66| Caucasian                        | Completed College or University           | Single and Never Married   | Full-time (+36 hours)                    | $30,000-$39,000  | Charge      |
|   25| Female |   28|  21.30| Caucasian                        | Completed College or University           | Single and Never Married   | Full-time (+36 hours)                    | $40,000-$49,000  | ChargeHR    |
|   26| Female |   50|  30.11| Caucasian                        | Completed Graduate or Professional Degree | Widowed/Divorced/Separated | Full-time (+36 hours)                    | $80,000-$89,000  | Charge      |
|   27| Female |   49|  25.23| Hispanic                         | Completed College or University           | Married                    | Full-time (+36 hours)                    | NA               | Charge      |
|   28| Male   |   40|  47.49| Hispanic                         | Some College or Vocational Training       | Widowed/Divorced/Separated | Full-time (+36 hours)                    | $80,000-$89,000  | Surge       |
|   29| Male   |   43|  27.12| Caucasian                        | Some College or Vocational Training       | Married                    | Full-time (+36 hours)                    | $90,000-$99,000  | Zip         |
|   30| Female |   32|  19.39| Hispanic                         | Completed College or University           | Married                    | Full-time (+36 hours)                    | &gt; $100,000    | ChargeHR    |

### Usage, Wear Time, and Consistency

*Usage*. There was a wide range for the length of time participants had been using a Fitbit device. To simplify understanding the the term, "Fitbit user period" is used to describe the total length of time a participant has been in identified as a user with the Fitbit ecosystem, from their initial sign-up with Fitbit until the date of their interview. It is possible that the Fitbit user period does not accurately reflect the total time a participant was using a Fitbit device. As stated previously, there may be days when individuals lose their devices, forget to put them on, or choose not to wear the device. These days are included when the historical data is accessed. This complete historical file was used in order to calculate the Fitbit user period. Participants in this study ranged from relatively new to using a Fitbit device to long-term users, with a range of 98 to 2,014 days (mean = 688.00, SD = 487.54).

*Wear Time*. The initial review of all historical Fitbit data from the 30 participants included in this study resulted in a total of 20,637 participant-days of available Fitbit data.

The first pass for non-wear time removed all days with zero steps, this reduced the full data set to 17,232 person days.

Processing the minute-level MET data for each participant for algorithmacly determined non-wear time resulted in further reduction to 15,954 days.

A total of 757 minutes (0.003%) across all participants were classified as abnormal (&gt; 200 steps/min). A total of 13 days were classified as invalid due to potentially abnormal data. Abnormal data represented between 12% and 82% of the total step count for the censured days. These 13 days were removed from further analysis resulting in 15,941 valid participants days.

After the processing steps described above a total of 15,941 valid participant-days of data were used for analysis. The ratio of valid days to total available days per participant ranged from 10.22% to 99.27%. The number of days of data at each step in the previously described analysis is presented in Table \[TK\]. A visual representation of all valid wear days is presented in figure \[TK\].

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/wear.days.table.rdata")
kable(wear.days.table, caption = "Table [TK]: Valid Wear Time per Participant")
```

|   id|  Initial Available Days|  Valid Days (Steps)|  Valid Days (MET Processing)|  Valid Days (Censured)|  Valid Days (Final)|  Valid Days (Final) Percent|
|----:|-----------------------:|-------------------:|----------------------------:|----------------------:|-------------------:|---------------------------:|
|    1|                    1263|                1171|                         1096|                   1096|                1096|                   0.8677751|
|    2|                    1162|                1133|                         1062|                   1062|                1062|                   0.9139415|
|    3|                     802|                 775|                          686|                    686|                 686|                   0.8553616|
|    4|                     204|                 200|                          198|                    198|                 198|                   0.9705882|
|    5|                     497|                 495|                          472|                    472|                 472|                   0.9496982|
|    6|                     550|                 548|                          542|                    542|                 542|                   0.9854545|
|    7|                     187|                 183|                          181|                    181|                 181|                   0.9679144|
|    8|                     553|                 552|                          538|                    538|                 538|                   0.9728752|
|    9|                     524|                 524|                          515|                    515|                 515|                   0.9828244|
|   10|                     631|                 395|                          382|                    382|                 382|                   0.6053883|
|   11|                    2014|                2013|                         1977|                   1977|                1977|                   0.9816286|
|   12|                    1011|                1003|                          992|                    992|                 992|                   0.9812067|
|   13|                     628|                 603|                          580|                    580|                 580|                   0.9235669|
|   14|                     648|                 509|                          390|                    386|                 386|                   0.5956790|
|   15|                     414|                 414|                          411|                    411|                 411|                   0.9927536|
|   16|                     101|                 101|                          100|                    100|                 100|                   0.9900990|
|   17|                    1360|                1334|                         1287|                   1287|                1287|                   0.9463235|
|   18|                    1052|                 454|                          448|                    448|                 448|                   0.4258555|
|   19|                     425|                 287|                          171|                    171|                 171|                   0.4023529|
|   20|                     161|                 161|                          132|                    132|                 132|                   0.8198758|
|   21|                     425|                 409|                          233|                    233|                 233|                   0.5482353|
|   22|                    1654|                1280|                         1258|                   1256|                1256|                   0.7593712|
|   23|                     436|                 101|                           97|                     97|                  97|                   0.2224771|
|   24|                     270|                 235|                          214|                    214|                 214|                   0.7925926|
|   25|                      98|                  98|                           97|                     97|                  97|                   0.9897959|
|   26|                     466|                 464|                          460|                    459|                 459|                   0.9849785|
|   27|                     216|                 188|                          179|                    175|                 175|                   0.8101852|
|   28|                    1154|                 229|                          118|                    118|                 118|                   0.1022530|
|   29|                     432|                 258|                          163|                    163|                 163|                   0.3773148|
|   30|                    1299|                1115|                          975|                    973|                 973|                   0.7490377|

``` r
library(ggplot2)
load("~/Dropbox/Dissertation.Data/FitbitData/ProcessedData/Daily.Activity.Final.rdata")
ggplot(Daily.Activity.Final, aes(x=Date, y=Valid.Final)) +
  geom_bar(stat="identity") +
  scale_y_continuous(breaks=NULL, labels = NULL) +
  facet_grid(id ~.)
```

<img src="/Users/ernestoramirez/ER_Github/LivingWithData/DraftChapters/Results.One_files/figure-markdown_github/unnamed-chunk-3-1.png" alt="Valid Days per Participant"  />
<p class="caption">
Valid Days per Participant
</p>

*Consistency* Consistency of wearing and using the Fitbit device was measured by the coefficient of variation (CV) calculated on the binary Valid Day variable. The CV ranged from 8.55% to 246.33%.

*Streaks* Consecutive valid wear days were examined and calculated using the RLE2 (run length encoding) function included in the R "accelerometry" package (Domelen, 2015). Values for the minimum, maximum, meand, and stand deviation of consecutieve day streaks for wear and non-wear time are included in Table \[TK\]. The longest consecutive streak of valid wear time was 714 days. The longest consecutive streak of non-wear time was 597 days. Overall, participants had wore their fitbit and recorded a valid day for 20.70 consecutive days on average (SD = 48.17 days).

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/StreakTable.rdata")
kable(StreakTable, caption = "Table [TK]: Consecutive Non-Wear and Valid Wear Days per Participant")
```

|   id| values          |  Min Streak Length|  Max Streak Length|  Mean Streak Length|  SD Streak Length|
|----:|:----------------|------------------:|------------------:|-------------------:|-----------------:|
|    1| Non-Wear Days   |                  1|                 46|            5.758621|         9.5717410|
|    1| Valid Wear Days |                  1|                155|           37.793103|        45.3402843|
|    2| Non-Wear Days   |                  1|                 12|            1.515151|         1.8583899|
|    2| Valid Wear Days |                  1|                 81|           16.090909|        18.4988376|
|    3| Non-Wear Days   |                  1|                 10|            2.148148|         1.9561939|
|    3| Valid Wear Days |                  1|                 56|           12.703704|        14.6024418|
|    4| Non-Wear Days   |                  1|                  5|            3.000000|         2.8284271|
|    4| Valid Wear Days |                 47|                151|           99.000000|        73.5391052|
|    5| Non-Wear Days   |                  1|                  2|            1.086957|         0.2881041|
|    5| Valid Wear Days |                  2|                 90|           20.521739|        20.0087925|
|    6| Non-Wear Days   |                  1|                  5|            2.000000|         2.0000000|
|    6| Valid Wear Days |                 27|                222|          108.400000|        76.3498527|
|    7| Non-Wear Days   |                  1|                  5|            3.000000|         2.8284271|
|    7| Valid Wear Days |                 19|                162|           90.500000|       101.1162697|
|    8| Non-Wear Days   |                  1|                  3|            1.250000|         0.6215816|
|    8| Valid Wear Days |                  1|                231|           44.833333|        61.7396783|
|    9| Non-Wear Days   |                  1|                  2|            1.125000|         0.3535534|
|    9| Valid Wear Days |                  5|                155|           57.222222|        51.8212741|
|   10| Non-Wear Days   |                  2|                179|           41.500000|        68.1784423|
|   10| Valid Wear Days |                  5|                174|           54.571429|        60.4231113|
|   11| Non-Wear Days   |                  1|                  9|            1.947368|         2.3681611|
|   11| Valid Wear Days |                  4|                360|          104.052632|       104.4836370|
|   12| Non-Wear Days   |                  1|                  8|            2.714286|         2.5634798|
|   12| Valid Wear Days |                  6|                257|          124.000000|        85.4483971|
|   13| Non-Wear Days   |                  1|                 12|            2.285714|         2.8834503|
|   13| Valid Wear Days |                  1|                121|           29.000000|        31.8698009|
|   14| Non-Wear Days   |                  1|                108|            3.402597|        12.2863422|
|   14| Valid Wear Days |                  1|                 62|            5.078947|         9.0756277|
|   15| Non-Wear Days   |                  1|                  1|            1.000000|         0.0000000|
|   15| Valid Wear Days |                 23|                325|          137.000000|       164.0365813|
|   16| Non-Wear Days   |                  1|                  1|            1.000000|                NA|
|   16| Valid Wear Days |                100|                100|          100.000000|                NA|
|   17| Non-Wear Days   |                  1|                 14|            2.281250|         3.1951008|
|   17| Valid Wear Days |                  1|                714|           39.000000|       125.3866520|
|   18| Non-Wear Days   |                  1|                597|          120.800000|       266.2070623|
|   18| Valid Wear Days |                 18|                207|           89.600000|        83.2033653|
|   19| Non-Wear Days   |                  1|                 49|            3.968750|         7.4321668|
|   19| Valid Wear Days |                  1|                  6|            2.714286|         1.6006911|
|   20| Non-Wear Days   |                  2|                 11|            5.800000|         3.3466401|
|   20| Valid Wear Days |                  7|                 63|           22.000000|        21.9727103|
|   21| Non-Wear Days   |                  1|                 15|            2.370370|         2.3582008|
|   21| Valid Wear Days |                  1|                 12|            2.876543|         2.3204672|
|   22| Non-Wear Days   |                  1|                163|           24.875000|        49.3408215|
|   22| Valid Wear Days |                  3|                176|           73.882353|        53.2434061|
|   23| Non-Wear Days   |                  4|                335|          169.500000|       234.0523446|
|   23| Valid Wear Days |                 45|                 52|           48.500000|         4.9497475|
|   24| Non-Wear Days   |                  1|                 29|            2.333333|         5.6926090|
|   24| Valid Wear Days |                  1|                 29|            8.916667|         9.3618870|
|   25| Non-Wear Days   |                  1|                  1|            1.000000|                NA|
|   25| Valid Wear Days |                 17|                 80|           48.500000|        44.5477272|
|   26| Non-Wear Days   |                  1|                  3|            1.750000|         0.9574271|
|   26| Valid Wear Days |                 21|                293|          114.750000|       121.3215425|
|   27| Non-Wear Days   |                  1|                 27|            3.153846|         7.1861691|
|   27| Valid Wear Days |                  1|                 27|           13.461538|         9.0702387|
|   28| Non-Wear Days   |                  1|                409|           39.846154|       102.3893324|
|   28| Valid Wear Days |                  1|                 23|            4.370370|         5.1601144|
|   29| Non-Wear Days   |                  1|                131|            5.489796|        19.0078081|
|   29| Valid Wear Days |                  1|                 15|            3.326531|         2.9039324|
|   30| Non-Wear Days   |                  1|                170|            3.046729|        16.3933852|
|   30| Valid Wear Days |                  1|                 50|            9.009259|         9.9169404|

### Physical Activity Variables

*Steps*. For all valid days, participants in the currenty study totaled 154,546,189 steps. The mean across all participants was 9,694.87 steps per day (SD = 5,309.45). Per participant steps per valid day ranged from a 109 to 68,565 steps. Descriptive data on steps per valid day for each participant is shown in Table \[TK\].

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/StepDescriptives.Valid.Table.rdata")
kable(StepDescriptives.Valid.Table, caption = "Table [TK]: Physical Activity Desrciptives: Steps", row.names = FALSE)
```

| id               |      N|        sum|       mean|        sd|    min|    max|         se|
|:-----------------|------:|----------:|----------:|---------:|------:|------:|----------:|
| 1                |   1096|    6117774|   5581.911|  3742.404|    109|  26378|  113.04346|
| 2                |   1062|    9005887|   8480.120|  3766.051|    278|  31516|  115.56437|
| 3                |    686|    6670422|   9723.647|  4501.774|    818|  29741|  171.87854|
| 4                |    198|    3796671|  19175.106|  3346.568|  10761|  36110|  237.83026|
| 5                |    472|    4032322|   8543.055|  3562.972|   2080|  27093|  163.99906|
| 6                |    542|    7355677|  13571.360|  8651.764|    519|  68565|  371.62510|
| 7                |    181|    2166893|  11971.785|  2435.986|   2114|  20122|  181.06538|
| 8                |    538|    3859680|   7174.126|  4137.357|    778|  31615|  178.37415|
| 9                |    515|    4463372|   8666.742|  3567.156|   1402|  23600|  157.18766|
| 10               |    382|    5500498|  14399.209|  6992.028|    876|  50510|  357.74327|
| 11               |   1977|   22108231|  11182.717|  4767.966|    892|  32108|  107.23333|
| 12               |    992|   10693439|  10779.676|  5338.667|   1475|  34068|  169.50286|
| 13               |    580|    4865728|   8389.186|  3462.482|   1684|  25778|  143.77172|
| 14               |    386|    3463492|   8972.777|  5470.124|    538|  36033|  278.42200|
| 15               |    411|    3153450|   7672.628|  3620.344|    943|  26275|  178.57842|
| 16               |    100|    1154266|  11542.660|  4026.601|   4445|  22477|  402.66012|
| 17               |   1287|   11979724|   9308.255|  3841.638|    307|  25363|  107.08465|
| 18               |    448|    4264727|   9519.480|  2764.221|   3075|  20032|  130.59715|
| 19               |    171|    1869418|  10932.269|  2824.672|   2744|  30238|  216.00807|
| 20               |    132|     454920|   3446.364|  1797.157|    931|  13790|  156.42248|
| 21               |    233|    1746203|   7494.433|  3246.681|   3099|  28333|  212.69712|
| 22               |   1256|    9897362|   7880.065|  2951.719|    955|  30209|   83.28758|
| 23               |     97|    1023434|  10550.866|  3836.694|   3499|  19383|  389.55724|
| 24               |    214|    1981755|   9260.537|  4433.064|    630|  26375|  303.03804|
| 25               |     97|    1414063|  14577.969|  6205.594|   2494|  31499|  630.08262|
| 26               |    459|    8819535|  19214.673|  7606.288|   2462|  45415|  355.03114|
| 27               |    175|    1672674|   9558.137|  3645.119|   3259|  19954|  275.54513|
| 28               |    118|    1184513|  10038.246|  5406.228|   2969|  25944|  497.68367|
| 29               |    163|    1016640|   6237.055|  3739.960|   2104|  24574|  292.93631|
| 30               |    973|    8813419|   9057.985|  3924.540|    994|  32573|  125.81499|
| All Participants |  15941|  154546189|   9694.887|  5309.449|    109|  68565|   42.05249|

``` r
library(ggplot2)
ggplot(StepDescriptives.Valid.Table, aes(x=id, y=mean)) + geom_bar(stat="identity")
```

![](/Users/ernestoramirez/ER_Github/LivingWithData/DraftChapters/Results.One_files/figure-markdown_github/unnamed-chunk-5-1.png)<!-- -->

*Distance*. For all valid days, participants in the currenty study totaled 111,676.76 km traveled. The mean across all participants was 7.01 km per day (SD = 3.91 km per day). Per participant kilometers traveled per day ranged from 0.07 to 56.30 km per day. Descriptive data for distance traveled per valid day per participant is shown in Table \[TK\].

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/DistanceDescriptives.Valid.Table.rdata")
kable(DistanceDescriptives.Valid.Table, caption = "Table [TK]: Physical Activity Desrciptives: Distance", row.names = FALSE)
```

| id               |      N|        sum|       mean|        sd|   min|    max|         se|
|:-----------------|------:|----------:|----------:|---------:|-----:|------:|----------:|
| 1                |   1096|    4175.99|   3.810210|  2.570295|  0.07|  17.94|  0.0776386|
| 2                |   1062|    6557.16|   6.174350|  2.747999|  0.20|  22.91|  0.0843246|
| 3                |    686|    5064.02|   7.381953|  3.418480|  0.62|  22.57|  0.1305182|
| 4                |    198|    2793.83|  14.110252|  2.435223|  7.79|  26.14|  0.1730638|
| 5                |    472|    3394.85|   7.192479|  3.180411|  1.67|  21.70|  0.1463903|
| 6                |    542|    5468.39|  10.089280|  6.952843|  0.36|  56.30|  0.2986502|
| 7                |    181|    1485.95|   8.209668|  1.687603|  1.44|  14.06|  0.1254385|
| 8                |    538|    3018.72|   5.611004|  3.243186|  0.61|  24.76|  0.1398237|
| 9                |    515|    3587.52|   6.966058|  2.869922|  1.13|  18.95|  0.1264639|
| 10               |    382|    3792.40|   9.927749|  4.740940|  0.60|  34.40|  0.2425676|
| 11               |   1977|   16748.87|   8.471861|  3.409136|  0.64|  22.27|  0.0766728|
| 12               |    992|    7820.39|   7.883458|  4.124356|  1.04|  26.76|  0.1309484|
| 13               |    580|    3401.84|   5.865241|  2.451290|  1.18|  17.88|  0.1017843|
| 14               |    386|    2792.93|   7.235570|  4.431220|  0.43|  29.19|  0.2255432|
| 15               |    411|    2479.10|   6.031873|  3.157425|  0.69|  21.28|  0.1557443|
| 16               |    100|     781.62|   7.816200|  2.727859|  3.01|  15.25|  0.2727859|
| 17               |   1287|    7794.46|   6.056302|  2.498956|  0.20|  16.49|  0.0696577|
| 18               |    448|    3639.16|   8.123125|  2.768668|  2.46|  19.87|  0.1308073|
| 19               |    171|    1302.29|   7.615731|  1.980752|  1.90|  21.02|  0.1514719|
| 20               |    132|     340.70|   2.581061|  1.347112|  0.70|  10.31|  0.1172510|
| 21               |    233|    1274.91|   5.471717|  2.374114|  2.24|  20.51|  0.1555334|
| 22               |   1256|    6086.60|   4.846019|  1.847446|  0.58|  18.60|  0.0521287|
| 23               |     97|     710.66|   7.326392|  2.673882|  2.42|  13.43|  0.2714916|
| 24               |    214|    1497.53|   6.997804|  3.346605|  0.48|  19.91|  0.2287692|
| 25               |     97|    1021.57|  10.531650|  4.696764|  1.75|  23.04|  0.4768842|
| 26               |    459|    5792.14|  12.619041|  5.042830|  1.61|  30.03|  0.2353791|
| 27               |    175|    1125.33|   6.430457|  2.456113|  2.19|  13.39|  0.1856647|
| 28               |    118|     937.52|   7.945085|  4.336650|  2.29|  20.19|  0.3992210|
| 29               |    163|     791.65|   4.856749|  3.018003|  1.61|  18.71|  0.2363883|
| 30               |    973|    5998.66|   6.165118|  2.870964|  0.65|  25.24|  0.0920389|
| All Participants |  15941|  111676.76|   7.005631|  3.908973|  0.07|  56.30|  0.0309603|

*Activity Intensity Classification*. Activity intensity is classified into one of four categories by Fitbit: Sedentary, Lightly Active, Fairly Active (moderate), and Very Active (virogous). For the purposes of this analysis, sedentary time is not included as it may include time spent asleep and not a valid indication of inactivity during waking hours.

For all valid days, participants in the currenty study totaled 2,750,509 minutes of light activity. The mean amount of light activity across all participants was 172.54 minutes per day (SD = 76.96 minutes per day). Per participant minutes of light activity ranged from 15 to 890 minutes per valid day. Descriptive data for light activity per valid day per participant is shown in Table \[TK\].

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/LightActiveMinutesDescriptives.Valid.Table.rdata")
kable(LightActiveMinutesDescriptives.Valid.Table, caption = "Table [TK]: Physical Activity Desrciptives: Light Activity", row.names = FALSE)
```

| id               |      N|      sum|       mean|        sd|  min|  max|         se|
|:-----------------|------:|--------:|----------:|---------:|----:|----:|----------:|
| 1                |   1096|   239553|  218.57026|  66.60009|   41|  470|  2.0117291|
| 2                |   1062|   186189|  175.31921|  57.27652|   44|  387|  1.7575771|
| 3                |    686|    81230|  118.41108|  64.03042|   15|  407|  2.4446929|
| 4                |    198|    68150|  344.19192|  94.13735|  160|  636|  6.6900503|
| 5                |    472|    72038|  152.62288|  55.40779|   39|  419|  2.5503502|
| 6                |    542|    96942|  178.85978|  67.00458|   28|  438|  2.8780933|
| 7                |    181|    27284|  150.74033|  61.59585|   66|  416|  4.5783836|
| 8                |    538|    67450|  125.37175|  44.19648|   35|  388|  1.9054456|
| 9                |    515|    92823|  180.23883|  74.25838|   23|  839|  3.2722151|
| 10               |    382|    64914|  169.93194|  58.25535|   76|  447|  2.9806029|
| 11               |   1977|   425789|  215.37127|  59.19231|   49|  890|  1.3312571|
| 12               |    992|   193141|  194.69859|  64.49747|   44|  448|  2.0477969|
| 13               |    580|    73087|  126.01207|  48.37574|   46|  326|  2.0086933|
| 14               |    386|    47393|  122.77979|  73.28688|   20|  636|  3.7302040|
| 15               |    411|    50330|  122.45742|  39.24644|   36|  244|  1.9358840|
| 16               |    100|    30718|  307.18000|  76.03021|  172|  521|  7.6030215|
| 17               |   1287|   178781|  138.91298|  33.71611|   54|  313|  0.9398277|
| 18               |    448|   113994|  254.45089|  68.15243|   78|  456|  3.2198997|
| 19               |    171|    26106|  152.66667|  56.28081|   32|  355|  4.3039010|
| 20               |    132|    19187|  145.35606|  47.60350|   23|  295|  4.1433532|
| 21               |    233|    20084|   86.19742|  37.73780|   34|  229|  2.4722858|
| 22               |   1256|   209899|  167.11704|  60.28301|   53|  403|  1.7009835|
| 23               |     97|    19894|  205.09278|  64.19422|   47|  383|  6.5179352|
| 24               |    214|    35038|  163.72897|  61.08519|   34|  335|  4.1756976|
| 25               |     97|    27968|  288.32990|  79.40963|   78|  551|  8.0628268|
| 26               |    459|   107567|  234.35076|  79.40132|   87|  724|  3.7061360|
| 27               |    175|    49723|  284.13143|  60.45317|   96|  496|  4.5698303|
| 28               |    118|    16535|  140.12712|  58.95392|   50|  395|  5.4271484|
| 29               |    163|    17461|  107.12270|  40.67847|   43|  237|  3.1861837|
| 30               |    973|    91241|   93.77287|  37.75567|   32|  317|  1.2103912|
| All Participants |  15941|  2750509|  172.54307|  76.96479|   15|  890|  0.6095850|

For all valid days, participants in the currenty study totaled 1,153,304 minutes of moderate activity. The mean amount of moderate activity across all participants was 72.35 minutes per day (SD = 46.37 minutes per day). Per participant minutes of moderate activity ranged from 0 to 436 minutes per valid day. Descriptive data for moderate activity per valid day per participant is shown in Table \[TK\].

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/FairlyActiveMinutesDescriptives.Valid.Table.rdata")
kable(FairlyActiveMinutesDescriptives.Valid.Table, caption = "Table [TK]: Physical Activity Desrciptives: Moderate Activity", row.names = FALSE)
```

| id               |      N|      sum|        mean|         sd|  min|  max|         se|
|:-----------------|------:|--------:|-----------:|----------:|----:|----:|----------:|
| 1                |   1096|    50252|   45.850365|  31.463155|    0|  233|  0.9503793|
| 2                |   1062|   114620|  107.928437|  48.332267|    0|  436|  1.4831153|
| 3                |    686|    41013|   59.785714|  33.155275|    0|  294|  1.2658743|
| 4                |    198|     7547|   38.116162|  29.073539|    1|  141|  2.0661665|
| 5                |    472|    32767|   69.421610|  38.518672|    0|  308|  1.7729656|
| 6                |    542|    35438|   65.383764|  50.579601|    0|  278|  2.1725799|
| 7                |    181|    10309|   56.955801|  35.604123|    5|  156|  2.6464336|
| 8                |    538|    27221|   50.596654|  29.640976|    0|  163|  1.2779132|
| 9                |    515|    24563|   47.695146|  44.257144|    0|  235|  1.9502028|
| 10               |    382|    41160|  107.748691|  55.571048|    0|  430|  2.8432622|
| 11               |   1977|   183838|   92.988366|  45.294497|    0|  436|  1.0186902|
| 12               |    992|    74624|   75.225807|  33.367317|    0|  272|  1.0594134|
| 13               |    580|    41203|   71.039655|  35.645542|    0|  230|  1.4801006|
| 14               |    386|    31031|   80.391192|  44.818883|    0|  335|  2.2812211|
| 15               |    411|    15587|   37.924574|  23.585582|    0|  193|  1.1633909|
| 16               |    100|     2162|   21.620000|  19.424955|    0|   71|  1.9424955|
| 17               |   1287|    95801|   74.437451|  30.194789|    0|  203|  0.8416717|
| 18               |    448|    39384|   87.910714|  46.010368|    0|  237|  2.1737856|
| 19               |    171|    21060|  123.157895|  49.087361|    0|  190|  3.7538043|
| 20               |    132|      267|    2.022727|   6.167467|    0|   38|  0.5368091|
| 21               |    233|    12826|   55.047210|  30.522920|    0|  145|  1.9996230|
| 22               |   1256|    97581|   77.691879|  35.624645|    0|  242|  1.0052075|
| 23               |     97|     6438|   66.371134|  59.835246|    0|  217|  6.0753488|
| 24               |    214|    10548|   49.289720|  40.676442|    0|  194|  2.7805843|
| 25               |     97|     4362|   44.969072|  31.368593|    0|  156|  3.1849980|
| 26               |    459|    59819|  130.324619|  68.370437|    0|  382|  3.1912587|
| 27               |    175|     2822|   16.125714|  18.840717|    0|   71|  1.4242243|
| 28               |    118|     8416|   71.322034|  47.291762|    0|  348|  4.3535596|
| 29               |    163|     4892|   30.012270|  33.987468|    0|  167|  2.6621040|
| 30               |    973|    55753|   57.300103|  28.703292|    0|  217|  0.9201853|
| All Participants |  15941|  1153304|   72.348284|  46.368907|    0|  436|  0.3672562|

For all valid days, participants in the currenty study totaled 540,104 minutes of vigorous activity. The mean amount of vigorous activity across all participants was 33.88 minutes per day (SD = 36.94 minutes per day). Per participant minutes of light activity ranged from 0 to 422 minutes per valid day. Descriptive data for vigorous activity per valid day per participant is shown in Table \[TK\].

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/VeryActiveMinutesDescriptives.Valid.Table.rdata")
kable(VeryActiveMinutesDescriptives.Valid.Table, caption = "Table [TK]: Physical Activity Desrciptives: Vigorous Activity", row.names = FALSE)
```

| id               |      N|     sum|       mean|        sd|  min|  max|         se|
|:-----------------|------:|-------:|----------:|---------:|----:|----:|----------:|
| 1                |   1096|    7660|   6.989051|  10.82977|    0|   75|  0.3271251|
| 2                |   1062|   15388|  14.489642|  19.11539|    0|  182|  0.5865714|
| 3                |    686|   43724|  63.737609|  37.79867|    0|  191|  1.4431601|
| 4                |    198|   11579|  58.479798|  38.43720|    0|  241|  2.7316129|
| 5                |    472|   13020|  27.584746|  22.06921|    0|  115|  1.0158178|
| 6                |    542|   30100|  55.535055|  55.65299|    0|  422|  2.3905004|
| 7                |    181|    9413|  52.005525|  19.47748|    0|  108|  1.4477496|
| 8                |    538|   14071|  26.154275|  28.69866|    0|  224|  1.2372870|
| 9                |    515|   12906|  25.060194|  25.47040|    0|  142|  1.1223601|
| 10               |    382|   22567|  59.075916|  52.11039|    0|  340|  2.6661996|
| 11               |   1977|  101585|  51.383409|  41.19441|    0|  282|  0.9264777|
| 12               |    992|   42961|  43.307460|  34.16664|    0|  246|  1.0847920|
| 13               |    580|   15145|  26.112069|  24.31592|    0|  133|  1.0096634|
| 14               |    386|   19208|  49.761658|  50.63883|    0|  296|  2.5774486|
| 15               |    411|   11997|  29.189781|  24.24756|    0|  163|  1.1960442|
| 16               |    100|    2530|  25.300000|  25.95237|    0|  128|  2.5952365|
| 17               |   1287|   30785|  23.919969|  19.13923|    0|  166|  0.5335009|
| 18               |    448|    8974|  20.031250|  27.48136|    0|  262|  1.2983721|
| 19               |    171|    3368|  19.695906|  20.15210|    0|  231|  1.5410693|
| 20               |    132|     310|   2.348485|  10.83815|    0|   99|  0.9433396|
| 21               |    233|    6174|  26.497854|  25.78160|    0|  225|  1.6890086|
| 22               |   1256|   21588|  17.187898|  21.81870|    0|  171|  0.6156501|
| 23               |     97|    3293|  33.948454|  32.50845|    0|  110|  3.3007331|
| 24               |    214|    6767|  31.621495|  29.05542|    0|  160|  1.9861878|
| 25               |     97|    3017|  31.103093|  33.40736|    0|  202|  3.3920036|
| 26               |    459|   36371|  79.239651|  61.92106|    0|  275|  2.8902275|
| 27               |    175|    1296|   7.405714|  12.92200|    0|   74|  0.9768115|
| 28               |    118|    5464|  46.305085|  39.94023|    0|  186|  3.6767967|
| 29               |    163|    2818|  17.288344|  27.35517|    0|  173|  2.1426221|
| 30               |    973|   36025|  37.024666|  25.07129|    0|  193|  0.8037485|
| All Participants |  15941|  540104|  33.881438|  36.93933|    0|  422|  0.2925710|

Energy Expenditure - Calories <!-- probably want to create ee measure here --->

### Guidelines Classification

Minutes classified as moderate and vigorous activity intensity were totaled per day for each participant in order to examine how often participants met physical activity guidelines. Across the total sample, participants had fewer than 30 minutes of MVPA on 10.78% of valid days, obtained 30 to 59 minutes of MVPA on 12.90% of valid days, and had 60 minutes or more on 76.32% of valid days. Mean minutes of MVPA per day was 106.23 (SD = 67.01) with a range of 0 to 611 minutes. Per participant valid days for each of the guidelines categories (0-29min = did not meet guidelines, 30-59min = met guidelines, 60+ min = exceeded guidelines) are available in Table \[TK\].

*Note: 0 = did not meet 30min MVPA per day, 1 = 30-59 min MVPA per day, 2= 60+ min MVPA per day*

``` r
library(knitr)
load("~/Dropbox/Dissertation.Data/Data/MVPA.Guidelines.Table.Final.rdata")
kable(MVPA.Guidelines.Table.Final , caption = "Table [TK]: Physical Activity Guidelines", row.names = FALSE)
```

| id               |  Days\_0|  MeanMVPA\_0|  sdMVPA\_0|  Percent\_0|  Days\_1|  MeanMVPA\_1|  sdMVPA\_1|  Percent\_1|  Days\_2|  MeanMVPA\_2|  sdMVPA\_2|  Percent\_2|
|:-----------------|--------:|------------:|----------:|-----------:|--------:|------------:|----------:|-----------:|--------:|------------:|----------:|-----------:|
| 1                |      322|    15.602484|   9.073105|   0.2937956|      381|     43.97113|   8.852695|   0.3476277|      393|     91.94656|   32.11371|   0.3585766|
| 2                |       27|    16.148148|  10.298259|   0.0254237|       66|     47.50000|   8.980749|   0.0621469|      969|    130.48194|   56.30453|   0.9124294|
| 3                |       45|    12.200000|  10.250499|   0.0655977|       47|     44.61702|   8.601196|   0.0685131|      594|    138.20034|   54.41607|   0.8658892|
| 4                |        5|    20.000000|   7.176350|   0.0252525|       29|     47.75862|   8.144477|   0.1464646|      164|    107.56707|   32.51845|   0.8282828|
| 5                |       36|     6.666667|  10.139034|   0.0762712|       76|     47.97368|   7.330254|   0.1610169|      360|    116.39167|   34.67621|   0.7627119|
| 6                |       57|    15.754386|  10.301319|   0.1051661|       81|     46.48148|   8.906614|   0.1494465|      404|    150.68069|   79.75629|   0.7453875|
| 7                |        1|    22.000000|         NA|   0.0055249|       15|     47.33333|   8.877473|   0.0828729|      165|    115.09091|   35.84533|   0.9116022|
| 8                |       67|    12.805970|   9.781304|   0.1245353|      143|     46.07692|   8.344752|   0.2657993|      328|    103.18598|   40.86936|   0.6096654|
| 9                |      184|    10.896739|   9.634591|   0.3572816|       59|     42.32203|   9.012330|   0.1145631|      272|    121.20221|   39.77807|   0.5281553|
| 10               |       18|    14.833333|   7.972379|   0.0471204|       16|     43.87500|   9.401241|   0.0418848|      348|    180.33908|   80.61818|   0.9109948|
| 11               |       40|    19.725000|  11.430924|   0.0202327|       88|     47.10227|   8.917295|   0.0445119|     1849|    151.69767|   65.32859|   0.9352554|
| 12               |       29|    12.482759|   9.719717|   0.0292339|       83|     46.46988|   8.872178|   0.0836694|      880|    128.82500|   49.46580|   0.8870968|
| 13               |       50|    14.540000|  10.045224|   0.0862069|       66|     45.57576|   9.543521|   0.1137931|      464|    113.39009|   38.66667|   0.8000000|
| 14               |       25|    12.120000|  10.568507|   0.0647668|       31|     44.38710|   8.991394|   0.0803109|      330|    147.15152|   72.68353|   0.8549223|
| 15               |       64|     9.859375|  10.659026|   0.1557178|       99|     46.23232|   8.289197|   0.2408759|      248|     90.22581|   23.43113|   0.6034063|
| 16               |       38|     9.815789|   9.394810|   0.3800000|       30|     42.33333|   8.750698|   0.3000000|       32|     95.28125|   27.49808|   0.3200000|
| 17               |       65|    20.000000|   6.670832|   0.0505051|      166|     46.57831|   8.559412|   0.1289821|     1056|    111.32008|   31.92642|   0.8205128|
| 18               |       21|    20.285714|   6.798109|   0.0468750|       41|     46.39024|   9.687306|   0.0915179|      386|    119.24870|   36.44224|   0.8616071|
| 19               |        9|    16.888889|  11.493960|   0.0526316|       17|     41.52941|   8.979961|   0.0994152|      145|    162.55172|   33.35997|   0.8479532|
| 20               |      126|     1.523810|   4.909932|   0.9545455|        3|     40.00000|  10.148892|   0.0227273|        3|     88.33333|   25.50163|   0.0227273|
| 21               |       37|     8.459459|  10.215986|   0.1587983|       24|     45.12500|   9.538537|   0.1030043|      172|    102.34884|   32.25964|   0.7381974|
| 22               |       99|    11.969697|   9.571913|   0.0788217|      173|     48.07514|   8.038434|   0.1377389|      984|    111.45020|   37.11265|   0.7834395|
| 23               |       33|     9.939394|   8.912559|   0.3402062|        8|     40.75000|   8.779034|   0.0824742|       56|    162.08929|   49.79240|   0.5773196|
| 24               |       53|    10.943396|   9.485647|   0.2476636|       35|     45.25714|   8.096270|   0.1635514|      126|    120.24603|   50.56429|   0.5887850|
| 25               |       16|     9.062500|  10.076168|   0.1649485|       25|     45.44000|   9.170060|   0.2577320|       56|    108.89286|   47.77511|   0.5773196|
| 26               |       23|     9.869565|   9.411330|   0.0501089|       10|     47.20000|   7.927449|   0.0217865|      426|    224.15728|   80.90239|   0.9281046|
| 27               |      119|     8.176471|   8.566437|   0.6800000|       31|     43.96774|   8.919955|   0.1771429|       25|     71.28000|   12.38117|   0.1428571|
| 28               |        1|     0.000000|         NA|   0.0084746|       19|     47.94737|   7.720634|   0.1610169|       98|    132.33673|   59.68577|   0.8305085|
| 29               |       78|     5.410256|   8.319022|   0.4785276|       35|     46.34286|   7.719124|   0.2147239|       50|    113.32000|   41.40267|   0.3067485|
| 30               |       31|    15.387097|  10.355924|   0.0318602|      159|     46.96855|   7.590318|   0.1634121|      783|    107.06641|   37.02737|   0.8047276|
| All Participants |     1719|    11.811518|  10.202060|   0.1078351|     2056|     45.84339|   8.668526|   0.1289756|    12166|    129.77560|   58.52890|   0.7631893|

### Step Classification

Steps per valid day were classified according to commonly used criteria (<span class="citeproc-not-found" data-reference-id="Tudor-Locke2008a">**???**</span>). Across all participants 15.19% (2,422) of valid days were classified as sedentary, 22.45% (3,578) were classified as low activity, 21.93% (3,496) were classified as somewhat active, 18.71% (2,983) were classified as active, and 21.72% (3,462) were classified as very active. Per Participant daily step classification are visualized in figure \[TK\].

``` r
library(ggplot2)
load("~/Dropbox/Dissertation.Data/FitbitData/ProcessedData/Daily.Valid.Days.rdata")
StepCategories <- with(Daily.Valid.Days, table(id, StepCategory))
StepCategories.Percent <- as.data.frame(prop.table(StepCategories, 1))

ggplot(StepCategories.Percent, aes(id, Freq, fill=StepCategory)) + geom_bar(stat="identity")
```

<img src="/Users/ernestoramirez/ER_Github/LivingWithData/DraftChapters/Results.One_files/figure-markdown_github/unnamed-chunk-11-1.png" alt="Classification of Valid Days by Step Total per Participant"  />
<p class="caption">
Classification of Valid Days by Step Total per Participant
</p>

### Trend

Domelen, D. R. V. (2015). *accelerometry: Functions for Processing Minute-to-Minute Accelerometer Data*. Retrieved from <http://cran.r-project.org/package=accelerometry>
