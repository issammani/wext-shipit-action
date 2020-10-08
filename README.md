# wext-shipit-action

A github action to automate the process of shipping web extensions based on the npm package [wext-shipit](https://github.com/LinusU/wext-shipit).

## Browser support

The action uses [wext-shipit](https://github.com/LinusU/wext-shipit) under the hood, so basically whatever browsers are supported the action supports or will eventually support.

[Check browser support table](https://github.com/LinusU/wext-shipit#implemented-browsers)

## Usage

In your .github/workflows yaml build file add the following:

```yml
name: My awesome github worklow !
on: push

jobs:
    build:
        runs-on: ubuntu-latest

        steps:
            - uses: actions/checkout@v2
            - uses: issammani/wext-shipit-action@master
              with:
                  # Chrome keys
                  wext-chrome-extension-id: ${{ secrets.wext-chrome-extension-id}}
                  wext-chrome-client-id: ${{ secrets.wext-chrome-client-id }}
                  wext-chrome-client-secret: ${{ secrets.wext-chrome-client-secret }}
                  wext-chrome-refresh-token: ${{ secrets.wext-chrome-refresh-token }}
                  wext-chrome-src: "dist" # Or set it in secrets
                  # Firefox keys
                  wext-firefox-jwt-issuer: ${{ secrets.wext-firefox-jwt-issuer }}
                  wext-firefox-jwt-secret: ${{ secrets.wext-firefox-jwt-secret }}
                  wext-firefox-src: "dist" # Or set it in secrets
                  #Opera keys
                  wext-opera-email: ${{ secrets.wext-opera-email }}
                  wext-opera-extension-id: ${{ secrets.wext-opera-extension-id }}
                  wext-opera-password: ${{ secrets.wext-opera-password }}
                  wext-opera-src: "dist" # Or set it in secrets
```

## Notes

-   None of the fields are required. So if you don't supply any, the action won't do anything.
-   You don't have to supply the credentials for all browsers. If you miss one, then the action will skip that browser.

## Inputs

|       **input field**       |      **description**      | **required** | **default value** |
| :-------------------------: | :-----------------------: | :----------: | :---------------: |
| `wext-chrome-extension-id`  |    Chrome extension id    |    false     |
|   `wext-chrome-client-id`   |     Chrome client id      |    false     |
| `wext-chrome-client-secret` |   Chrome client secret    |    false     |
| `wext-chrome-refresh-token` |   Chrome refresh token    |    false     |
|      `wext-chrome-src`      | Location of the extension |    false     | current directory |
|  `wext-firefox-jwt-issuer`  |      Firefox api key      |    false     |
|  `wext-firefox-jwt-secret`  |    Firefox api secret     |    false     |
|     `wext-firefox-src`      | Location of the extension |    false     | current directory |
|     `wext-opera-email`      |        Opera email        |    false     |
|  `wext-opera-extension-id`  |    Opera extension id     |    false     |
|    `wext-opera-password`    |      Opera password       |    false     |
|      `wext-opera-src`       | Location of the extension |    false     | current directory |

## Why use this action

    - Say good bye to submitting your extensions manually and add the submission as part of your workflow 🎈🎉!
    - It combines multiple major browsers (3 as of know) in one.
    - You needn't to worry about signing, listed signing, zipping...
    - **TL;DR** Signing listed extensions will fail in firefox but your extension will be updated 😕.

## Contributing

Thank you for making this repo better 💖💖

### Issues

Feel free to submit issues and enhancement requests.

### Pull requests

-   Fork the repo on GitHub
-   Clone the project to your own machine
-   Commit changes to your own branch
-   Push your work back up to your fork
-   Submit a Pull request so that we can review your changes

## License

MIT. [SEE LICENSE](/LICENSE)
