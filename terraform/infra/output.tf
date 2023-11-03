
output "FGTPublicIP" {
  value = aws_eip.FGTPublicIP.public_ip
}

output "FGT2PublicIP" {
  value = aws_eip.FGT2PublicIP.public_ip
}

output "Username" {
  value = "admin"
}

output "FGT1-Password" {
  value = aws_instance.fgtvm.id
}

output "FGT2-Password" {
  value = aws_instance.fgtvm2.id
}

output "LoadBalancerPrivateIP" {
  value = data.aws_network_interface.vpcendpointip.private_ip
}

output "LoadBalancerPrivateIP2" {
  value = data.aws_network_interface.vpcendpointipaz2.private_ip
}

output "CustomerVPC" {
  value = aws_vpc.customer-vpc.id
}

output "FGTVPC" {
  value = aws_vpc.fgtvm-vpc.id
}

output "cspublicsubnetaz1" {
  value = aws_subnet.cspublicsubnetaz1.id
}

output "cs2publicsubnetaz1" {
  value = aws_subnet.cs2publicsubnetaz1.id
}

output "customer_vpc_id" {
  value = aws_vpc.customer-vpc.id
}

output "csprivatesubnetaz1" {
  value = aws_subnet.csprivatesubnetaz1.id
}
output "cs2privatesubnetaz1" {
  value = aws_subnet.cs2privatesubnetaz1.id
}

output "fwsshkey" {
  value = aws_key_pair.fwsshkey.key_name
}


