#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/sdk:6.0 AS build-env
WORKDIR /app

COPY *.csproj .

FROM dotnet restore

COPY . ./

RUN dotnet publish --no-restore -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "JenkinsExample.dll"]

#EXPOSE 80
#EXPOSE 443
#
#FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
#WORKDIR /src
#COPY ["JenkinsExample.csproj", "/"]
#RUN dotnet restore "JenkinsExample/JenkinsExample.csproj"
#COPY . .
#WORKDIR "/src/JenkinsExample"
#RUN dotnet build "JenkinsExample.csproj" -c Release -o /app/build
#
#FROM build AS publish
#RUN dotnet publish "JenkinsExample.csproj" -c Release -o /app/publish /p:UseAppHost=false
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "JenkinsExample.dll"]