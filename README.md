# Learn Terraform and InSpec

Mini curso com o basico de Terraform e Inspec

# Pre requisitos

## Conta na AWS
 - Usuário na AWS com access key e secret key
 - Terraform 0.11.3 ou superior - [Terraform](https://www.terraform.io/)
 - Inspec 2.0.17 ou superior - [Inspec for AWS](https://www.inspec.io/downloads/)
 - Inspect configurado para ler as credencias da AWS.


# Set up de ambiente:

## Repositorio.

Clonar este repositorio 

```
git clone https://github.com/learn-chef/inspec-on-aws
```

Entrar no diretório inspeção-on-aws.

```
cd inspec-on-aws/
```

O projeto define uma configuração para duas instâncias do EC2 e suas configurações de segurança e rede relacionadas. Você precisará criar um arquivo que especifique como acessar sua conta da AWS.

Para fazer isso basta criar um arquivo chamado terraform.tfvars com as seguintes informações:

```
aws_access_key =  “xxxxxxxxxx"
aws_secret_key =  “xxxxxxxxxxxxxxxxxxxxxx"
aws_region = "us-east-2"
aws_availability_zone = "a"
```

Alterar:
* aws_access_key and aws_secret_key with your AWS access key ID and secret key.
* aws_region and aws_availability_zone with your region and availability zone.

# Criando a Infraestrutura.

Nesta parte, você criará a infraestrutura da AWS usando o Terraform. Vamos começar entendendo o que você vai criar.
Terraform provê infraestrutura na nuvem. Isso é feito através de um arquivo de modelo que descreve a configuração desejada. Este arquivo é geralmente chamado main.tf.
Você pode dar uma olhada em:

```
inspec-on-aws/main.tf
```

Aqui está um diagrama.

![Terraform Topology](/terraform-topology.png)

Essa topologia forma um servidor da Web de três camadas básico e uma implementação de banco de dados. Em suma:

o VPC contém duas sub-redes, uma para tráfego público (Internet) e outra para tráfego somente na rede privada.
três grupos de segurança fornecem tráfego de rede de entrada nas portas 22 (SSH), 80 (HTTP) e 3306 (MySQL).
Duas instâncias do EC2 (executando o Ubuntu 16.04) definem o servidor web e o servidor de banco de dados.
O servidor da Web é alocado na sub-rede pública para que possa receber tráfego da Internet. Ele fornece acesso de rede de entrada nas portas 22 e 80.
O servidor de banco de dados é alocado na sub-rede privada para que possa receber tráfego apenas da rede interna. Ele fornece acesso de rede de entrada nas portas 22 e 3306.
As instâncias do EC2 não possuem nenhum servidor Web ou software de banco de dados instalado. Eles existem para modelar as funções que eles desempenhariam em um típico servidor da Web de três camadas e implementação de banco de dados.
