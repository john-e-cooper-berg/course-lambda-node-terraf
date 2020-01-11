resource "aws_api_gateway_rest_api" "bmi_api_gateway" {
  name        = "${var.stage}-BMI_API_Gateway"
  description = "BMI API Gateway (tf)"
}

resource "aws_api_gateway_integration" "lambda" {
  http_method             = aws_api_gateway_method.proxy.http_method
  resource_id             = aws_api_gateway_method.proxy.resource_id
  rest_api_id             = aws_api_gateway_rest_api.bmi_api_gateway.id
  type                    = "AWS_PROXY"
  integration_http_method = "GET"
  uri                     = aws_lambda_function.lambda.invoke_arn
}

resource "aws_api_gateway_method" "proxy_root" {
  authorization = "NONE"
  http_method   = "ANY"
  resource_id   = aws_api_gateway_rest_api.bmi_api_gateway.root_resource_id
  rest_api_id   = aws_api_gateway_rest_api.bmi_api_gateway.id
}

resource "aws_api_gateway_integration" "lambda_root" {
  http_method             = aws_api_gateway_method.proxy_root.http_method
  resource_id             = aws_api_gateway_method.proxy_root.resource_id
  rest_api_id             = aws_api_gateway_rest_api.bmi_api_gateway.id
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "apigwdeployment" {
  depends_on = [
    aws_api_gateway_integration.lambda,
    aws_api_gateway_integration.lambda_root
  ]
  rest_api_id = aws_api_gateway_rest_api.bmi_api_gateway.id
  stage_name  = var.stage
}

output "base_url" {
  value = aws_api_gateway_deployment.apigwdeployment.invoke_url
}











