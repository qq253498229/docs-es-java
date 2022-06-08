FROM node:lts-alpine as builder
WORKDIR /app
RUN apk add git
RUN git config --global user.email "253498229@qq.com"
RUN git config --global user.name "王斌"
COPY package.json .
COPY package-lock.json .
RUN npm i
COPY . .
RUN git init && git add . && git commit -m "init"
RUN npm run build

FROM nginx:alpine
ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo "server { \
    listen       80; \
    location / { \
        alias /usr/share/nginx/html/;\
        try_files \$uri \$uri/ /index.html; \
    } \
}" > /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build/site /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
