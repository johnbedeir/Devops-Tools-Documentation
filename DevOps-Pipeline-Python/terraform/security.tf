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

# We will use port 8000 to run k8s deployment for python app
  ingress {
    from_port = 8000
    to_port   = 8000 
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
