resource "aws_instance" "dsa_instance" {
  
  ami = "ami-0a0d9cf81c479446a"  
  
  instance_type = var.instance_type
  
  key_name = "plz-lab3"

  tags = {
    Name = "lab3-t2-terraform"
  }

  provisioner "remote-exec" {
    
    inline = ["sudo yum update -y", 
              "sudo yum install httpd -y", 
              "sudo systemctl start httpd", 
              "sudo bash -c 'echo Meu Web Server com Terraform > /var/www/html/index.html'"]

    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = file("plz-lab3.pem")
      host     = self.public_ip
    }
  }
}
