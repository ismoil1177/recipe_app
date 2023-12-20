part of 'upload_cubit.dart';

@immutable
abstract class UploadState {
  const UploadState();
}

class PickImageSuccess extends UploadState {
  final File? file;
  const PickImageSuccess({required this.file});
}

class UploadInitial extends UploadState {}

class UploadFailure extends UploadState {
  final String message;
  const UploadFailure({required this.message});
}

class UploadLoading extends UploadState {}

class UploadCreateSuccess extends UploadState {}

class UploadReadSuccess extends UploadState {}

class UploadUpdateSuccess extends UploadState {}
