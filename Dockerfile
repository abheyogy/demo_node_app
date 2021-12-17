from node:latest

WORKDIR /usr/src/app
COPY app/package.json .

# Install node dependencies
RUN npm install
RUN npm install pm2

# Copy the rest of the source code
COPY app/. .

# Expose application port
EXPOSE 5555
ENTRYPOINT ["pm2-runtime", "start", "app.js"]
