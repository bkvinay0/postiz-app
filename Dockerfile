FROM node:22-alpine

WORKDIR /app

RUN corepack enable

ENV NODE_OPTIONS="--max-old-space-size=2048"

COPY . .

RUN pnpm install --frozen-lockfile

RUN pnpm run build:backend

EXPOSE 3000

CMD ["pnpm", "run", "start:prod:backend"]
