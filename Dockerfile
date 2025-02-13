# Usamos una imagen base ligera con Nginx
FROM nginx:alpine

# Copiamos la aplicación Angular compilada en "dist"
COPY dist/jenk-test /usr/share/nginx/html

# Exponemos el puerto 80 para servir la app
EXPOSE 80

# Comando para ejecutar Nginx en modo foreground
CMD ["nginx", "-g", "daemon off;"]
