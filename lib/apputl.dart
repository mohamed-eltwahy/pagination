class AppUtill{
   static Uri setApi (String endPoint){
    return  Uri.parse("https://api.instantwebtools.net/v1/$endPoint");
  }
}