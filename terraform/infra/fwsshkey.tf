resource "tls_private_key" "fwsshkey" {
  algorithm = "RSA"
}

resource "aws_key_pair" "fwsshkey" {
  public_key = tls_private_key.fwsshkey.public_key_openssh
}

resource "null_resource" "key" {
  provisioner "local-exec" {
    command = "echo \"${tls_private_key.fwsshkey.private_key_pem}\" > ${aws_key_pair.fwsshkey.key_name}.pem"
  }

  provisioner "local-exec" {
    command = "chmod 600 *.pem"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f *.pem"
  }

}