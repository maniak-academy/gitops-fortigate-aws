# resource "aws_instance" "example" {
#   ami           = data.aws_ami.amzn-linux-2023-ami.id
#   instance_type = "c6a.2xlarge"
#   subnet_id     = aws_subnet.example.id


#   tags = {
#     Name = "tf-example"
#   }
# }