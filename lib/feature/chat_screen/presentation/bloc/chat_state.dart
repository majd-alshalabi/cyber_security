part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class AddMessageLoading extends ChatState {}

class AddMessageLoaded extends ChatState {}
