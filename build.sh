#!/bin/bash

if ! dotnet tool list | grep -q "^paket" ; then
    echo installing paket
    dotnet tool restore
    #dotnet tool install Paket --tool-path .paket --version 5.257.0

    # it would be best to just
    # - keep tool versions in .config/dotnet-tools.json
    # - run `dotnet tool restore` unconditionally to make sure specified version is installed
fi

if [ ! -f paket.lock ]; then
    echo 'running paket install (no paket.lock found)'
    #.paket/paket install
    dotnet paket install
fi

if [ ! -f packages/build/fake-cli/tools/netcoreapp2.1/any/fake-cli.dll ]; then
    echo running paket restore
    #.paket/paket install
    dotnet paket install
fi

dotnet packages/build/fake-cli/tools/netcoreapp2.1/any/fake-cli.dll build $@ 
