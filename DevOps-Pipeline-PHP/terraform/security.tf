# Create sercurity group 
resource "aws_security_group" "UbuntuSG" {

# Port 22 for SSH to connect to the EC2 instance 
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

# Port 8080 is the default port to run Jenkins 
  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

# We will use Port 5000 to run php-apache, you can choose any port but make sure it is the same in the docker-compose.yml 
  ingress {
    from_port = 5000
    to_port   = 5000
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

# Port 3306 is the default port for the database to run 
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

# We will use port 4000 to run phpmyadmin, you can choose any port but make sure it is the same in the docker-compose.yml
  ingress {
    from_port = 4000
    to_port   = 4000 
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

# Set the keypair criteria
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create and download the keypair 
resource "aws_key_pair" "UbuntuKP" {
  key_name = "mykey"
  public_key = var.public_key

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./mykey.pem && chmod 400 mykey.pem"
  }
}
