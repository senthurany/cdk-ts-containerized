# Multistage Docker build
FROM node:alpine as builder

# Installing Core Frameworks 
RUN apk add --update nodejs npm && \
    npm install -g typescript && \
    npm install -g cdk

WORKDIR /app 

# Copying typescript code 
COPY *.ts ./

# Copying configurations and dependicies file 
COPY *.json ./

# Compiling the code
RUN npm install && \
    npm run build 

# Final docker image to run cdk lifecyles
FROM node:alpine 

# Installing Core Frameworks 
RUN apk add --update nodejs npm && \
    npm install -g cdk

WORKDIR /app

# Copying Required files into /app directory
COPY --from=builder /app/node_modules ./node_modules
COPY  --from=builder /app/cdk.json ./
COPY --from=builder /app/*.js ./

#By default container will perform synth operation, Override as required
CMD ["cdk","synth"]