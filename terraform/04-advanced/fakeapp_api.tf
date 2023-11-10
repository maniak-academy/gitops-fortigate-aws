

resource "aws_instance" "fakeapp_api_ec2" {
  ami             = "ami-0694d931cee176e7d" # Replace with the latest Ubuntu 20.04 AMI in your region
  instance_type   = "t2.micro"
  subnet_id       = var.csprivatesubnetaz2
  key_name        = var.fwsshkey
  vpc_security_group_ids      = [aws_security_group.fakeapp_api_sg.id] # Attach the security group

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose
              mkdir docker-compose-app
              cat <<'EOT' > docker-compose-app/docker-compose.yml
              version: "3.3"
              services:
              api:
                image: nicholasjackson/fake-service:vm-v0.7.7
                environment:
                  LISTEN_ADDR: 0.0.0.0:9091
                  UPSTREAM_URIS: "http://${aws_instance.fakeapp_db_ec2.private_ip}:9093"
                  MESSAGE: "Hello World"
                  NAME: "Backend-API"
                  SERVER_TYPE: "http"
                  CONSUL_SERVER: 0.0.0.0
                  CONSUL_DATACENTER: "az1"
                  CENTRAL_CONFIG_DIR: /central
                  SERVICE_ID: "app-v1"
              EOT
              cd docker-compose-app
              sudo docker-compose up -d
              EOF

  tags = {
    Name = "fakeapp_apiServer"
  }
  depends_on = [ aws_instance.fakeapp_db_ec2 ]
}

resource "aws_security_group" "fakeapp_api_sg" {
  name        = "fakeapp_api_sg"
  description = "Allow inbound traffic on port 80 and all outbound traffic"
  vpc_id      = var.customer_vpc_id  # Replace this with your VPC ID if needed

  ingress {
    description      = "HTTP"
    from_port        = 9091
    to_port          = 9091
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Allows traffic from any IP address. Narrow this down as necessary for your use case.
  }
  egress {
    description      = "All traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Allows all traffic
    cidr_blocks      = ["0.0.0.0/0"] # Allows traffic to any IP address
  }

  tags = {
    Name = "fakeapp_api_sg"
  }
}



