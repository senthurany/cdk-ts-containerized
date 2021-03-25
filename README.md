# Specialized Docker Based CDK Execution for Typescript 

## Sample

This respository contains a sample CDK Code provided in https://github.com/aws-samples/aws-cdk-examples/tree/master/typescript/appsync-graphql-dynamodb
Change the files according to your requirements.

## Execution 

### Build the container 

Uses multistage docker build technique to compile Typescript and run cdk workflows

``` docker build -t <imagename> <directory> ```

### Running cdk workflows 

Created container will run all the cdk lifecyle commands that are currently supported ex - synth, deploy, diff

``` docker run <imagename> cdk deploy```