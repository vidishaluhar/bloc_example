abstract class ApiEvent{}

class ApiRequestEvent extends ApiEvent{
  final String requestEmail;
  final String requestPassword;

  ApiRequestEvent(this.requestEmail, this.requestPassword);
}