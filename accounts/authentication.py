from rest_framework_simplejwt.authentication import JWTAuthentication

class JWTAuthenticationFromCookie(JWTAuthentication):
    def authenticate(self, request):
        header = self.get_header(request)
        raw_token = request.COOKIES.get('access_token') if header is None else self.get_raw_token(header)
        if raw_token is None:
            return None
        validated_token = self.get_validated_token(raw_token)
        return self.get_user(validated_token), validated_token
