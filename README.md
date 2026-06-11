# Medicine ANOVA Test in R
Medicine effect with analysis of variance ANOVA in R

[Script](https://github.com/Caio-Felice-Cunha/Medicine-ANOVA-Test-in-R/blob/main/Drug%20effect%20with%20ANOVA%20test%20in%20R.R) <br>
[The report](https://github.com/Caio-Felice-Cunha/Medicine-ANOVA-Test-in-R/blob/main/Drug-effect-with-ANOVA-test-in-R.pdf)

![image](https://user-images.githubusercontent.com/111542025/236542366-7c9824d8-7f76-473e-8f23-88646148d1f7.png)

## This is the 1st version

## Business Problem
> Data: the data is in the script

A pharmaceutical company tested three formulations of a pain relief drug for headache (specifically migraine) sufferers. For the experiment, 27 volunteers were selected and 9 were randomly assigned to one of the three drug formulations.<br>

Subjects were instructed to take the medication during their next migraine episode and to report their pain on a scale of 1 to 10 (10 being the most severe pain). We'll create a mass of test data simulating these results during the hands-on classes that follow.<br>

We need to compare whether all three drugs generate the same effect or not. I.e:
* If the AVERAGE of each group is the same or very similar, it means that all three drugs are effective.
* If the AVERAGE is different, it means that out of three, only one or two drugs are effective.

Based on the answer we want to obtain, let's define the hypotheses for the statistical test:
* H0 (Null Hypothesis)= The AVERAGE of the groups is the same.
* Ha (Alternative Hypothesis) = The MEAN of all groups is not the same.
<br>
ANOVA will be used as a statistical test in this scenario. Our goal is to reject or not H0.

## Conclusions
The averages of the groups are not the same and consequently the drugs do not have the same effect.

## Disclaimer 
A good part of this project was largely done in the Data Science Academy, Big Data Analytics with R and Microsoft Azure Machine Learning course (part of the Data Scientist training)
