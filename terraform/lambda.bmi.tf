provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_lambda_function" "lambda" {
  function_name = "${var.stage}-bmi"
  handler = "src/index.performBmiCalculation"
  memory_size = "256"
  timeout = 10
  reserved_concurrent_executions = "-1"
  s3_bucket = "lambdas-bmicalc"
  s3_key = var.lambda_version
  role = aws_iam_role.bmi_lambda_iam_role.arn
  runtime = "nodejs12.x"
}

resource "aws_iam_role" "bmi_lambda_iam_role" {
  name = "bmi_role_terr"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}