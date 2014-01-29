<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <ProjectGuid>{f4f218fb-f15b-4ff4-a0ce-36d16da00fb4}</ProjectGuid>
    <ProjectTypeGuids>{349c5851-65df-11da-9384-00065b846f21};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <OutputType>Library</OutputType>
    <RootNamespace>WebApplication5</RootNamespace>
    <AssemblyName>WebApplication5</AssemblyName>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v4.5.1</TargetFrameworkVersion>
    <IISExpressUseClassicPipelineMode>false</IISExpressUseClassicPipelineMode>
    <Name>IdentityProviderWebApplication</Name>
    <UseIISExpress>true</UseIISExpress>
    <DefaultUses />
    <StartupClass />
    <InternalAssemblyName />
    <ApplicationIcon />
    <TargetFrameworkProfile />
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <OutputPath>./bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>./bin</OutputPath>
    <EnableAsserts>False</EnableAsserts>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="Microsoft.AspNet.Identity.Core">
      <HintPath>..\packages\Microsoft.AspNet.Identity.Core.1.0.0\lib\net45\Microsoft.AspNet.Identity.Core.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.AspNet.Identity.Owin">
      <HintPath>..\packages\Microsoft.AspNet.Identity.Owin.1.0.0\lib\net45\Microsoft.AspNet.Identity.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin">
      <HintPath>..\packages\Microsoft.Owin.2.1.0\lib\net45\Microsoft.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin.Host.SystemWeb">
      <HintPath>..\packages\Microsoft.Owin.Host.SystemWeb.2.0.2\lib\net45\Microsoft.Owin.Host.SystemWeb.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin.Security">
      <HintPath>..\packages\Microsoft.Owin.Security.2.1.0\lib\net45\Microsoft.Owin.Security.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin.Security.Cookies">
      <HintPath>..\packages\Microsoft.Owin.Security.Cookies.2.1.0\lib\net45\Microsoft.Owin.Security.Cookies.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin.Security.Google">
      <HintPath>..\packages\Microsoft.Owin.Security.Google.2.1.0\lib\net45\Microsoft.Owin.Security.Google.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin.Security.OAuth">
      <HintPath>..\packages\Microsoft.Owin.Security.OAuth.2.1.0\lib\net45\Microsoft.Owin.Security.OAuth.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Web.Infrastructure">
      <HintPath>..\packages\Microsoft.Web.Infrastructure.1.0.0.0\lib\net40\Microsoft.Web.Infrastructure.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="mscorlib">
      <HintPath>mscorlib.dll</HintPath>
    </Reference>
    <Reference Include="Nancy">
      <HintPath>..\packages\Nancy.0.21.1\lib\net40\Nancy.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Nancy.Owin">
      <HintPath>..\packages\Nancy.Owin.0.21.1\lib\net40\Nancy.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Newtonsoft.Json">
      <HintPath>..\packages\Newtonsoft.Json.4.5.11\lib\net40\Newtonsoft.Json.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Owin">
      <HintPath>..\packages\Owin.1.0\lib\net40\Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.ComponentModel.DataAnnotations" />
    <Reference Include="System.Configuration" />
    <Reference Include="System.Data" />
    <Reference Include="System.Data.SqlServerCe">
      <HintPath>C:\Program Files\Microsoft SQL Server Compact Edition\v4.0\Desktop\System.Data.SqlServerCe.dll</HintPath>
    </Reference>
    <Reference Include="System.Drawing" />
    <Reference Include="System.EnterpriseServices" />
    <Reference Include="System.Net.Http" />
    <Reference Include="System.Net.Http.Formatting">
      <HintPath>..\packages\Microsoft.AspNet.WebApi.Client.5.1.0\lib\net45\System.Net.Http.Formatting.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Net.Http.WebRequest" />
    <Reference Include="System.Web" />
    <Reference Include="System.Web.Helpers">
      <HintPath>..\packages\Microsoft.AspNet.WebPages.3.1.0\lib\net45\System.Web.Helpers.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.Http">
      <HintPath>..\packages\Microsoft.AspNet.WebApi.Core.5.1.0\lib\net45\System.Web.Http.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.Http.Owin">
      <HintPath>..\packages\Microsoft.AspNet.WebApi.Owin.5.1.0\lib\net45\System.Web.Http.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.Http.WebHost">
      <HintPath>..\packages\Microsoft.AspNet.WebApi.WebHost.5.1.0\lib\net45\System.Web.Http.WebHost.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.Mobile" />
    <Reference Include="System.Web.Mvc">
      <HintPath>..\packages\Microsoft.AspNet.Mvc.5.1.0\lib\net45\System.Web.Mvc.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.Razor">
      <HintPath>..\packages\Microsoft.AspNet.Razor.3.1.0\lib\net45\System.Web.Razor.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.Services" />
    <Reference Include="System.Web.WebPages">
      <HintPath>..\packages\Microsoft.AspNet.WebPages.3.1.0\lib\net45\System.Web.WebPages.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.WebPages.Deployment">
      <HintPath>..\packages\Microsoft.AspNet.WebPages.3.1.0\lib\net45\System.Web.WebPages.Deployment.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.WebPages.Razor">
      <HintPath>..\packages\Microsoft.AspNet.WebPages.3.1.0\lib\net45\System.Web.WebPages.Razor.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Xml" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="Controllers\AccountController.pas" />
    <Compile Include="Controllers\HomeController.pas" />
    <Compile Include="FilterConfig.pas" />
    <Compile Include="Helpers\ExternalLoginData.pas" />
    <Compile Include="Helpers\RandomOAuthStateGenerator.pas" />
    <Compile Include="Models\AccountBindingModels.pas" />
    <Compile Include="Models\AccountViewModels.pas" />
    <Compile Include="Modules\AccountModule.pas" />
    <Compile Include="Modules\DefaultModule.pas" />
    <Compile Include="Providers\ApplicationOAuthProvider.pas" />
    <Compile Include="RouteConfig.pas" />
    <Compile Include="Startup.pas" />
    <Compile Include="WebApiConfig.pas" />
    <Content Include="Global.asax" />
    <Compile Include="Global.asax.pas">
      <DependentUpon>Global.asax</DependentUpon>
    </Compile>
    <Content Include="packages.config">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Views\Home\Index.aspx">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Views\Web.config">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Web.config" />
    <Compile Include="Properties\AssemblyInfo.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="App_Data\" />
    <Folder Include="Modules" />
    <Folder Include="Controllers" />
    <Folder Include="Models" />
    <Folder Include="Helpers" />
    <Folder Include="Views" />
    <Folder Include="Providers" />
    <Folder Include="Properties\" />
    <Folder Include="Views\Home" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\Moshine.Identity\Moshine.Identity.oxygene">
      <Name>Moshine.Identity</Name>
      <Project>{729137c3-3369-4a41-becc-44352d493e84}</Project>
      <Private>True</Private>
      <HintPath>..\Moshine.Identity\bin\Debug\Moshine.Identity.dll</HintPath>
    </ProjectReference>
  </ItemGroup>
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}">
        <WebProjectProperties>
          <UseIIS>True</UseIIS>
          <AutoAssignPort>True</AutoAssignPort>
          <DevelopmentServerPort>65284</DevelopmentServerPort>
          <DevelopmentServerVPath>/</DevelopmentServerVPath>
          <IISUrl>http://localhost:53285/</IISUrl>
          <NTLMAuthentication>False</NTLMAuthentication>
          <UseCustomServer>False</UseCustomServer>
          <CustomServerUrl>
          </CustomServerUrl>
          <SaveServerSettingsInUserFile>False</SaveServerSettingsInUserFile>
        </WebProjectProperties>
      </FlavorProperties>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}" User="">
        <WebProjectProperties>
          <StartPageUrl>
          </StartPageUrl>
          <StartAction>CurrentPage</StartAction>
          <AspNetDebugging>True</AspNetDebugging>
          <SilverlightDebugging>False</SilverlightDebugging>
          <NativeDebugging>False</NativeDebugging>
          <SQLDebugging>False</SQLDebugging>
          <ExternalProgram>
          </ExternalProgram>
          <StartExternalURL>
          </StartExternalURL>
          <StartCmdLineArguments>
          </StartCmdLineArguments>
          <StartWorkingDirectory>
          </StartWorkingDirectory>
          <EnableENC>True</EnableENC>
          <AlwaysStartWebServerOnDebug>True</AlwaysStartWebServerOnDebug>
        </WebProjectProperties>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets" />
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v12.0\WebApplications\Microsoft.WebApplication.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>