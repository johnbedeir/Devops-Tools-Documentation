resource "aws_instance" "vpnserver" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "vpn"
  security_groups = ["${aws_security_group.VpnSG.name}"]

  tags  = {
    Name  = "OpenVpn-EC2"
  }
}