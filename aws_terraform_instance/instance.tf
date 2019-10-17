resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.keypair.key_name}"
  vpc_security_group_ids = [
      "${aws_security_group.allow_SSH.id}",
      "${aws_security_group.allow_HTTP.id}"
  ]
  user_data = "${file("user-data.txt")}"
  tags = {
    Name = "${var.project_name}-instance"
  }
}