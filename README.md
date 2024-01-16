# Provisionamento Remoto com Terraform, Docker e Linux

## Descrição do Projeto
Este projeto automatiza a criação de um servidor web na AWS usando Terraform, Docker e Linux, com provisionamento remoto.

## Pré-requisitos
- Terraform instalado
- Docker instalado
- Chave privada para acesso SSH à instância EC2

## Como Usar
```bash
# Clone este repositório
git clone https://github.com/Provisionamento-Remoto-com-Terraform-Docker-e-Linux/Provisionamento-Remoto-com-Terraform-Docker-e-Linux.git
cd Provisionamento-Remoto-com-Terraform-Docker-e-Linux
# Configure as variáveis no arquivo `variables.tf` conforme necessário.

# Execute para provisionar
terraform init
terraform apply

# Acesse a instância EC2 e o servidor web.

# Para destruir após o uso
terraform destroy

# O arquivo Dockerfile é responsável por criar a imagem Docker para este projeto.
# Ele instala as dependências necessárias, como Terraform e AWS CLI, e define um ponto de montagem para volumes.
FROM ubuntu:latest

LABEL maintainer="PLZ"

RUN apt-get update && \
    apt-get install -y wget unzip curl openssh-client iputils-ping

ENV TERRAFORM_VERSION=1.6.4

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN mkdir /lab3
VOLUME /lab3

RUN mkdir Downloads && \
    cd Downloads && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

CMD ["/bin/bash"]
