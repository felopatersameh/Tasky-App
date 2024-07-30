part of 'new_task_cubit.dart';@immutablesealed class NewTaskState {}final class NewTaskInitial extends NewTaskState {}class UploadImageLoading extends NewTaskState {}class UploadImageSuccess extends NewTaskState {  final String model;  UploadImageSuccess({required this.model});}class UploadImageFailed extends NewTaskState {  final String error;  UploadImageFailed({required this.error});}class CreateTaskLoading extends NewTaskState {}class CreateTaskSuccess extends NewTaskState {  final bool model;  CreateTaskSuccess({required this.model});}class CreateTaskFailed extends NewTaskState {  final String error;  CreateTaskFailed({required this.error});}