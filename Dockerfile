# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

WORKDIR /app

RUN ls -la && pwd
COPY *.sln ./
COPY testpage/*.cs ./testpage/
COPY testpage/Pages/* ./testpage/Pages/
COPY testpage/Properties/ ./testpage/Properties/
COPY testpage/*.json ./testpage/
COPY testpage/*.csproj ./testpage/

RUN ls -la

# Copy csproj and restore as distinct layers
#COPY testpage/*.csproj ./
RUN dotnet restore
# testpage.csproj

# Copy everything else and build
#COPY ../engine/examples ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build-env /app/out .


ENTRYPOINT ["dotnet", "testpage.dll" ]

# RUN ls -la /
