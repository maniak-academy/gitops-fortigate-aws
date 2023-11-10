
output "FGTPublicIP" {
  value = module.network.FGTPublicIP
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = module.network.Password
}

output "LoadBalancerPrivateIP" {
  value = module.network.LoadBalancerPrivateIP
}

output "CustomerVPC" {
  value = module.network.CustomerVPC
}

output "FGTVPC" {
  value = module.network.FGTVPC
}

output "customer_vpc_id" {
  value = module.network.customer_vpc_id
}
output "fwsshkey" {
  value = module.network.fwsshkey
}


output "csprivatesubnetaz2" {
  value = module.network.csprivatesubnetaz2
}

output "csprivatesubnetaz1" {
  value = module.network.csprivatesubnetaz1
}