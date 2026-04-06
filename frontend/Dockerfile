# =============================================================================
# Compu Palace - Frontend (React + Vite) — Dev Mode
# =============================================================================
# Single-stage: runs the Vite dev server with HMR for local development.
# =============================================================================

FROM node:20-alpine

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
