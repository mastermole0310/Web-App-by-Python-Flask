Status of Last Build:<br>
<img src="https://github.com/mastermole0310/Web-App-by-Python-Flask/workflows/Publish Web App/badge.svg?branch-main"><br>

Create Web App by Python Flask

## ==ТРЕБОВАНИЯ к вашему компьютеру (localhost)==
- ОС Windows 7, 10, MacOS, Linux
- Terraform 1.1.9 + (https://www.terraform.io/downloads)
- Visual Studio Code 1.61 + (https://code.visualstudio.com/)
- AWS Amazon аккаунт (https://aws.amazon.com/)
- Аккаунт на DockerHub (https://hub.docker.com/)
- Аккаунт на GitHub (https://github.com/)
## ==Подготовка к работе и запуск==
- Клонировать данный [репозиторий](https://github.com/mastermole0310/Web-App-by-Python-Flask)
- Авторизоваться в AWS Amazon на вашем компьютере с помощью AWS CLI (https://cloudacademy.com/blog/how-to-use-aws-cli/)
- Выполнить команду terraform apply в Visual Studio Code на вашем компьютере
- Terraform создаст инстанс (server) на основе Linux Ubuntu, с установленным Docker
- Создаем репозиторий на Dockerhub
- Заходим в наш репозиторий на Github и в Secrets создаем AWS_PRIVATE_KEY, DOCKERHUB_ACCESS_TOKEN, DOCKER_USERNAME, HOSTNAME (AWS), PORT (AWS), USER_NAME (AWS)
- Далее создаем новый Actions
- Копируем содержимое файла web_app-publish.yml в ваш workflow
- Actions создаст CI/CD pipeline для деплоя вашего приложения в AWS EC2
- Далее заходим в ваш аккаунт AWS → Route 53 → Hosted zones → Record name
- Выбираем Record name (в нашем случае dribble-getup.online)
- Вводим в браузерe dribble-getup.online/version и на экране увидим наше приложение


## ==АВТОР==
- Smirnov Alexey