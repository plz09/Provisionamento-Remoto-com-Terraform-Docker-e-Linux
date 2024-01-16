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

