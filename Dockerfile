FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.sln ./
COPY ./WebApplication2/WebApi.csproj ./WebApplication2/
COPY ./XUnitTestProject1/WebApiXUnitTest.csproj ./XUnitTestProject1/
RUN dotnet restore

# Copy everything else and build
COPY . ./	
WORKDIR /app/WebApplication2
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
COPY --from=build-env /app/WebApplication2/out ./
ENTRYPOINT ["dotnet", "WebApi.dll"]