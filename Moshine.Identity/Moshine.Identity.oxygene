<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <RootNamespace>Moshine.Identity</RootNamespace>
    <ProjectGuid>{729137c3-3369-4a41-becc-44352d493e84}</ProjectGuid>
    <OutputType>library</OutputType>
    <AssemblyName>Moshine.Identity</AssemblyName>
    <AllowGlobals>False</AllowGlobals>
    <AllowLegacyWith>False</AllowLegacyWith>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <AllowUnsafeCode>False</AllowUnsafeCode>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v4.5</TargetFrameworkVersion>
    <Name>Moshine.Identity</Name>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <Optimize>false</Optimize>
    <OutputPath>.\bin\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
    <EnableAsserts>True</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <Optimize>true</Optimize>
    <OutputPath>.\bin\Release</OutputPath>
    <GeneratePDB>False</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <EnableAsserts>False</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="Dapper">
      <HintPath>..\packages\Dapper.1.13\lib\net45\Dapper.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.AspNet.Identity.Core">
      <HintPath>..\packages\Microsoft.AspNet.Identity.Core.1.0.0\lib\net45\Microsoft.AspNet.Identity.Core.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.CSharp" />
    <Reference Include="Microsoft.Owin">
      <HintPath>..\packages\Microsoft.Owin.2.0.2\lib\net45\Microsoft.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="mscorlib" />
    <Reference Include="Newtonsoft.Json">
      <HintPath>..\packages\Newtonsoft.Json.4.5.11\lib\net40\Newtonsoft.Json.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Owin">
      <HintPath>..\packages\Owin.1.0\lib\net40\Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="RemObjects.Oxygene.Dynamic">
      <HintPath>C:\Program Files\RemObjects Software\Oxygene\Echoes\Oxygene Reference Assemblies\RemObjects.Oxygene.Dynamic.dll</HintPath>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.Data" />
    <Reference Include="System.Data.SqlServerCe">
      <HintPath>C:\Program Files\Microsoft SQL Server Compact Edition\v4.0\Desktop\System.Data.SqlServerCe.dll</HintPath>
    </Reference>
    <Reference Include="System.Net.Http" />
    <Reference Include="System.Net.Http.Formatting">
      <HintPath>..\packages\Microsoft.AspNet.WebApi.Client.5.1.0\lib\net45\System.Net.Http.Formatting.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Transactions">
      <HintPath>C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.Transactions.dll</HintPath>
    </Reference>
    <Reference Include="System.Web.Http">
      <HintPath>..\packages\Microsoft.AspNet.WebApi.Core.5.1.0\lib\net45\System.Web.Http.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Web.Http.Owin">
      <HintPath>..\packages\Microsoft.AspNet.WebApi.Owin.5.1.0\lib\net45\System.Web.Http.Owin.dll</HintPath>
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
    <Compile Include="Models\IdentityRole.pas" />
    <Compile Include="Models\IdentityUser.pas" />
    <Compile Include="Properties\AssemblyInfo.pas" />
    <Compile Include="Repositories\RoleRepository.pas" />
    <Compile Include="Repositories\SqlCeRepository.pas" />
    <Compile Include="Repositories\UserClaimRepository.pas" />
    <Compile Include="Repositories\UserLoginRepository.pas" />
    <Compile Include="Repositories\UserRepository.pas" />
    <Compile Include="Repositories\UserRoleRepository.pas" />
    <Compile Include="Results\ChallengeResult.pas" />
    <Compile Include="RoleStore.pas" />
    <Compile Include="UserStore.pas" />
    <EmbeddedResource Include="Properties\Resources.resx">
      <Generator>ResXFileCodeGenerator</Generator>
    </EmbeddedResource>
    <Compile Include="Properties\Resources.Designer.pas" />
    <None Include="Properties\Settings.settings">
      <Generator>SettingsSingleFileGenerator</Generator>
    </None>
    <Compile Include="Properties\Settings.Designer.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Models" />
    <Folder Include="Results" />
    <Folder Include="Repositories" />
    <Folder Include="Properties\" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="packages.config">
      <SubType>Content</SubType>
    </Content>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>