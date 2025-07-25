FROM node:22-alpine

# Create app directory
WORKDIR /usr/src/app

# Install only production dependencies
COPY package.json package*.json ./
RUN npm ci --only=production

# Copy app source
COPY . .

# Expose the default port (3000)
EXPOSE 3000

# Run the server; default port can be overridden via --port
ENTRYPOINT ["bin/server"]
CMD ["--port", "3000"]
