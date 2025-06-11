#backend/Dockerfile
#El siguiente Dockerfile es para el backend de la aplicación, que está escrito en Node.js y utiliza Express, Redis y CORS.

#La imagen base es node:18, que es una imagen oficial de Node.js en Docker Hub
FROM node:18

#Establecemos el directorio de trabajo en /app
WORKDIR /app

#Copiamos servidor.js al contenedor
COPY server.js .

#ejecutamos el comando npm install para instalar las dependencias en el contenedor
RUN npm install express cors mysql2

#Utilizamos el puerto 3000 para el servidor Express
EXPOSE 3000

#Este comando cmd se ejecutará cuando se inicie el contenedor, node y server.js son los argumentos que se pasan al contenedor
CMD ["node", "server.js"]
