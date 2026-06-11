# Drug effect with ANOVA test in R
#
# A pharmaceutical company tested three formulations of a pain relief drug.
# 27 volunteers, 9 randomly assigned to each formulation, reported pain on a
# 1 to 10 scale (10 = most severe). Lower score = better pain relief.
#
# Data provided:
# Medicine A = 4 5 4 3 2 4 3 4 4
# Medicine B = 6 8 4 5 4 6 5 8 6
# Medicine C = 6 7 6 6 7 5 6 5 5
#
# Run headless with:  Rscript drug-effect-anova.R

# Pain scores reported by the volunteers
volunteer_note <- c(4, 5, 4, 3, 2, 4, 3, 4, 4,
                    6, 8, 4, 5, 4, 6, 5, 8, 6,
                    6, 7, 6, 6, 7, 5, 6, 5, 5)

# Formulation assigned to each volunteer (9 per group)
medicine <- c(rep("A", 9), rep("B", 9), rep("C", 9))

# Build the data frame
df <- data.frame(volunteer_note, medicine)
print(head(df))
str(df)

# Group means (lower = better pain relief)
print(aggregate(volunteer_note ~ medicine, data = df, FUN = mean))

# One-way ANOVA
# H0: all three formulation means are equal.
# Ha: at least one formulation mean differs from the others.
test_anova <- aov(volunteer_note ~ medicine, data = df)
print(summary(test_anova))

# Post-hoc: which formulations actually differ?
# The omnibus ANOVA only tells us that at least one mean differs. TukeyHSD
# runs the pairwise comparisons with the family-wise error rate controlled.
print(TukeyHSD(test_anova))

# Conclusion:
# P-value < 0.05 (0.000256 < 0.05), so we reject H0: at least one
# formulation mean differs. The post-hoc test shows formulation A has the
# lowest mean pain score (best relief) and differs significantly from both
# B and C, while B and C are statistically indistinguishable from each other.
