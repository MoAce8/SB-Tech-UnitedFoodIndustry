class Result {
  const Result();

}

class InitResult extends Result{
  const InitResult();
}
class InitResultCity extends Result{
  const InitResultCity();
}
class LoadingResult extends Result{
  const LoadingResult();
}
class DneGetAllNotificationMessage extends Result{
  const DneGetAllNotificationMessage();
}
class LoadingAllAbleMazoonResult extends Result{
  const LoadingAllAbleMazoonResult();
}
class LoadingResultSuggested extends Result{
  const LoadingResultSuggested();
}
class LoadingToken extends Result{
  const LoadingToken();
}
class DoneToken extends Result{
  const DoneToken();
}
class ErrorToken extends Result{
  final String error;
  const ErrorToken(this.error);
}
class LoadingResultSuggestedSearch extends Result{
  const LoadingResultSuggestedSearch();
}

class ErrorResult extends Result{
  final String error;
  const ErrorResult(this.error);
}


class SuccessResult<T> extends Result{
  final T? data;

  const SuccessResult({this.data});
}
class SuccessResultCities<T> extends Result{
  final T? data;

  const SuccessResultCities({this.data});
}

class DoneResult extends Result{
  const DoneResult();
}
class DoneInitialMazzon extends Result{
  const DoneInitialMazzon();
}
class LoadingResultSentRate extends Result{
  const LoadingResultSentRate();
}
class DoneResultNotification extends Result{
  const DoneResultNotification();
}
class DoneResultMainMazzon extends Result{
  const DoneResultMainMazzon();
}
class DoneResultAlternativeMazzons extends Result{
  const DoneResultAlternativeMazzons();
}
class DoneChooseItem extends Result{
  const DoneChooseItem();
}
class DoneSentSubmitReservation extends Result{
  const DoneSentSubmitReservation();
}
class DoneResultReservation extends Result{
  const DoneResultReservation();
}
class DoneContactUsResult extends Result{
  const DoneContactUsResult();
}
class DoneResultMarker extends Result{
  const DoneResultMarker();
}
class DoneResultMarkerOnTap extends Result{
  const DoneResultMarkerOnTap();
}
class DoneDate extends Result{
  const DoneDate();
}
class OtpSentSuccessfully extends Result{}

class ApprovalRequired extends Result{
  const ApprovalRequired();
}

class OtpDataReady extends Result{
  const OtpDataReady();
}
class LogOut extends Result{
  const LogOut();
}

class OtpVerificationSuccess extends Result{
  const OtpVerificationSuccess();
}

class ForgetPasswordOtpSuccess extends Result{
  const ForgetPasswordOtpSuccess();
}

class ForgetPasswordChangeSuccess extends Result{
  const ForgetPasswordChangeSuccess();
}