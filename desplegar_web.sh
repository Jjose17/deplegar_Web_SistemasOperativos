#!/bin/bash

# Script de automatización para instalación de Nginx y sitio de prueba

echo "=========================================="
echo " Iniciando despliegue de Servidor Web "
echo "=========================================="

# 1. Actualizar repositorios del sistema
echo "[+] Actualizando lista de paquetes..."
sudo apt update -y

# 2. Instalar el servidor web Nginx
echo "[+] Instalando Nginx..."
sudo apt install nginx -y

# 3. Asegurar que el servicio Nginx esté iniciado y habilitado
echo "[+] Iniciando el servicio de Nginx..."
sudo systemctl start nginx
sudo systemctl enable nginx

# 4. Crear la página web de prueba personalizada
echo "[+] Creando sitio web de prueba..."
WEB_DIR="/var/www/html"

sudo bash -c "cat <<EOF > $WEB_DIR/index.html
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Prueba de Despliegue DevOps</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f9; padding-top: 50px; }
        h1 { color: #2c3e50; }
        p { color: #555; }
        .card { background: white; max-width: 500px; margin: 0 auto; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <div class='card'>
        <h1>¡Servidor Web Desplegado!</h1>
        <p>Este sitio fue instalado y configurado automáticamente mediante un script de Bash.</p>
    </div>
</body>
</html>
EOF"

# 5. Ajustar permisos de lectura para la página web
sudo chmod 644 $WEB_DIR/index.html

echo "=========================================="
echo " ¡Despliegue completado con éxito! "
echo " Puedes probarlo en tu navegador visitando: http://localhost "
echo "=========================================="
cd proyecto-web