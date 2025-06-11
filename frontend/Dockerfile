#frontend/Dockerfile
# Este Dockerfile es para el frontend de la aplicación, que está escrito en HTML y utiliza Nginx como servidor web.

# La imagen base es nginx:alpine, que es una imagen oficial de Nginx en Docker Hub
FROM nginx:alpine

# Establecemos el directorio de trabajo en /usr/share/nginx/html
COPY index.html /usr/share/nginx/html/index.html

#Se utiliza el puerto 80 por defecto para Nginx
EXPOSE 80
