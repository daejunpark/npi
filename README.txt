// Install Mono
// http://www.mono-project.com/docs/getting-started/install/linux/
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
$ echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
$ echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
$ sudo apt-get update
$ sudo apt-get install mono-complete


// Build Boogie/Houdini
$ unzip popl16ae.zip
$ cd popl16ae/Boogie

[edit Source/Houdini/Houdini.csproj]
[modify <HintPath>]
    <Reference Include="Microsoft.Z3, Version=2.0.4280.20829, Culture=neutral, processorArchitecture=x86">
      <SpecificVersion>False</SpecificVersion>                                                 
      <HintPath>../../Binaries/Microsoft.Z3.dll</HintPath>                                     
    </Reference>                                                                               
    <Reference Include="Newtonsoft.Json">                                                      
      <HintPath>../../Binaries/Newtonsoft.Json.dll</HintPath>                                  
    </Reference>   

$ xbuild Source/Boogie.sln

$ cd Binaries
$ wget https://github.com/Z3Prover/z3/releases/download/z3-4.4.0/z3-4.4.0-x64-ubuntu-14.04.zip
$ unzip z3-4.4.0-x64-ubuntu-14.04.zip
$ mv z3.exe z3.exe.orig
$ ln -s z3-4.4.0-x64-ubuntu-14.04/bin/z3 z3.exe


// Run Boogie
$ mono <path>/Boogie/Binaries/Boogie.exe <options> <pgm>.bpl

// Run Houdini
$ ./houdini.sh <pgm>.bpl


// Execute quantifier instantitation benchmark
$ cd qi
$ ./enum-all.sh
$ ./run-all.sh
$ ../report-all.sh


// Execute VCDryad benchmark
$ cd vcdryad
$ ./pred-gen-all.sh
$ ./run-all.sh
$ ../report-all.sh


// Generate Boogie files from C files of VCDryad benchmark
// Run a pre-built VCDryad binary in Windows:
$ VCDryad-bin\Binary\vcc.exe /translate <pgm>.c

// How to build VCDryad from source
 - Download VCDryad
   https://github.com/edgar-pek/VCDryad
 - Build VCDryad by consulting VCC build instruction:
   http://vcc.codeplex.com/wikipage?title=Build%20Instructions&referringTitle=Home
