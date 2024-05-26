
#Security groups
resource "aws_security_group" "my_public_security_group" {
  name   = "my_public_security_group"
  vpc_id = aws_vpc.vpc-tf.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite tráfego HTTP de todos os endereços IP
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite tráfego HTTP de todos os endereços IP
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite tráfego HTTP de todos os endereços IP
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite tráfego SSH de todos os endereços IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # Permitir todo o tráfego
    cidr_blocks = ["0.0.0.0/0"] # Permitir todo o tráfego de saída
  }

}

