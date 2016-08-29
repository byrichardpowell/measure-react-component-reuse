# Measure React component re-use

This is a relatively naive script to measure 3 things:

1. Lines of code per component.
2. Amount of generic components.
3. Instances per generic component.

## Motivation

One of the reasons React is such a joy to work with is because React makes extremely composable UI components pretty trivial.  But how successful is a code-base in utilizing this power?.

This script aims to provide insight on how composable a code-base's components are.  It's trying to answer the question: Are the components in a code-base getting more composable or less composable?
