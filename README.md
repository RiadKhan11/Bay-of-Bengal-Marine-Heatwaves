# Bay-of-Bengal-Marine-Heatwaves
# Marine Heatwave Analysis in the Bay of Bengal

This project calculates Marine Heatwave (MHW) events using daily sea surface temperature (SST) data from NOAA OI SST V2 for the Bay of Bengal.

## Methodology

- Dataset: NOAA OI SST V2 High Resolution SST
- Region:
  - Longitude: 80°E–90°E
  - Latitude: 5°N–22°N
- Temporal resolution: Daily SST
- Period analyzed: 2014–2023

Marine heatwave detection follows the 90th percentile threshold approach.

An MHW event is detected when:

SST > 90th percentile threshold

for at least 5 consecutive days.

## Publication
Kundu, R., Khan, M. R., Rahman, S., & Saha, G. K. (2024). Marine heat waves in a low-lying country: Occurrence, computation and impact. Journal of Naval Architecture and Marine Engineering, 21(2), 117–124. https://doi.org/10.3329/jname.v21i2.75296
