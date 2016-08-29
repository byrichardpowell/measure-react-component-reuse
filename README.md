# Measure React component re-use

This is a relatively naive script to measure 3 things:

1. Lines of code per component.
2. Amount of generic components.
3. Instances per generic component.

## Motivation

One of the reasons React is such a joy to work with is because React makes extremely composable UI components pretty trivial.  But how successful is a code-base in utilizing this power?

This script aims to provide insight on how composable a code-base's components are.  It's trying to answer the question: Are the components in a code-base getting more composable or less composable?

## What we measure

This script measures 3 stats:

1. Lines of code per generic component.
2. Number of generic components.
3. Instances per generic component.

On their own these stats aren't much but taken together over many months they tell a story:

![Image showing 6 months of stats](https://github.com/serverdensity/measure-react-component-reuse/blob/master/serverdensity-stats.png)

This tells us that the number of components, and instances of those generic components has been increasing at a pretty steady rate which means we are getting better at re-using components. However, in the most recent month the instances per generic component decreased. Because the number of generic components increased this tells us that we added new generic components that have not yet been re-used in many places.  If this is true we might expect to see the instances per generic component increase at an accelerated rate over the next few months.

## Usage

To generate the stats for the components in this repository:

1. `git clone git@github.com:serverdensity/measure-react-component-reuse.git`
2. `npm install`
3. `npm run component-reuse`

This will generate stats like so:

![Sample output from this script](https://github.com/serverdensity/measure-react-component-reuse/blob/master/sample-stats.png)

## Limitations

Just like [Document Generic React Components](https://github.com/byrichardpowell/Document-Generic-React-Components) this script was built for the specific requirements of the Server Density UI codebase. No configuration is provided and the script works based on assumptions that are only likely to be true in our code-base.

If you wish to use this yourself you will need to edit the code in `scripts/create-generic-component-docs.js` to make it work with the requirements of your code-base. The approach should be sound, but file paths, regular expressions, stuff like that will need to be customised.

It would be entirely possible to make this script configurable so that it can fit any code-base.
