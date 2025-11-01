# Environment

Lookup Node.js environment variables.

![Review](https://img.shields.io/github/actions/workflow/status/JoelLefkowitz/environment/review.yaml)
![Version](https://pursuit.purescript.org/packages/purescript-environment/badge)
![Quality](https://img.shields.io/codacy/grade/a5865895553c4eefa94d384954cce9c5)

## Installing

```bash
spago install environment
```

## Usage

### Variables

`lookup ∷ ∀ m. MonadEffect m ⇒ String → String → m String`

Look up an environment variable with a fallback:

```purs
import Node.Process.Environment (lookup)

lookup "BASE_URL" "/"
```

`require ∷ ∀ m. MonadEffect m ⇒ String → m String`

Look up an environment variable, producing an `Effect.Exception` if it's missing:

```purs
import Node.Process.Environment (require)

require "BASE_URL"
```

```shell
file:///Effect.Exception/foreign.js:6
  return new Error(msg);
         ^
Error: Missing environment variable: BASE_URL
    at Module.error (file:///Effect.Exception/foreign.js:6:10)
```

Alternatively, if you want to return `Nothing` rather than a fallback or an error then `Node.Process` provides `lookupEnv`.

`lookupEnv :: String → Effect (Maybe String)`

### Environment

```purs
data Environment = Development | Production
```

`detect ∷ ∀ m. MonadEffect m ⇒ m Environment`

Detect and parse the value of the `NODE_ENV`

```purs
import Prelude
import Effect (Effect)
import Node.Process.Environment as Environment

main ∷ Effect Unit
main = do
    environment ← Environment.detect

    -- Do something environment specific ...
```

## Documentation

Documentation and more detailed examples are hosted on [Pursuit](https://pursuit.purescript.org/packages/purescript-environment).

## Tooling

### Dependencies

To install dependencies:

```bash
yarn install
yarn spago install
```

### Tests

To run tests:

```bash
yarn spago test
```

### Documentation

To generate the documentation locally:

```bash
yarn spago docs
```

### Linters

To run linters:

```bash
yarn lint
```

### Formatters

To run formatters:

```bash
yarn format
```

## Contributing

Please read this repository's [Code of Conduct](CODE_OF_CONDUCT.md) which outlines our collaboration standards and the [Changelog](CHANGELOG.md) for details on breaking changes that have been made.

This repository adheres to semantic versioning standards. For more information on semantic versioning visit [SemVer](https://semver.org).

Bump2version is used to version and tag changes. For example:

```bash
bump2version patch
```

### Contributors

- [Joel Lefkowitz](https://github.com/joellefkowitz) - Initial work

## Remarks

Lots of love to the open source community!

<div align='center'>
    <img width=200 height=200 src='https://media.giphy.com/media/osAcIGTSyeovPq6Xph/giphy.gif' alt='Be kind to your mind' />
    <img width=200 height=200 src='https://media.giphy.com/media/KEAAbQ5clGWJwuJuZB/giphy.gif' alt='Love each other' />
    <img width=200 height=200 src='https://media.giphy.com/media/WRWykrFkxJA6JJuTvc/giphy.gif' alt="It's ok to have a bad day" />
</div>
