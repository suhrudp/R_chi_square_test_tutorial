# PEARSON'S CHI-SQUARE TEST

## **LOAD LIBRARIES**

```{r}
# Composite super-package with all the good stuff
library(tidyverse)

# For visualizing data and running statistical tests
library(ggstatsplot)

# To get summary statistics
library(summarytools)

# To create publication ready tables
library(gtsummary)
```

## **IMPORT DATA**

```{r}
# Import data from a CSV file
df <- read.csv(file.choose())
# Use read_excel from the `readxl` library to read Excel files

# Attach data for easy calling of variables
attach(df)

# Get the first 6 rows of the dataframe
head(df)

# Get the last 6 rows of the dataframe
tail(df)
```

## **SUMMARY STATISTICS**

```{r}
# Get exploratory results for our data
summ <- dfSummary(df)

# Generate crosstabs
table <- tbl_cross(data = df,
                   row = Training,
                   col = Dance,
                   percent = "row")

# Print our table
table
```

## **ASSUMPTIONS**

1.  The variables are categorical.

2.  All observations are independent.

3.  Cells in the table are mutually exclusive.

4.  Expected value of cells should be greater than or equal to 5 in at least 80% of cells.

## **CHI-SQUARE TEST**

```{r}
# Performing Pearson's chi-square test
chisq.test(Training, Dance)
```

## VISUALIZE TEST RESULTS

```{r}
# Plotting a bar plot with chi-square test results incorporated
plot1 <- ggbarstats(data = df,
                    x = "Training",
                    y = "Dance")

# Print the plot
plot1

# Plotting a pie chart with chi-square test results incorporated
plot2 <- ggpiestats(data = df,
                    x = "Training",
                    y = "Dance")

# Print the plot
plot2
```
