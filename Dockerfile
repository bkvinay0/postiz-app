FROM node:22-alpine

WORKDIR /app

RUN corepack enable

COPY . .

RUN pnpm install --frozen-lockfile

ENV NODE_OPTIONS="--max-old-space-size=1024"

RUN pnpm run build:backend

EXPOSE 3000

CMD ["pnpm", "run", "start:prod:backend"]
