resource "aws_security_group" "UbuntuSG" {

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 4000
    to_port   = 4000
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 5000
    to_port   = 5000
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress  {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "UbuntuKP" {
  key_name = "mykey"
  public_key = var.public_key

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./mykey.pem && chmod 400 mykey.pem"
  }
}
