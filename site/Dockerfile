FROM node:17-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3006
# RUN mkdir /usr/share/nginx/buffer
# COPY --from=builder /app/.next /usr/share/nginx/buffer
# COPY --from=builder /app/deploy.sh /usr/share/nginx/buffer
# RUN chmod +x /usr/share/nginx/buffer/deploy.sh
# RUN cd /usr/share/nginx/buffer && ./deploy.sh
# RUN mkdir /usr/share/nginx/log
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/.next /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
