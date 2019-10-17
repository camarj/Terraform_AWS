output "instance_public_ip" {
  value = "${aws_eip.wep_eip.public_ip}"
}
