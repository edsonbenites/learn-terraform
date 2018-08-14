# Learn Terraform and InSpec

Hands-on com o básico de Terraform e Inspec

# Pré-requisitos

## Conta na AWS
 - Usuário na AWS com access key e secret key
 - Terraform 0.11.3 ou superior - [Terraform](https://www.terraform.io/)
 - Inspec 2.0.17 ou superior - [Inspec for AWS](https://www.inspec.io/downloads/)
 - Inspect configurado para ler as credencias da AWS.

# Set up de ambiente:

## Repositório.

Clonar este repositório 

```
git clone https://github.com/learn-chef/inspec-on-aws
```

Entrar no diretório inspec-on-aws.

```
cd inspec-on-aws/
```

O projeto define uma configuração de duas instâncias do EC2 e suas configurações de segurança e rede relacionadas. Vamos precisar criar um arquivo que especifique como acessar a conta da AWS.

Para fazer isso basta criar um arquivo chamado terraform.tfvars com as seguintes informações:

```
aws_access_key =  “xxxxxxxxxx"
aws_secret_key =  “xxxxxxxxxxxxxxxxxxxxxx"
aws_region = "us-east-2"
aws_availability_zone = "a"
```

Alterar:
* aws_access_key and aws_secret_key com sua AWS access key ID e secret key.
* aws_region and aws_availability_zone com sua region e availability zone.

# Criando a Infraestrutura.

Nesta parte, vamos criar a infraestrutura da AWS usando o Terraform.
Terraform cria a infraestrutura na nuvem, isso é feito através de um arquivo de modelo que descreve a configuração desejada. Este arquivo é geralmente chamado main.tf.

```
inspec-on-aws/main.tf
```

Aqui está um diagrama da topologia de infraestrutura que iremos criar.

![Terraform Topology](/terraform-topology.png)


o VPC contém duas subnets, uma para tráfego público (Internet) e outra para tráfego somente na rede privada.

Três Security Group fornecem o tráfego de rede de entrada nas portas 22 (SSH), 80 (HTTP) e 3306 (MySQL).

Duas instâncias do EC2 (executando o Ubuntu 16.04) que será o servidor web e o servidor de banco de dados.

O servidor da Web será alocado na subnet pública para que possamos receber tráfego da Internet. Ele fornece acesso de rede de entrada nas portas 22 e 80.


O servidor de banco de dados será alocado na subnet privada para que possa receber tráfego apenas da rede interna. Ele fornece acesso de rede de entrada nas portas 22 e 3306.

