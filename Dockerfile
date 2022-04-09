FROM denoland/deno:1.19.3

WORKDIR /app
USER deno

# Cache dependencies
COPY app/deps.ts . 
RUN deno cache deps.ts

COPY app/* .
RUN deno cache main.ts
EXPOSE 3000
CMD ["run", "--allow-net", "--allow-read", "--unstable","main.ts"]
