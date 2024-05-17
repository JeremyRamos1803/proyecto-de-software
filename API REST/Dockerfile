# Usa la imagen oficial de Python como base
FROM python:3.8-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo de requisitos de la aplicación
COPY requirements.txt .

# Instala las dependencias de la aplicación
RUN pip install --no-cache-dir -r requirements.txt

# Copia el código de la aplicación al contenedor
COPY main.py .

# Expone el puerto 5000 en el contenedor
EXPOSE 5000

# Comando para ejecutar la aplicación Flask
CMD ["python", "main.py"]
