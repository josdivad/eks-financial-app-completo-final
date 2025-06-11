#frontend/Dockerfile
# Imagen base con Nginx
FROM nginx:alpine

# Elimina el archivo default de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia el contenido del frontend al contenedor
COPY . /usr/share/nginx/html

# Expone el puerto 80 para servir contenido web
EXPOSE 80
