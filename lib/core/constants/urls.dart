class Urls {
  Urls._();
  static const _BASEURL = "https://ufiodoobridge.azurewebsites.net/api";
  static const REGISTER = "$_BASEURL/Account/register";
  static const GETSUBMITRESERVATION= "$_BASEURL/Reservation/SubmitReservation";
  static const LOGIN = "$_BASEURL/Account/Login";
  static const SEND_OTP = "$_BASEURL/Account/SendOtp";
  static const VALIDATE_OTP = "$_BASEURL/Account/ValidateOTP";
  static const FORGET_PASSWORD = "$_BASEURL/Account/ForgetPassword";
  static const RESET_PASSWORD = "$_BASEURL/Account/ResetPassword";
  static const SEND_FORGET_PASSWORD_CODE = "$_BASEURL/Account/SendForgetPasswordCode";
  static const GET_MAZZON_INFO = "$_BASEURL/Mazzon/GetMazzonInfo";
  static const GET_MAZZON_DATA = "$_BASEURL/Mazzon/GetMazzonData";
  static const GET_NEW_RESERVATIONS = "$_BASEURL/Reservation/NewReservations";
  static const GET_PENDING_RESERVATIONS = "$_BASEURL/Reservation/PendingReservations";
  static const GET_FINISHED_RESERVATIONS = "$_BASEURL/Reservation/FinishedReservations";
  static const GET_USER_RESERVATIONS = "$_BASEURL/Reservation/GetUserReservations";
  static const GET_REJECTED_REASONS_LIST = "$_BASEURL/ReportMazzonReason/GetAllReportReasons";
  static const GET_CANCEL_REASONS_LIST = "$_BASEURL/CancelReason/CancelReasonsList";
  static const POST_SUBMIT_MAZOON_REPORT = "$_BASEURL/ReportMazzonReason/SubmitMazzonReport";
  static const GET_MAZOON_REPORT = "$_BASEURL/ReportMazzonReason/GetMazzonReportByReservationId";
  static const POST_GO_TO_NEXT_MAZZON = "$_BASEURL/Reservation/GoToNextMazzon";
  static const GET_ALL_NOTIFICATIONS_BY_USER_ID = "$_BASEURL/Notification/GetAllNotificationsByUserId";
  static const GET_RESERVATION_BY_ID = "$_BASEURL/Reservation/GetReservationById";
  static const POST_SET_MAZOON_RATE = "$_BASEURL/MazzonRates/SetMazzonRate";
  static const GET_MAZOON_RATE = "$_BASEURL/MazzonRates/GetReservationRateByReservationId";
  static const SET_CANCLE_RESERVATION = "$_BASEURL/Reservation/CancelReservation";
  static const GET_USER_DATA = "$_BASEURL/Users/GetUserData";
  static const GET_SUBMIT_USER_DATA = "$_BASEURL/Users/SubmitUserData";

  static const POST_RESET_PASSWORD = "$_BASEURL/Account/ResetPassword";
  static const _FileBaseUrl = "http://sbtechnology-001-site5.atempurl.com/api";
  static const UPLOAD_FILE = "$_FileBaseUrl/FileActions/UploadFile";
  ///
  static const GETCOUNTRIES = "$_BASEURL/Address/GetCountries";
  static const GETCITIES= "$_BASEURL/Address/GetStatesByCountryId";
  static const GETSTATES= "$_BASEURL/Address/GetCitiesByStateId";

  static const GETMAZZON= "$_BASEURL/Home/GetAllAvailableMazzons";
  static const GET_SUGGESTED_MAZZONS = "$_BASEURL/Home/GetSuggestedMazzons";
  static const GET_SEARCH_MAZOON = "$_BASEURL/Home/SearchMazzons";
  static const GET_TOP_RATE = "$_BASEURL/Home/GetTopRatedMazzons";
  static const POST_CHECK_MAZOON_AVALI = "$_BASEURL/Home/CheckMazzonavailability";
  static const GET_ABOUT_US = "$_BASEURL/AppSetting/GetAboutUs";
  static const GET_PRIVACY_POLICY = "$_BASEURL/AppSetting/GetPrivacyPolicy";
  static const GET_TERMS_CONDITIONS = "$_BASEURL/AppSetting/GetTermsConditions";
  static const GET_FAQ = "$_BASEURL/FAQ/GetFAQ";
  static const GET_APP_SETTING = "$_BASEURL/AppSetting/GetAppSetting";
  static const GET_CONTACT_US = "$_BASEURL/ContactUss/AddContactUs";
  static const UPDATE_USER_DEVICE_ID = "$_BASEURL/Account/updateUserDeviceId";
  ///
}
