resource "aws_launch_configuration" "web" {
  name_prefix          = "web_config-${var.project_name}"
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.keypair.key_name}"
  security_groups = [
    "${aws_security_group.allow_SSH.id}",
    "${aws_security_group.allow_HTTP.id}"
  ]
  user_data = "${file("user-data.txt")}"

  lifecycle{
      create_before_destroy = true
  }
}