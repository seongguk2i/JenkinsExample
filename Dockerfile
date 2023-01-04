#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["JenkinsExample/JenkinsExample.csproj", "JenkinsExample/"]
RUN dotnet restore "JenkinsExample/JenkinsExample.csproj"
COPY . .
WORKDIR "/src/JenkinsExample"
RUN dotnet build "JenkinsExample.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "JenkinsExample.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "JenkinsExample.dll"]