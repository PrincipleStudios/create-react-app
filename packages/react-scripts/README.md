# @principlestudios/react-scripts-lib

React-scripts for making webpack libraries.

Use these via `npx create-react-app <app-name> --scripts-version @principlestudios/react-scripts-lib --template @principlestudios/typescript-lib` or another template.

These react-scripts automatically detect additional entry points for multi-page applications whose HTML is not controlled by the react-scripts themselves.

## Features

- Your entrypoints are detected within the source folder as `**/*.entrypoint.{js|jsx|ts|tsx}`.
- The entry points are named uniquely, using the file path under src. For example:
  - `src/App.entrypoint.tsx` becomes `App`
  - `src/nested/some-component.ts` becomes `nested_some_component`
- An app manifest is created for you at `<build>/asset-manifset.json`. Its structure looks similar to the following:

        {
          "files": {
            "static/js/0.442924c6.chunk.js": "/static/js/0.442924c6.chunk.js",
            "static/js/0.442924c6.chunk.js.map": "/static/js/0.442924c6.chunk.js.map",
            "App.css": "/static/css/App.fafd10be.css",
            "App.js": "/static/js/App.74322cf0.js",
            "App.js.map": "/static/js/App.74322cf0.js.map",
            "deep_App_test.css": "/static/css/deep_App_test.fafd10be.css",
            "deep_App_test.js": "/static/js/deep_App_test.41cedd8a.js",
            "deep_App_test.js.map": "/static/js/deep_App_test.41cedd8a.js.map",
            "static/js/3.c0ddb0b2.chunk.js": "/static/js/3.c0ddb0b2.chunk.js",
            "static/js/3.c0ddb0b2.chunk.js.map": "/static/js/3.c0ddb0b2.chunk.js.map",
            "static/css/App.fafd10be.css.map": "/static/css/App.fafd10be.css.map",
            "static/css/deep_App_test.fafd10be.css.map": "/static/css/deep_App_test.fafd10be.css.map",
            "static/js/0.442924c6.chunk.js.LICENSE.txt": "/static/js/0.442924c6.chunk.js.LICENSE.txt",
            "static/media/logo.6ce24c58.svg": "/static/media/logo.6ce24c58.svg"
          },
          "entrypoints": {
            "App": [
              "/static/js/0.442924c6.chunk.js",
              "/static/css/App.fafd10be.css",
              "/static/js/App.74322cf0.js"
            ],
            "deep_App_test": [
              "/static/js/0.442924c6.chunk.js",
              "/static/css/deep_App_test.fafd10be.css",
              "/static/js/deep_App_test.41cedd8a.js"
            ]
          }
        }

  - The files list is just that - a list of all the files built via the build process.
  - The entrypoints is a list of files that must be bootstrapped for each entry point to work. Some are scripts and some are styles.

- An ambient variable is added to the page with the default export from your entry point. The name of your entrypoint (above) is prefixed with `react_`.

  - `src/App.entrypoint.tsx` becomes `react_App`
  - `src/nested/some-component.ts` becomes `react_nested_some_component`

  This entrypoint depends on your template.
