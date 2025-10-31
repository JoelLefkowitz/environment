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

`require ∷ ∀ m. MonadEffect m ⇒ String → m String`

Lookup an environment variable:

```purs
import Node.Process.Environment (require)

require "EXAMPLE"
```

This will produce an `Effect.Exception` if the environment variable is not set (unlike `lookupEnv` from `Node.Process`):

```purs
file:///Effect.Exception/foreign.js:6
  return new Error(msg);
         ^
Error: Missing environment variable: EXAMPLE
    at Module.error (file:///Effect.Exception/foreign.js:6:10)
```

You can also check the value of `NODE_ENV` directly:

`lookup ∷ ∀ m. MonadEffect m ⇒ m Environment`

```purs
data Environment = Development | Production
```

```purs
import Node.Process.Environment as Environment

main ∷ Effect Unit
main = do
    environment ← Environment.lookup
    ...
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
