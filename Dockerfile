FROM node:22-alpine AS builder 
WORKDIR /app
COPY package*.json ./
RUN npm install tsx -g 
RUN npm ci && npm cache clean --force 

FROM node:22-alpine 
WORKDIR /app 
COPY --from=builder /app/node_modules ./node_modules 
COPY . .


CMD ["npm", "run", "docker"]
# CMD ["tsx", "src/run.ts"]
# CMD ["npm", "list"]