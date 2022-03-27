import 'package:flutter/widgets.dart';
import 'package:music_player/data/app_error.dart';

import 'result_response_state.dart';

typedef ResultCallbackBuilder<T> = Widget Function(
    BuildContext context,
    T? data,
    AppError? error,
    bool isLoading,
    );

typedef WidgetSuccess<T> = Widget Function(T data);

typedef WidgetFailure<T> = Widget Function(AppError? error, T? data);

class ResultResponseBuilder<T> extends StatelessWidget {
  const ResultResponseBuilder(
      {Key? key,
        // required this.resultCallbackBuilder,
        required this.response,
        required this.whenLoading,
        required this.whenDataNull,
        required this.whenSuccess,
        required this.whenError})
      : super(key: key);

  final ResultResponseState<T?>? response;
  final Widget whenLoading;
  final Widget whenDataNull;
  final WidgetSuccess<T> whenSuccess;
  final WidgetFailure<T> whenError;

  @override
  Widget build(BuildContext context) {
    if (response == null) {
      return whenDataNull;
    }

    if (response is ResultResponseLoading) {
      return whenLoading;
    }

    if (response is ResultResponseFailure) {
      var _resp = response as ResultResponseFailure;
      return whenError(_resp.error, _resp.data);
    }

    var _resp = response as ResultResponseSuccess;

    return whenSuccess(_resp.data);
  }
}
