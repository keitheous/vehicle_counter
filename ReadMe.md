# Vehicle Counter
---
## Problem
A small city government recently installed pneumatic sensors that counts vehicles across two traffic lanes.

image 1

The first pneumatic rubber hose (sensor A) stretches across both lanes of traffic (North and South Bound) while the second (sensor B), on one lane (South Bound). The sensors were left to run for 5 days in a row.

### Reading the data in AA / AB format
From the raw data provided, a line consist of two parts; the sensor (A or B) and the time from midnight of the a particular day (out of five days) in mili-seconds.

image 2

<!-- A98186
A98333
A499718
A499886
A638379
B638382
A638520
B638523 -->

Take for example a fraction of the raw data here, the first two lines indicate a vehicle's first axle passing through sensor A (North Bound) 98.186 seconds past midnight. The second line which follows shortly after, at 98.333s, is the second axle of the same vehicle. When converted to a more familiar time format (hour:minute:second), both axles were recorded at 00:01:38, with just slight difference in mili-seconds (0.147ms). All vehicle passing through sensor A would have an AA format in two lines.

Since Sensor A stretches across both lanes and Sensor B only on one lane, vehicle traveling on the South Bound would be recorded with an ABAB format in four lines. Hence, line 5 to 8 indicate one vehicle passing through sensor B. The first axle occurred at B638382 while the second at B638523, 10 minutes and 38 seconds pass midnight with a few mili-seconds apart.

<!-- A86328771
B86328774
A86328899
B86328902
A582668
B582671
A582787
B582789 -->

When the length of the miliseconds drop as such, its an indication of a new day as the data is recorded from midnight.

### Objectives
The city has asked for the data to be processed in order to obtain the following requirements for the five days across both lanes.

| Count / Distribution |
 --- | ---| --- | ---
     | North Bound (AA Sensor) | South Bound (AB Sensor) | Limitation
 --- | --- | --- | ---
  1. | per hour                | per hour                | 5 days     
  2. | per 30min               | per 30min               | 5 days     
  3. | per 20min               | per 20min               | 5 days     
  4. | per 15min               | per 15min               | 5 days     
  5. | peaks - 3 peaks/day     | peaks - 3 peaks/day     | 5 days     
  6. | Morning VS Evening      | Morning VS Evening      | 5 days     
     | North Bound (AA Sensor)  | South Bound (AB Sensor) | Limitation
 --- | --- | --- |---
  7. | speed range/ average    | speed range/ average    | 5 days     
  8. | distance user's choice  | distance user's choice  | 5 days     
