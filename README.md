# Medicine ANOVA Test in R

Comparing three pain-relief drug formulations with a one-way analysis of variance (ANOVA) in R.

[Script](https://github.com/Caio-Felice-Cunha/Medicine-ANOVA-Test-in-R/blob/main/drug-effect-anova.R) <br>
[The report (PDF)](https://github.com/Caio-Felice-Cunha/Medicine-ANOVA-Test-in-R/blob/main/Drug-effect-with-ANOVA-test-in-R.pdf)

![image](https://user-images.githubusercontent.com/111542025/236542366-7c9824d8-7f76-473e-8f23-88646148d1f7.png)

## Business Problem

A pharmaceutical company tested three formulations of a pain-relief drug for migraine sufferers. 27 volunteers were recruited and 9 were randomly assigned to each of the three formulations (A, B, C). After their next migraine episode, each volunteer reported pain on a scale of 1 to 10, where 10 is the most severe pain. A lower score means better pain relief.

The data is simulated (27 volunteers, 9 per formulation) and is embedded directly in the script.

The question: do the three formulations produce the same effect, or does at least one differ? A one-way ANOVA answers this.

* **H0 (null hypothesis):** all three formulation means are equal.
* **Ha (alternative hypothesis):** at least one formulation mean differs from the others.

Note that ANOVA tests whether the group means are equal. Equal means would say the formulations produce the same average reported pain, not that they are all "effective." Rejecting H0 tells us at least one mean differs, not which one. A post-hoc test (Tukey HSD) is needed to identify which formulations actually differ.

## How to run

You need R installed (the script uses only base R, no extra packages). Get R from <https://cran.r-project.org/>.

```bash
Rscript drug-effect-anova.R
```

The script prints the group means, the ANOVA summary table, and the Tukey HSD post-hoc comparisons.

## Results

Group mean reported pain (lower is better):

| Formulation | Mean pain score |
|-------------|-----------------|
| A           | 3.67            |
| B           | 5.78            |
| C           | 5.89            |

One-way ANOVA (`volunteer_note ~ medicine`):

| Source    | Df | Sum Sq | Mean Sq | F value | Pr(>F)   |
|-----------|----|--------|---------|---------|----------|
| medicine  | 2  | 28.22  | 14.111  | 11.91   | 0.000256 |
| Residuals | 24 | 28.44  | 1.185   |         |          |

F(2, 24) = 11.91, p = 0.000256. Since p < 0.05 we reject H0: at least one formulation mean differs.

Tukey HSD post-hoc (95% family-wise confidence):

| Comparison | Difference in means | Adjusted p | Significant? |
|------------|---------------------|------------|--------------|
| B vs A     | 2.11                | 0.0011     | yes          |
| C vs A     | 2.22                | 0.0006     | yes          |
| C vs B     | 0.11                | 0.9745     | no           |

## Conclusions

Formulation A has the lowest mean reported pain (3.67) and relieves pain best. It differs significantly from both B (5.78) and C (5.89). Formulations B and C are statistically indistinguishable from each other (adjusted p = 0.97). So the omnibus result ("at least one formulation differs") resolves to a clear practical finding: A is the better formulation, and there is no evidence that B and C differ.

All numbers above were reproduced by running `drug-effect-anova.R` with R 4.4.1 and cross-checked independently with `scipy.stats.f_oneway` (F = 11.9062, p = 0.000256).

## Disclaimer

A good part of this project was largely done in the Data Science Academy, Big Data Analytics with R and Microsoft Azure Machine Learning course (part of the Data Scientist training). The committed PDF report is the original course deliverable, so it does not yet include the Tukey HSD post-hoc step or the corrected hypothesis wording shown above.
