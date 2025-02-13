# Usar una imagen de Nginx como base
FROM nginx:latest

# Eliminar archivos predeterminados de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiar la aplicación Angular generada en la carpeta dist
COPY dist/jenk-test /usr/share/nginx/html

# Copiar una configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto 80
EXPOSE 80

# Iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
