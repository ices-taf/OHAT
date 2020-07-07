Hazardous substances assessment tool
================

As an example, the code in this repository produces an html version of
the plots and tables shown below. The link to this assessment is here:

<https://ocean.ices.dk/oat/OAT/GettrResult?seriesID=Belgium%20BCP%20HCHA%20Crangon%20crangon&matrix=Biota>

and can be accessed via <https://ocean.ices.dk/ohat/>

### Assessment plots and statistical analysis

This report provides details of the assessment of alpha-HCH
concentrations in common shrimp at station BCP.

<ul>

<li class="gap">

Timeseries metadata. Key information about the timeseries.

</li>

<li class="gap">

Assessment plot. The fitted trend (solid line) with pointwise 90%
confidence bands (grey shaded areas). The trend is plotted on the log
scale, with the axis labels back-transformed for ease of interpretation.
The points are the annual medians of the individual log concentration
measurements.

</li>

<li class="gap">

Trend with data. The fitted trend with pointwise 90% confidence bands.
The points are the individual concentration measurements, with a \<
denoting a less-than value.

</li>

<li class="gap">

Auxiliary data. The individual concentration measurements with
supporting information: mean length of the individuals in the sample;
dry weight (%) of the sample; lipid weight (%) of the sample.

</li>

<li class="gap">

Assessment (related compounds). Assessment plots for all the compounds
in the same chemical group.

</li>

<li class="gap">

Data (related compounds). A scatter plot matrix of the individual
concentration measurements for all the compounds in the same chemical
group.

</li>

</ul>

<br>

#### Timeseries metadata

<br>

<ul>

<li>

OSPAR region: 2

</li>

<li>

Region: Southern North Sea

</li>

<li>

Station code: BCP

</li>

<li>

Station name: BCP

</li>

<li>

Station latitude: 51.33

</li>

<li class="gap">

Station longitude: 2.83

</li>

<li>

Media: biota

</li>

<li>

Species latin name: Crangon crangon

</li>

<li>

Species common name: common shrimp

</li>

<li class="gap">

Matrix: tail muscle

</li>

<li>

Determinand code: HCHA

</li>

<li>

Determinand name: alpha-HCH

</li>

<li class="gap">

Units: μg kg<sup>-1</sup> lipid weight

</li>

<li>

Extraction: 10 October 2019

</li>

</ul>

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

Analysis of variance

``` 
                Df      AIC     AICc   Log lik Deviance     Chisq Chi df Pr(>Chisq)
mean             1 204.6195 206.8695 -99.30974 198.6195        NA     NA         NA
linear           2 202.0379 206.6093 -97.01896 194.0379 4.5815551      1 0.03231787
smooth (df = 2)  3 198.5272 206.8605 -94.26358 188.5272 5.5107525      1 0.01889991
smooth (df = 3)  4 199.6921 214.0921 -93.84607 187.6921 0.8350185      1 0.36082538
```

<br>

Change in log concentration

``` 
              Year start Year end  Fit start   Fit end    Change Std error         t   Pr(>|t|)
overall             1997     2013  0.1088056 -3.517836 -3.626641  1.608194 -2.255102 0.05057986
last 20 years       1999     2013 -0.3747466 -3.517836 -3.143089  1.393768 -2.255102 0.05057986
```

<br>

**Status assessment**

No assessment criteria <br>

### how to build this file

this file was created using

``` r
rmarkdown::render("README.Rmd")
```
