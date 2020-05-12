# Requirements 
1 - Php
2 - Docker
3 - Clone Repo

# How to execute in local development
1 - Access directory from api
2 - Run command php artisan serve
3 - Open browser 
4 - localhost:8000/api

# How to build image in docker
1 - Access directory Application from project
2 - Run command docker build -f ./Dockerfile -t {name} .
3 - Start server run docker run -p 80:80 {name}
