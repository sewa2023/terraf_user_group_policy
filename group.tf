resource "aws_iam_group" "cloud_group" {
  name = "cloud"
}
data "aws_iam_policy" "admin_policy" {
  name = "AdministratorAccess"
}
resource "aws_iam_policy_attachment" "admin_group_attachment" {
  name       = "cloud"
  policy_arn = data.aws_iam_policy.admin_policy.arn
  groups     = [aws_iam_group.cloud_group.name]
}
resource "aws_iam_group_membership" "member" {
  name  = "group1"
  group = "cloud"
  users = [aws_iam_user.user_john.name]
}