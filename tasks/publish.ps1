#!/usr/bin/env pwsh

if ( "$(git status --porcelain)" ) {
  Write-Error "Your git status is not clean. Aborting.";
  exit 1;
}

Push-Location $PSScriptRoot/..
try
{
    Push-Location packages/react-scripts
    npm publish --access public
    Pop-Location

    Push-Location packages/cra-template
    npm publish --access public
    Pop-Location

    Push-Location packages/cra-template-typescript
    npm publish --access public
    Pop-Location

} finally {
    Pop-Location
}
