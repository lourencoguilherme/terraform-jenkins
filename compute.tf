
resource "aws_instance" "jenkins-instance" {
  ami           = var.instance_ami 
  instance_type = var.instance_type
  key_name = var.keyname
  #vpc_id          = "${aws_vpc.development-vpc.id}"
  vpc_security_group_ids = [aws_security_group.sg_allow_ssh_jenkins.id]
  subnet_id          = aws_subnet.public-subnet-1.id
  #name            = "${var.name}"
  #user_data = file("install_jenkins.sh")

  associate_public_ip_address = true
  tags = {
    Name = "Jenkins-Instance"
  }

  provisioner "file" {
    source      = "install_jenkins.sh"
    destination = "/tmp/install_jenkins.sh"
  }
  # Change permissions on bash script and execute from ubuntu.
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install_jenkins.sh",
      "sudo /tmp/install_jenkins.sh",
    ]
  }
  # Login to the ubuntu with the aws key.
  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.keyPath)
    host        = self.public_ip
  }

}

resource "aws_security_group" "sg_allow_ssh_jenkins" {
  name        = "allow_ssh_jenkins"
  description = "Allow SSH and Jenkins inbound traffic"
  vpc_id      = aws_vpc.development-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

output "jenkins_ip_address" {
  value = aws_instance.jenkins-instance.public_dns
}
