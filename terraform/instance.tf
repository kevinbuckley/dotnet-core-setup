
resource "aws_key_pair" "id_rsa" {
  key_name      = "id_rsa"
  public_key    = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "dotnetcoreapp" {
  tags = {
    Name = "${var.INSTANCE_NAME}"
  }
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.id_rsa.key_name}"

  provisioner "file" {
    source      = "../ansible/temp.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

  #############################################################################
  # This is the 'local exec' method.  
  # Ansible runs from the same host you run Terraform from
  #############################################################################

  provisioner "remote-exec" {
    inline = [
        "echo 'wasssup'"
    ]
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.public_ip},' --private-key ${var.PATH_TO_PRIVATE_KEY} ../ansible/provision.yml"
  } 

  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
