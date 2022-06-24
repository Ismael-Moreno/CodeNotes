provider "aws" {
  region     = "ap-southeast-1"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b1e534a4ff9019e0"
  instance_type = "t2.micro"
  key_name      = "ec2-key"

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo yum -y install nano"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./ec2-key.pem")
    host        = self.public_ip
  }
}
