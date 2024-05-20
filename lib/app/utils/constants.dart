class EndPoints {
  const EndPoints._();


static const String mockapi = 'https://652fc94f6c756603295da988.mockapi.io/'; 
static const String baseUrl = 'https://dcc.gitdr.com/api/';
  static const Duration timeout = Duration(seconds: 30);
  static const String assetBaseUrl                = "https://dcc.gitdr.com/";

  static const String token = 'authToken';
}

enum LoadDataState { initialize, loading, loaded, error, timeout, unknownerror }
