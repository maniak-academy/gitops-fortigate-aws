
resource "fortios_firewall_address" "fakeapp_front_address" {
  vdomparam               = "FG-traffic"
  name                 = "fakeapp_front_address"
  associated_interface = "awsgeneve"
  subnet               = "${aws_instance.fakeapp_front_ec2.private_ip}/32"
  type                 = "subnet"
  visibility           = "enable"
}


resource "fortios_firewall_address" "fakeapp_db_address" {
  vdomparam               = "FG-traffic"
  name                 = "fakeapp_db_address"
  associated_interface = "awsgeneve"
  subnet               = "${aws_instance.fakeapp_db_ec2.private_ip }/32"
  type                 = "subnet"
  visibility           = "enable"
  depends_on = [ aws_instance.fakeapp_db_ec2 ]
}


resource "fortios_firewall_address" "fakeapp_api_address" {
  vdomparam               = "FG-traffic"
  name                 = "fakeapp_api_address"
  associated_interface = "awsgeneve"
  subnet               = "${aws_instance.fakeapp_api_ec2.private_ip}/32"
  type                 = "subnet"
  visibility           = "enable"
  depends_on = [ aws_instance.fakeapp_api_ec2 ]
}


