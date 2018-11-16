Hazardous substances assessment tool
================

As an example, the code in this repository produces an html version of
the plots and tables shown below.

### Assessment plots

Will put some introductory text here, including summary information
about the time series, including:

  - station name
  - latitude and longitude
  - region
  - MSTAT
  - compartment
  - determinand
  - units
  - species (if biota)
  - matrix
  - extraction date

<br>

#### Assessment plot

![](README_files/figure-gfm/assessment_plot-1.png)<!-- -->

#### Trend with data

![](README_files/figure-gfm/data_plot-1.png)<!-- -->

#### Auxiliary data

![](README_files/figure-gfm/auxiliary_data-1.png)<!-- -->

#### Assessments (related compounds)

![](README_files/figure-gfm/multi_assessment-1.png)<!-- -->

#### Data (related compounds)

![](README_files/figure-gfm/multi_data-1.png)<!-- -->

#### Statistical analysis

<br>

**Trend assessment**

Analysis of
variance

``` 
                Df      AIC     AICc   Log lik Deviance     Chisq Chi df Pr(>Chisq)
mean             1 204.6793 206.9293 -99.33965 198.6793        NA     NA         NA
linear           2 202.0944 206.6659 -97.04722 194.0944 4.5848626      1 0.03225556
smooth (df = 2)  3 198.5983 206.9317 -94.29917 188.5983 5.4960856      1 0.01905909
smooth (df = 3)  4 199.7584 214.1584 -93.87920 187.7584 0.8399548      1 0.35940969
```

<br>

Change in log
concentration

``` 
              Year start Year end  Fit start  Fit end    Change Std error         t   Pr(>|t|)
overall             1997     2013  0.1100925 -3.52615 -3.636243  1.610459 -2.257893 0.05034969
last 20 years       1998     2013 -0.1323237 -3.52615 -3.393827  1.503095 -2.257893 0.05034969
```

<br>

**Status assessment**

No assessment criteria <br>
