# =============================================================================
# Compu Palace - Frontend (React + Vite)
# =============================================================================
# Multi-stage build: install deps & build, then serve with a lightweight
# static file server.
# =============================================================================

# ---------------------------------------------------------------------------
# Stage 1 - Build
# ---------------------------------------------------------------------------
FROM node:20-alpine AS build

WORKDIR /app

# Install dependencies first (layer caching)
COPY package.json package-lock.json* ./
RUN npm ci

# Copy source and build
COPY . .
RUN npm run build

# ---------------------------------------------------------------------------
# Stage 2 - Serve
# ---------------------------------------------------------------------------
FROM node:20-alpine

WORKDIR /app

RUN npm install -g serve

COPY --from=build /app/dist ./dist

EXPOSE 3000

CMD ["serve", "-s", "dist", "-l", "3000"]

# ---------------------------------------------------------------------------
# Alternative: nginx-based serving (uncomment below, comment out Stage 2)
# ---------------------------------------------------------------------------
# FROM nginx:alpine
# COPY --from=build /app/dist /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# EXPOSE 3000
# CMD ["nginx", "-g", "daemon off;"]
