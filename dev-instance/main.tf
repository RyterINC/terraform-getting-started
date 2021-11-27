resource "aws_instance" "dev-instance" {
  ami                 = "ami-04902260ca3d33422" # us-east-1
  availability_zone   = "us-east-1c"
  instance_type       = "t2.micro"
  root_block_device {
    tags = {
      Name = "dev-instance-root"
    }
  }
  tags = {
    Name = "dev-instance"
  }
}

resource "aws_ebs_volume" "dev-instance-volume" {
  availability_zone   = "us-east-1c"
  size                = 8
  type                = "gp2"
  tags = {
    Name = "dev-instance-volume"
  }
}

resource "aws_volume_attachment" "dev-instance-attach" {
  device_name   = "/dev/sdh"
  volume_id     = aws_ebs_volume.dev-instance-volume.id
  instance_id   = aws_instance.dev-instance.id
}
