# Use uma Imagem Official do Python
FROM python:rc-slim

### instalando pacotes necessarios
RUN apt-get update && apt-get install procps iproute2 curl -y

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app


# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt


# Garante que será iniciado a aplicação.
CMD ["gunicorn", "-b", ":8080", "app:app"]
