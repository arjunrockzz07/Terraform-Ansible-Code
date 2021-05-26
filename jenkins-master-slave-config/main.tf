 provider "aws" {
            region = "us-east-1"
	    access_key = "AKIA2BI3KWK5V25FDTWK"
   	    secret_key = "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"
        }
        locals {
                ssh_user         = "ec2-user"
                key_name         = "test2"
                private_key_path = "/home/ec2-user/jenkins-master-slave-config/test2.pem"
        }
 resource "aws_instance" "server" {
                ami = "ami-048f6ed62451373d9"
                availability_zone = "us-east-1a"
                key_name   = "test2"
                instance_type = "t2.micro"
                vpc_security_group_ids = ["sg-0bbd65c8a369a0c49"]
                subnet_id = "subnet-03a7b6d427d5262c4"
		count = 2 
                tags = {
                Name = "${lookup(var.servername,var.env)}"
                }

 provisioner "remote-exec" {
                inline = ["echo 'Wait until SSH is ready'"]
        }
 connection {
      type  = "ssh"
      user  = local.ssh_user
      private_key = file(local.private_key_path)
      host  = "${self.public_ip}"
    }

 provisioner "local-exec" {
      command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key ${local.private_key_path} -i '${self.public_ip},' ${lookup(var.playbookname,var.env)}"
  }

}

