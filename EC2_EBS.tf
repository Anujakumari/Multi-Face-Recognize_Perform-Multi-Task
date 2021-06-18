provider "aws" {
	region = "ap-south-1"
	profile = "default"
}


resource "aws_instance" "myOS" {
	ami = "ami-0ad704c126371a549"
	instance_type = "t2.micro"
	tags = {
	       Name = "os for summer-training_task-6"
	}
}

resource "aws_ebs_volume" "mystorage" {
	availability_zone = aws_instance.myOS.availability_zone
	size = 5 
	tags = {
	       Name = "ebs for summer-training_task-6"
	}
}

resource "aws_volume_attachment"  "ebs_attach" {
	device_name = "/dev/sdh"
	volume_id = aws_ebs_volume.mystorage.id
	instance_id = aws_instance.myOS.id
}