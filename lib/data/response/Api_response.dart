import 'package:mvvm_provider/data/response/status.dart';

class ApiResponse<T>
{
  Status ? status;
  T? data;
  String? message;
  ApiResponse(this.status,this.data,this.message);

  ApiResponse.loading():status=Status.LOADED;
  ApiResponse.completed(this.data):status=Status.COMPLETED;
  ApiResponse.error(this.data):status=Status.ERROR;
  @override
  String toString()
  {
    return 'Status:$status \n Message:$message \n Data:$data';
  }
}