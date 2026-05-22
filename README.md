# 📊 Statistical Analysis of Student Mental Health & Academic Performance
---

## 📌 Project Overview

This project explores the relationship between **sleeping hours** and **academic performance** among university students using R. The dataset was sourced from Kaggle and analyzed through descriptive statistics, distributional assessment, and bivariate relationship analysis.

**Dataset:** [Student Health – Kaggle](https://www.kaggle.com/datasets/ayeshasiddiqa123/student-health)

---

## 🎯 Objectives

- Summarize and describe key variables using exploratory descriptive analysis
- Assess whether academic performance follows a normal distribution
- Investigate the linear relationship between sleeping hours and academic performance



## 🗂️ Variables Used

|Variable | Type |
|---|---|
| `sleep_hours` | Numerical |
| `academic_performance` | Numerical |
| `academic_year` | Categorical |

---

## 🔍 Analysis Summary

### Part A – Exploratory Descriptive Analysis
- Computed mean, median, mode, standard deviation, variance, range, quartiles, IQR, and CV
- Found that **academic performance** (CV = 7.97%) is more consistent relative to its mean than **sleeping hours** (CV = 22.65%)
- Visualized distributions using boxplots and histograms

### Part B – Distributional Assessment
- Applied the **Empirical Rule**: 68.27% / 95.45% / 99.75% of scores fell within 1/2/3 standard deviations — closely matching the expected 68-95-99.7 rule
- **QQ-Plot** showed data points closely aligned to the reference line
- **Shapiro-Wilk Test**: W = 0.99965, p = 0.5574 → confirms normality (p > 0.05)

### Part C – Bivariate Relationship Analysis
- Scatter plot showed no visible trend between sleep and performance
- **Pearson Correlation Coefficient**: r = 0.003 (r² ≈ 0.000009) → negligible linear relationship
- Conclusion: sleeping hours and academic performance are essentially independent in this dataset

### Part D – Critical Reflection
- Sleep alone does not predict academic performance; other factors (study habits, motivation) likely play a larger role
- Discussed how inferential statistics extends findings beyond the sample
- Highlighted the value of data visualizations in communicating patterns

---

## 🛠️ Tools & Technologies

- **Language:** R
- **Libraries:** `ggplot2`
- **Methods:** Descriptive statistics, Empirical Rule, QQ-plot, Shapiro-Wilk test, Pearson correlation

---

## 📁 Project Structure

```
├── README.md
├── StatisticalAnalysisOnSleepAndPerformance.R 
├── student_mental_health.csv
└── Statistical_Analysis_Report_Sleep_Perform.pdf          
```

---

## 📈 Key Results

| Metric | Sleeping Hours | Academic Performance |
|---|---|---|
| Mean | 6.49 | 70.95 |
| Median | 6.48 | 71.00 |
| SD | 1.47 | 5.63 |
| CV | 22.65% | 7.97% |
| Pearson r | — | 0.003 |

