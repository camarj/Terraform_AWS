resource "aws_eip" "wep_eip" {
  instance = "${aws_instance.web.id}"
  tags = {
      Name = "${var.project_name}-eip"
  }
}
