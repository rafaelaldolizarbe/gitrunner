resource "aws_instance" "runnerhost" {
  ami                         = "ami-04b70fa74e45c3917"
  instance_type               = "t2.micro"
  key_name                    = "mago-de-oz"
  subnet_id                   = aws_subnet.subnet-public.id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.my_public_security_group.id]
  # provisioner "file" {
  #   source      = "./envconfig.sh" # Caminho local do seu script
  #   destination = "/home/ubuntu/envconfig.sh"

  #   connection {
  #     type        = "ssh"
  #     user        = "ubuntu" # Ou o usuário SSH da sua instância
  #     private_key = var.private_key
  #     host        = self.public_ip # Ou self.private_ip para uma instância em uma VPC
  #   }                              # Destino na instância
  # }
  provisioner "file" {
    source      = "./runnerconfig.sh" # Caminho local do seu script
    destination = "/home/ubuntu/runnerconfig.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu" # Ou o usuário SSH da sua instância
      private_key = var.private_key
      host        = self.public_ip # Ou self.private_ip para uma instância em uma VPC
    }                              # Destino na instância
  }
  provisioner "remote-exec" {
    inline = [
      # "chmod +x /home/ubuntu/envconfig.sh",    # Concede permissões de execução ao script
      "chmod +x /home/ubuntu/runnerconfig.sh", # Concede permissões de execução ao script
      # "/home/ubuntu/envconfig.sh",             # Executa o script
      "/home/ubuntu/runnerconfig.sh",          # Executa o script
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu" # Ou o usuário SSH da sua instância
      private_key = var.private_key
      host        = self.public_ip # Ou self.private_ip para uma instância em uma VPC
    }
  }
  tags = {
    Name = "runnerhost"
  }

}
