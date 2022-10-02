FROM node:16
EXPOSE 80
RUN npm install -g aws-cdk-local aws-cdk
WORKDIR /setup
COPY ./setup .
RUN chmod +x /setup/ready.sh
CMD ["bash", "/setup/ready.sh"]
