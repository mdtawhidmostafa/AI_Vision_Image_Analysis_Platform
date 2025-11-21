import os
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import authenticate
from .serializers import SignupSerializer
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth.models import update_last_login

ACCESS_TOKEN_AGE = 60 * 15
REFRESH_TOKEN_AGE = 60 * 60 * 24 * 7

def set_jwt_cookies(response, access_token, refresh_token):
    response.set_cookie('access_token', access_token, max_age=ACCESS_TOKEN_AGE, httponly=True, samesite='Lax')
    response.set_cookie('refresh_token', refresh_token, max_age=REFRESH_TOKEN_AGE, httponly=True, samesite='Lax')

@api_view(['POST'])
@permission_classes([AllowAny])
def signup(request):
    serializer = SignupSerializer(data=request.data)
    if serializer.is_valid():
        user = serializer.save()
        refresh = RefreshToken.for_user(user)
        resp = Response({"message": "Account created"}, status=status.HTTP_201_CREATED)
        set_jwt_cookies(resp, str(refresh.access_token), str(refresh))
        return resp
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@permission_classes([AllowAny])
def login_view(request):
    email = request.data.get('email')
    password = request.data.get('password')
    user = authenticate(request, username=email, password=password)
    if user:
        refresh = RefreshToken.for_user(user)
        resp = Response({"message": "Login successful"}, status=status.HTTP_200_OK)
        set_jwt_cookies(resp, str(refresh.access_token), str(refresh))
        update_last_login(None, user)
        return resp
    return Response({"detail": "Invalid credentials"}, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['POST'])
def logout_view(request):
    resp = Response({"message": "Logged out"}, status=status.HTTP_200_OK)
    resp.delete_cookie('access_token')
    resp.delete_cookie('refresh_token')
    return resp

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def me(request):
    user = request.user
    return Response({"full_name": user.full_name, "email": user.email})
